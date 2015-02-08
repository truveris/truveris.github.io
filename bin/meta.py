# Copyright 2015, Truveris Inc. All Rights Reserved.


class NotFound(Exception):
    """Triggered when a requested meta data is not found."""
    def __init__(self, path):
        self.path = path
        super(NotFound, self).__init__()


def read(path):
    """Return the content of a file, striped of spaces and new-lines."""
    try:
        with open(path) as fp:
            return fp.read().strip()
    except:
        raise NotFound(path)
