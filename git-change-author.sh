#!/usr/bin/env bash

# script to rewrite entire branch history, replacing author of commits that were authored by someone with a specific email address
# I used this to fix my own commits made from computers that had different global settings
# code was slightly modified to only affect a single branch
# original code is available on git-towear.com as well as on github.com's help pages

git config user.name "SusinMat"
git config user.email "57694766+SusinMat@users.noreply.github.com"

git filter-branch --env-filter '
WRONG_EMAIL="XXXXXXXX@XXX.XX"
NEW_NAME="SusinMat"
NEW_EMAIL="57694766+SusinMat@users.noreply.github.com"

if [ "$GIT_COMMITTER_EMAIL" = "$WRONG_EMAIL" ]
then
	export GIT_COMMITTER_NAME="$NEW_NAME"
	export GIT_COMMITTER_EMAIL="$NEW_EMAIL"
fi
if [ "$GIT_AUTHOR_EMAIL" = "$WRONG_EMAIL" ]
then
	export GIT_AUTHOR_NAME="$NEW_NAME"
	export GIT_AUTHOR_EMAIL="$NEW_EMAIL"
fi
' --tag-name-filter cat --
