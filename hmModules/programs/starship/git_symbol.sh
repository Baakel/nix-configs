#!/bin/bash

# Get the remote origin URL
REMOTE_URL=$(git remote get-url origin 2>/dev/null)

if [[ "$REMOTE_URL" == *gitlab* ]]; then
    echo "";
elif [[ "$REMOTE_URL" == *github* ]]; then
    echo ""
else
    echo "󰊢"
fi
# GIT_REMOTE=$(command git ls-remote --get-url 2> /dev/null)
# if [[ "$GIT_REMOTE" =~ "github" ]]; then
#     GIT_REMOTE_SYMBOL=" "
# elif [[ "$GIT_REMOTE" =~ "gitlab" ]]; then
#     GIT_REMOTE_SYMBOL=" "
# elif [[ "$GIT_REMOTE" =~ "bitbucket" ]]; then
#     GIT_REMOTE_SYMBOL=" "
# elif [[ "$GIT_REMOTE" =~ "git" ]]; then
#     GIT_REMOTE_SYMBOL=" "
# else
#     GIT_REMOTE_SYMBOL=" "
# fi
# echo "$GIT_REMOTE_SYMBOL"

