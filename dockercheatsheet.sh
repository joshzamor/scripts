#!/bin/bash

# for bash in OSX, source in ~/.bash_profile

dockerStopAndRm() {
    docker rm $(docker stop $1)
}

dockerStopAndRmAll() {
  docker stop $(docker ps -a -q)
  docker rm $(docker ps -a -q)
}

# connect to docker-machine (uncomment below lines if using docker-machine
#echo 'connecting to docker-machine'
#eval $(docker-machine env)

# handy alias
alias dps="docker ps -a"
alias dockerclean="docker images | grep \"<none>\" | awk '{print $3}' | xargs docker rmi"
alias dstoprmall=dockerStopAndRmAll
alias dstoprm=dockerStopAndRm
