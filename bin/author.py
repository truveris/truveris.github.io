# Copyright 2015-2016, Truveris Inc. All Rights Reserved.

import os

import meta


class Author(object):

    """
    Author represents a single author loaded into memory with all its
    meta-data.
    """

    def __init__(self, username, name, email, avatar):
        self.username = username
        self.name = name
        self.email = email
        self.avatar = avatar


def get_author(username):
    """Return an author instance given a username."""

    path = os.path.join("authors", username)

    if not os.path.exists(path):
        raise meta.NotFound(path)

    author = Author(
        username=username,
        name=meta.read(os.path.join(path, "name")),
        email=meta.read(os.path.join(path, "email")),
        avatar=meta.read(os.path.join(path, "avatar")),
    )

    return author
