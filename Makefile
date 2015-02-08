# Copyright 2015, Truveris Inc. All Rights Reserved.

all: output

output: venv
	rm -rf output
	venv/bin/python bin/blog gen -f site/ output/

serve: venv
	venv/bin/python bin/blog serve -f site/ -p 8889

venv:
	virtualenv venv
	venv/bin/pip install https://github.com/truveris/pygreen/archive/master.zip
	venv/bin/pip install python-dateutil

publish: output
	git commit output -m "sync output" || true
	git push
	git subtree push --prefix output/ origin master

clean:
	rm -rf output

css:
	scss --no-cache --unix-newlines --style=compressed \
		site/lib/scss/style.scss \
		> site/lib/css/style.css.tmp
	mv site/lib/css/style.css.tmp site/lib/css/style.css

.PHONY: output clean serve
