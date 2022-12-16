#!/usr/bin/env bash

set -eu pipefail

rm -rf build/web dist
mkdir dist

flutter pub run build_runner build

BUILD_NUM=$(git rev-list --count HEAD)
echo "Num Commits: $BUILD_NUM"
BUILD_NUM=$((BUILD_NUM + 1000000))
echo "Build Number: $BUILD_NUM"

# Build Web App
flutter build web --base-href /app/web/

jq '. + {build_number:$buildNumber}' --arg buildNumber "$BUILD_NUM" build/web/version.json >version.json
mv version.json build/web/
mv build/web dist/web

# Build WidgetBook screens
flutter build web --base-href /app/screens/ -t lib/main.widgetbook.dart

jq '. + {build_number:$buildNumber}' --arg buildNumber "$BUILD_NUM" build/web/version.json >version.json
mv version.json build/web/
mv build/web dist/screens

echo "{\"buildNum\":$BUILD_NUM, \"dt\": \"$(date --iso-8601=seconds)\"}" >dist/build
cat dist/build
