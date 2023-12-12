#!/usr/bin/env sh

# GitVersion などの説明
# https://faun.pub/automated-app-versioning-using-gitversion-gitflow-mandatory-practice-not-an-optional-2feb5c64c94f

# Docker を使用した GitVersion (`/showvariable FullSemVer` は上記記事より)
# https://gitversion.net/docs/usage/cli/installation

semver=$(docker run --rm -v "$(pwd):/repo" gittools/gitversion:5.6.6 /repo /showvariable FullSemVer)

echo "git tag ${semver}"
