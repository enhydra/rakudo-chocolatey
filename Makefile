.PHONY: cook
cook:  ## cook the templates
	perl bin/cook_templates

.PHONY: setup
setup:
	cpan -T Mojo::URL XML::Entities

.PHONY: test
test: cook ## run tests on the package
	prove

.PHONY: pack ## push the package to chocolatey
pack: cook
	cd cooked_templates && choco pack

.PHONY: push
push: pack ## push the package to chocolatey
	cd cooked_templates && choco push

.PHONY: clean
clean: ## remove the cooked templates
	del cooked_templates\*.nupkg cooked_templates\*.nuspec
