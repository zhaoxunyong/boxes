#!/bin/bash

DOCKER_BUILDKIT=0 docker build -t dave/docker . -f Dockerfile.docker
