#!/bin/bash

echo "Checking the new GITHUB repository name matches the below naming conventions"
git config --global credential.helper store
cat <<EOT >>~/.git-credentials
https://$github_username_encoded:$github_pat@github.com
EOT

# varaibles:
folder=$folder_name
repo_name="cec-azure-$unit-$folder-terraform"
startswith="cec-azure-$unit"
endswith="$folder-terraform"

# condition to check the repository naming conventions.
if [[ $repo_name == "$startswith"* ]] && [[ $repo_name == *"$endswith" ]]
then
    echo "You have inserted a valid name for repository"
    exit 0
else
    echo "Entered repository name is invalid"
    exit 1
fi

printf '%*.0s\n' 50 "" | tr " " "#"




