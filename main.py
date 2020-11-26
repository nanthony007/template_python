"""This is the main module for our web application."""


import typing

from fastapi import FastAPI

from web import api

app = FastAPI()


@app.get("/")
async def root() -> typing.Dict[str, str]:
    """This main route simply returns a hellp message."""
    return {"message": api.hello()}
