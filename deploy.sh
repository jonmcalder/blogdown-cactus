#!/bin/bash
echo "$PATH"
if [ $(git symbolic-ref -q HEAD) = "refs/heads/master" ]
then
	  echo "you are on master, deploying production."
	  netlify deploy -t $NETLIFYKEY --path public
else 
    echo "you are not on master, deploying preview."
    netlify deploy -t $NETLIFYKEY --draft --path public
fi
