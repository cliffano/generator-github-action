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

generate-github-action: clean-github-action
	node_modules/.bin/plop github-action

generate-github-action-partials: clean-github-action-partials
	node_modules/.bin/plop github-action-partials

test-github-action:
	node_modules/.bin/plop github-action -- \
	    --project_id "github-action project ID" \
		--project_name "github-action project name" \
		--project_desc "github-action project description" \
		--author_name "Cliffano Subagio" \
		--author_email "blah@cliffano.com" \
		--author_url "https://github.com/cliffano" \
		--github_id "cliffano" \
		--github_repo "generator-github-action" \
		--github_token_prefix "STUDIO"
	cd stage/github-action/ && \
	  make ci

test-github-action-partials:
	node_modules/.bin/plop github-action-partials -- \
	    --project_id "github-action project ID" \
		--project_name "github-action project name" \
		--project_desc "github-action project description" \
		--author_name "Cliffano Subagio" \
		--author_email "blah@cliffano.com" \
		--author_url "https://github.com/cliffano" \
		--github_id "cliffano" \
		--github_repo "generator-github-action" \
		--github_token_prefix "STUDIO"

update-actobat-to-latest:
	cd templates/github-action/ && make update-to-latest

.PHONY: ci clean clean-github-action clean-github-action-partials stage deps generate-github-action generate-github-action-partials test-github-action test-github-action-partials update-actobat-to-latest
