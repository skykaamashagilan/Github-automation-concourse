#!/bin/bash

echo "Creating GITHUB repository"
git config --global credential.helper store
cat <<EOT >>~/.git-credentials
https://$github_username_encoded:$github_pat@github.com
EOT



export GH_TOKEN=$env.token # ???? .token was taken from AWS secret manager and passed to jenkins pipeline. How it works in concourse?
ssh-keygen -t rsa -f $key -N ''

gh repo create $repo --private --clone --add-readme
gh repo deploy-key add $pub_key -w -t $pub_key -R $repo                                                             
