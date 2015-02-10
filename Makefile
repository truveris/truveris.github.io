# Copyright 2015, Truveris Inc. All Rights Reserved.

all: output

output: venv css
	rm -rf output
	git clone --branch master git@github.com:truveris/truveris.github.io.git
	venv/bin/python bin/blog gen -f site/ output/

serve: venv
	venv/bin/python bin/blog serve -f site/ -p 8889

venv:
	virtualenv venv
	venv/bin/pip install https://github.com/truveris/pygreen/archive/master.zip
	venv/bin/pip install python-dateutil

publish: output
	git -C output/ add output/ || true
	git -C output/ commit -m "sync output" || true
	git -C output/ push

clean:
	rm -rf output

css:
	scss --no-cache --unix-newlines --style=compressed \
		site/lib/scss/style.scss \
		> site/lib/css/style.css.tmp
	mv site/lib/css/style.css.tmp site/lib/css/style.css

.PHONY: output clean serve
