"""This module contains the api route handlers."""


def hello(x: str = "friend") -> str:
    """This function takes an input and says hello.
    Args:
        x (str): Input name to say hello to.

    Returns:
        str: Hello statement.
    """
    return f"Hello there, {x}."
