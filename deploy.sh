#!/bin/bash

WORKSPACE=$1

# get the docker
docker pull hemberglab/scrna.seq.course:latest
# run the docker
docker run hemberglab/scrna.seq.course:latest

# copy files from the docker
alias dl='docker ps -l -q'
docker cp `dl`:_book $WORKSPACE/docs
docker cp `dl`:blischak $WORKSPACE/docs/

# push changes to the website
git add docs/*
git commit -m "update the course website"
# git push origin master

# cleanup after docker usage
docker rm `dl`
docker rmi hemberglab/scrna.seq.course:latest
