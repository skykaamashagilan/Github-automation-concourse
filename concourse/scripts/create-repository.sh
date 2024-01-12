#!/bin/bash

echo "Creating GITHUB repository"
git config --global credential.helper store
cat <<EOT >>~/.git-credentials
https://$github_username_encoded:$github_pat@github.com
EOT

# varaibles:
key="github-$unit-$folder-dk"
pub_key="github-$unit-$folder-dk.pub"
repo="cec-azure-$unit-$folder-terraform"

withAwsSecret([secret_id: "github/github-ita-cicdbot/token",type: "keyvalue"]) {
    export GH_TOKEN=$env.token

    gh repo create $repo --private --clone --add-readme
    gh repo deploy-key add $pub_key -w -t $pub_key -R $repo                                                             
}

printf '%*.0s\n' 50 "" | tr " " "#"