# Copyright 2015, Truveris Inc. All Rights Reserved.

import os

import meta


class JobNotFound(Exception):
    pass


class Job(object):

    """
    Job represents a single job offer loaded into memory with all its
    meta-data.
    """

    def __init__(self, job_id, title):
        self.job_id = job_id
        self.title = title


def get_job(job_id):
    """Return a job instance given a job_id."""

    path = os.path.join("site", "jobs", job_id)

    if not os.path.exists(path):
        raise meta.NotFound(path)

    job = Job(
        job_id=job_id,
        title=meta.read(os.path.join(path, "title")),
    )

    return job


def get_jobs(path):
    """All directories in the given folder are assumed to be jobs. Missing meta
    data will cause fatal error.

    """
    jobs = []

    for dirname in os.listdir(path):
        job_path = os.path.join(path, dirname)
        if not os.path.isdir(job_path):
            continue
        jobs.append(get_job(dirname))

    return jobs
