"""Testing module for the api functionality."""

from web import api


def test_hello() -> None:
    """
    This function tests that the hello() function
    performs as expected with input and its default value.
    """
    assert api.hello("Nick") == "Hello there, Nick."
    assert api.hello() == "Hello there."
