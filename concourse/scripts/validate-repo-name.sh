#!/bin/bash

echo "Checking the new GITHUB repository name matches the below naming conventions"
git config --global credential.helper store
cat <<EOT >>~/.git-credentials
https://$github_username_encoded:$github_pat@github.com
EOT

# varaibles:
folder=$folder_name
unit=$unit
repo_name= "ita-jenkins-$unit-$folder-cicd"
startswith= "ita-jenkins-$unit"
endswith= "$folder-cicd"

# condition to check the repository naming conventions.
if [[ $repo_name == "$startswith"* ]] && [[ $repo_name == *"$endswith" ]]; then
    echo "You have inserted a valid name for repository"
else
    echo "Entered repository name is invalid"
fi

printf '%*.0s\n' 50 "" | tr " " "#"




