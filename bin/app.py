from pygreen import PyGreen


class BlogApp(PyGreen):

    """
    Override of the default PyGreen app giving us more control.
    """

    def __init__(self):
        PyGreen.__init__(self)
        self.file_exclusion += [
            r".*/description$",
            r".*/title$",
            r".*/author$",
            r".*/illustration$",
            r".*/short.html$",
            r".*/timestamp$",
            r".*/canonical$",
            r".*\.scss$",
            r".*\.codekit$",
            r".*\.rb$",
        ]

        self.template_exts.add("xml")

    def add_url_rules(self):
        """We define the routes below instead."""
        pass
