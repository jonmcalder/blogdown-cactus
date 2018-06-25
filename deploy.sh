#!/bin/bash
echo "$PATH"
echo "You are on branch"
echo $(git symbolic-ref -q HEAD)
if [[ $(git symbolic-ref -q HEAD) = "refs/heads/master" ]]
then
	  echo "you are on master, deploying production."
	  netlify deploy -t $NETLIFYKEY
else 
    echo "you are not on master, deploying preview."
    netlify deploy -t $NETLIFYKEY --draft
fi
