# -*- coding: utf8 -*-

import os

from setuptools import setup, find_packages

# Meta information
version = open("VERSION").read().strip()
dirname = os.path.dirname(__file__)

setup(
    # Basic info
    name="flowers-core",
    version=version,
    author="Marcin Niemira",
    author_email="marcin.niemira@gmail.com",
    url="https://github.com/n0npax/flowers",
    description="Flowers system core",
    long_description=open("README.md").read(),
    classifiers=[
        "Development Status :: 1 - Alpha",
        "Operating System :: POSIX",
        "Programming Language :: Python3",
    ],
    package_dir={"": "src"},
    packages=find_packages("src"),
    install_requires=open("requirements.txt").readlines(),
    extras_require={"dev": ["mock"]},
    # Data files
    package_data={
        "python_boilerplate": [
            "templates/*.*",
            "templates/license/*.*",
            "templates/docs/*.*",
            "templates/package/*.*",
        ]
    },
    # Scripts
    entry_points={},
    # Other configurations
    zip_safe=False,
    platforms="any",
)
