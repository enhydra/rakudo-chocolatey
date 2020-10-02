.PHONY: cook
cook: setup  ## cook the templates
	perl bin/cook_templates

.PHONY: setup
setup:
	cpan -T Mojo::URL XML::Entities

.PHONY: test
test: ## run tests on the package
	prove

.PHONY: push
push: cook ## push the package to chocolatey
	cd cooked_templates && choco pack && choco push

.PHONY: clean
clean: ## remove the cooked templates
	del cooked_templates\*.nupkg cooked_templates\*.nuspec
