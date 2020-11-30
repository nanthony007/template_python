"""This is the main module for our web application."""


import typing

from fastapi import FastAPI
import graphene
from starlette.graphql import GraphQLApp

from web import api

app = FastAPI()

class Query(graphene.ObjectType):
    hello = graphene.String(name=graphene.String(default_value="stranger"))

    def resolve_hello(self, info, name):
        return "Hello " + name

@app.get("/home")
async def home() -> typing.Dict[str, str]:
    """This main route simply returns a hellp message."""
    return {"message": api.hello()}

app.add_route("/", GraphQLApp(schema=graphene.Schema(query=Query)))
