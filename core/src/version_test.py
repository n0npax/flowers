import semver
from version import version


def test_version():
    version_dict = semver.parse(version)
    assert version_dict
