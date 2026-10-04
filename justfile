#!/usr/bin/env just --justfile

list:
  @just --list --unsorted --justfile {{justfile()}}

alias s := serve
alias q := query
alias d := docs
alias db := docker_build
alias du := docker_up
alias dd := docker_down


# lance le serveur directement, sans docker :
serve:
  uv run uvicorn app.main:app --reload


# requête un endpoint :
query:
    curl http://127.0.0.1:8000/now | jq "."


# auto-documentation du backend :
docs:
    xdg-open http://127.0.0.1:8000/docs




docker_build:
    docker compose build

docker_up:
    docker compose up

docker_down:
    docker compose down
