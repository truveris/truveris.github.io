# Copyright 2015, Truveris Inc. All Rights Reserved.

import os
import re
from email import utils
import time

import dateutil.parser

import meta
from author import get_author


class Article(object):

    """
    Article represents a single article loaded into memory with all its
    meta-data.
    """

    def __init__(self, name, title, author, description, illustration,
                 timestamp, canonical):
        self.name = name
        self.title = title
        self.author = author
        self.description = re.sub(r"[\n\t ]+", " ", description)
        self.illustration = illustration
        self.canonical = canonical

        self.url = os.path.join("/", "articles", self.name) + "/"

        self.date = dateutil.parser.parse(timestamp)
        self.date_iso = self.date.isoformat()
        self.date_us = self.date.strftime("%B %d, %Y")
        self.date_rfc0822 = utils.formatdate(time.mktime(self.date.timetuple()))


def get_article(path):
    """Return an article instance given a path."""
    if not os.path.exists(path):
        raise meta.NotFound(path)

    article = Article(
        name=os.path.basename(path),
        title=meta.read(os.path.join(path, "title")),
        author=meta.read(os.path.join(path, "author")),
        description=meta.read(os.path.join(path, "description")),
        illustration=meta.read(os.path.join(path, "illustration")),
        timestamp=meta.read(os.path.join(path, "timestamp")),
        canonical=meta.read(
            os.path.join(path, "canonical"),
            should_fail_if_missing=False,
        ),
    )

    article.author = get_author(article.author)

    return article


def get_articles(path):
    """All directories in the given folder are assumed to be articles. Missing
    meta data will cause fatal error.

    """
    articles = []

    for dirname in os.listdir(path):
        article_path = os.path.join(path, dirname)
        if not os.path.isdir(article_path):
            continue
        articles.append(get_article(article_path))

    articles.sort(key=lambda a: a.date, reverse=True)

    return articles
