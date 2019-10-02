import pytest
import semver
from version import *


def test_version():
    v = version()
    version_dict = semver.parse(v)
    assert version_dict
