#!/bin/bash

# for bash in OSX, source in ~/.bash_profile

dockerStopAndRm() {
    docker rm $(docker stop $1)
}

# connect to docker-machine

echo 'connecting to docker-machine'
eval $(docker-machine env)

# handy alias
alias dps="docker ps -a"
alias dockerclean="docker images | grep \"<none>\" | awk '{print \$3}' | xargs docker rmi"
alias dstoprm=dockerStopAndRm
