#
#
#

all: service

service:
	@bundle exec jekyll serve

.PHONY: clean

clean:
	@rm -Rf _site/
