#!/bin/bash

set -e

GITHUB_TOKEN=$1
FOLDER=$2
BASE=$(pwd)
GITHUB_REPO="moon-base-software.github.io"
GITHUB_USERNAME="keefmoon"

git config --global user.email "keef@keefmoon.com"
git config --global user.name "$GITHUB_USERNAME"

echo "Folder: $FOLDER"
echo "Git Config Set"

CLONE_DIR="__DeploymentRepo__"

echo "Token: $GITHUB_TOKEN"

# clone, delete files in the clone, and copy (new) files over
# this handles file deletions, additions, and changes seamlessly
git clone --depth 1 https://$GITHUB_USERNAME:$GITHUB_TOKEN@github.com/$GITHUB_USERNAME/$GITHUB_REPO.git $CLONE_DIR &> /dev/null
cd $CLONE_DIR

echo "Repo Cloned: $GITHUB_REPO"

find . | grep -v ".git" | grep -v "^\.*$" | xargs rm -rf # delete all files (to handle deletions in monorepo)

echo "Existing files removed"

cp -r $BASE/$FOLDER/. .

echo "Copied: $FOLDER"

# echo "custom-domain.com" > CNAME
# echo "Add CNAME"

# Commit if there is anything to
if [ -n "$(git status --porcelain)" ]; then
echo  "  Committing $FOLDER to $GITHUB_REPO"
git add .
git commit --message "Update $FOLDER to $GITHUB_REPO"
git push origin master
echo  "  Completed push"
else
echo "  No changes, skipping push"
fi

cd $BASE