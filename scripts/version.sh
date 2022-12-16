#!/usr/bin/env bash

set -eu

BUILD_NUM=$(git rev-list --count HEAD)
echo "Num Commits: $BUILD_NUM"
BUILD_NUM=$((BUILD_NUM + 1000000))
echo "Build Number: $BUILD_NUM"
