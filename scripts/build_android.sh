#!/usr/bin/env bash

set -eu pipefail

BUILD_NUM=$(git rev-list --count HEAD)
echo "Num Commits: $BUILD_NUM"
BUILD_NUM=$((BUILD_NUM + 1000000))
echo "Build Number: $BUILD_NUM"

flutter pub run build_runner build
flutter build appbundle --build-number="$BUILD_NUM"
flutter build apk --build-number="$BUILD_NUM"
