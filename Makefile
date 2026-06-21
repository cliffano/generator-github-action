ci: clean stage deps test-github-action

clean:
	rm -rf stage/

clean-github-action:
	rm -rf stage/github-action/

stage:
	mkdir -p stage/

deps:
	npm install .

generate-github-action: clean-github-action
	node_modules/.bin/plop github-action

test-github-action:
	node_modules/.bin/plop github-action -- \
	    --project_id "github-action project ID" \
		--project_name "github-action project name" \
		--project_desc "github-action project description" \
		--author_name "Cliffano Subagio" \
		--author_email "blah@cliffano.com" \
		--github_id "cliffano" \
		--github_repo "generator-github-action"
	cd stage/github-action/ && \
	  make ci

.PHONY: ci clean clean-github-action stage deps generate-github-action test-github-action