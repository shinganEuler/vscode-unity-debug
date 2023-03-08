#!/bin/bash

# Read the current version from package.json
CURRENT_VERSION=$(node -p "require('./package.json').version")

# Use the `semver` npm package to increment the patch version
NEW_VERSION=$(npx semver $CURRENT_VERSION -i patch)

# Update the version in package.json
npx json -I -f package.json -e "this.version=\"$NEW_VERSION\""

# Output the new version number
echo "New version: $NEW_VERSION"

vsce publish

