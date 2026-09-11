ci: clean stage deps test-github-action test-github-action-partials

clean:
	rm -rf stage/

clean-github-action:
	rm -rf stage/github-action/

clean-github-action-partials:
	rm -rf stage/github-action-partials/

stage:
	mkdir -p stage/

deps:
	npm install .

########################################
# Utility targets
########################################

GENERATOR_CONFIG ?= actobat.yml

define set_generator_vars
$(1): GENERATOR_COMPONENT = $$(shell yq .generator.component $(2))
$(1): GENERATOR_INPUTS_PROJECT_ID = $$(shell yq .generator.inputs.project_id $(2))
$(1): GENERATOR_INPUTS_PROJECT_NAME = $$(shell yq .generator.inputs.project_name $(2))
$(1): GENERATOR_INPUTS_PROJECT_DESC = $$(shell yq .generator.inputs.project_desc $(2))
$(1): GENERATOR_INPUTS_AUTHOR_NAME = $$(shell yq .generator.inputs.author_name $(2))
$(1): GENERATOR_INPUTS_AUTHOR_EMAIL = $$(shell yq .generator.inputs.author_email $(2))
$(1): GENERATOR_INPUTS_AUTHOR_URL = $$(shell yq .generator.inputs.author_url $(2))
$(1): GENERATOR_INPUTS_GITHUB_ID = $$(shell yq .generator.inputs.github_id $(2))
$(1): GENERATOR_INPUTS_GITHUB_REPO = $$(shell yq .generator.inputs.github_repo $(2))
$(1): GENERATOR_INPUTS_GITHUB_TOKEN_PREFIX = $$(shell yq .generator.inputs.github_token_prefix $(2))
endef

generate-github-action: clean-github-action
	node_modules/.bin/plop github-action

$(eval $(call set_generator_vars,generate-github-action-with-config,$(GENERATOR_CONFIG)))
generate-github-action-with-config: clean-github-action
	node_modules/.bin/plop $(GENERATOR_COMPONENT) -- \
	    --project_id "$(GENERATOR_INPUTS_PROJECT_ID)" \
		--project_name "$(GENERATOR_INPUTS_PROJECT_NAME)" \
		--project_desc "$(GENERATOR_INPUTS_PROJECT_DESC)" \
		--author_name "$(GENERATOR_INPUTS_AUTHOR_NAME)" \
		--author_email "$(GENERATOR_INPUTS_AUTHOR_EMAIL)" \
		--author_url "$(GENERATOR_INPUTS_AUTHOR_URL)" \
		--github_id "$(GENERATOR_INPUTS_GITHUB_ID)" \
		--github_repo "$(GENERATOR_INPUTS_GITHUB_REPO)" \
		--github_token_prefix "$(GENERATOR_INPUTS_GITHUB_TOKEN_PREFIX)"

generate-github-action-partials: clean-github-action-partials
	node_modules/.bin/plop github-action-partials

$(eval $(call set_generator_vars,generate-github-action-partials-with-config,$(GENERATOR_CONFIG)))
generate-github-action-partials-with-config: clean-github-action-partials
	node_modules/.bin/plop $(GENERATOR_COMPONENT) -- \
	    --project_id "$(GENERATOR_INPUTS_PROJECT_ID)" \
		--project_name "$(GENERATOR_INPUTS_PROJECT_NAME)" \
		--project_desc "$(GENERATOR_INPUTS_PROJECT_DESC)" \
		--author_name "$(GENERATOR_INPUTS_AUTHOR_NAME)" \
		--author_email "$(GENERATOR_INPUTS_AUTHOR_EMAIL)" \
		--author_url "$(GENERATOR_INPUTS_AUTHOR_URL)" \
		--github_id "$(GENERATOR_INPUTS_GITHUB_ID)" \
		--github_repo "$(GENERATOR_INPUTS_GITHUB_REPO)" \
		--github_token_prefix "$(GENERATOR_INPUTS_GITHUB_TOKEN_PREFIX)"

test-github-action: clean-github-action
	make generate-github-action-with-config GENERATOR_CONFIG=examples/actobat-github-action.yml
	cd stage/github-action/ && \
	  make deps ci

test-github-action-partials: clean-github-action-partials
	make generate-github-action-partials-with-config GENERATOR_CONFIG=examples/actobat-github-action-partials.yml

update-actobat-to-latest:
	cd templates/github-action/ && make update-to-latest

.PHONY: ci clean clean-github-action clean-github-action-partials stage deps generate-github-action generate-github-action-with-config generate-github-action-partials generate-github-action-partials-with-config test-github-action test-github-action-partials update-actobat-to-latest
