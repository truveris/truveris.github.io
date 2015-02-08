# Truveris Engineering Blog

This is the source repository for our engineering site. You should never
directly edit files within the `output/` folder nor should you change anything
on the `master` branch. They are used as a subtree repository for GitHub to use
as our user page, the folder is generated from `make output`.


## Directory structure
 * **Makefile**:       build, serve and publish rules
 * **bin/**:           tools and library used to administrate and render the site
 * **authors/**:       article authors
 * **site/**:          site templates
 * **site/articles/**: blog articles
 * **site/jobs/**:     Job positions


## Serve it locally
Make your changes in the `site/` directory while the following command is
running to see your updates directly without re-generating the output:

```shell
make serve
```


## Build the static site
Generates all the file in the root directory:

```shell
make
```


## Publish the static site to our GitHub user page
Do your update, commit, push then publish:

```shell
# vim site/...
make output
git commit -am "Things were done"
git push
make publish
```


## Adding a new author
Create a new folder named after your GitHub account in the `src/authors/`
folder and create the following files:
 * **name**: your full name
 * **email**: your email address


## Adding a new article
Create a new folder in the `src/site/posts/` folder and create the following files:
 * **author**: must contain your GitHub account name. A matching folder is
       required with meta data as defined above.
 * **illustration**: name of a file located in `site/lib/img/` used in the
       header of the article.  It is important to keep the same style, one
       should not just add any image as header.
 * **index.html**: this is the actual content of the article in HTML format,
       copy another article to get all the proper mako format and dependencies
       in place.
 * **timestamp**: when the article was created in ISO8601 format.
 * **short.html**: short introduction HTML used in the index page.
 * **description**: a couple of sentences describing the article (metadata).

Keep all the images related to this article in the same folder (minus the
illustration which should be generic enough to be re-usable).


## Adding a new page
If you need to extend the site outside of the above, create an `index.html` in
a folder within the `site/` folder.  It is important to come up with a simple
dash-separated name since it will be used as its permanent URL for the rest of
time.
