# Copyright 2015, Truveris Inc. All Rights Reserved.


class NotFound(Exception):
    """Triggered when a requested meta data is not found."""
    def __init__(self, path):
        self.path = path
        super(NotFound, self).__init__()


def read(path, should_fail_if_missing=True):
    """Return the content of a file, striped of spaces and new-lines."""
    try:
        with open(path) as fp:
            return fp.read().strip()
    except:
        if not should_fail_if_missing:
            return None
        raise NotFound(path)
