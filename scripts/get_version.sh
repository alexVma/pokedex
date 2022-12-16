#!/usr/bin/env bash

set -eu

NUM=$1
BUILD_NUM=$(git rev-list --count HEAD)
git show "HEAD~$((BUILD_NUM - NUM))"
