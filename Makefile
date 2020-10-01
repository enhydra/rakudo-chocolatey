.PHONY: all
all: setup
	perl bin/cook_templates

.PHONY: setup
	cpan Mojo::URL XML::Entities

.PHONY: test
test:
	prove

.PHONY: push
push:
	cd cooked_templates && choco pack && choco push

.PHONY: clean
clean:
	del cooked_templates\*.nupkg cooked_templates\*.nuspec
