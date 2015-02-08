# Copyright 2015, Truveris Inc. All Rights Reserved.

import os

import meta


class Author(object):

    """
    Author represents a single author loaded into memory with all its
    meta-data.
    """

    def __init__(self, username, name, email):
        self.username = username
        self.name = name
        self.email = email


def get_author(username):
    """Return an author instance given a username."""

    path = os.path.join("authors", username)

    if not os.path.exists(path):
        raise meta.NotFound(path)

    author = Author(
        username=username,
        name=meta.read(os.path.join(path, "name")),
        email=meta.read(os.path.join(path, "email")),
    )

    return author
