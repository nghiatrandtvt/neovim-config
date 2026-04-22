#!/bin/sh

BASE_URL='<commit-url>'
XDG_COMMAND='microsoft-edge'

commit_hash=$1
change_id=$(git show -s $commit_hash | awk '/Change-Id:/ {print $2}')

url="$BASE_URL"/"$change_id"
echo "openning $url"

$XDG_COMMAND $url
