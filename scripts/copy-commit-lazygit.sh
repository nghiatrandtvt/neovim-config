#!/bin/sh

BASE_URL='<url>'

commit_hash=$1
change_id=$(git show -s $commit_hash | awk '/Change-Id:/ {print $2}')

url="$BASE_URL"/"$change_id"
echo "$url" | xclip -selection clipboard

echo "Copied $url to clipboard"
