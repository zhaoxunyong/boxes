#!/bin/bash

DOCKER_BUILDKIT=0 docker build -t "registry.zerofinance.net/library/ubuntu:23.04" . -f Dockerfile.ubuntu
