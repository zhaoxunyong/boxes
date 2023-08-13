#!/bin/bash

DOCKER_BUILDKIT=0 docker build -t "registry.zerofinance.net/library/centos:7" . -f Dockerfile.centos
