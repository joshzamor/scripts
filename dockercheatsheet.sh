#!/bin/bash

# for bash in OSX, source in ~/.bash_profile
dockerPsLike() {
  docker ps -a --filter name=$1
}

dockerPsLikeIdOnly() {
  docker ps -a -q --filter name=$1
}

dockerImageGrep() {
  docker images | grep -i $1
}

dockerImageGrepRm() {
  dockerImageGrep $1 | awk '{print $3}' | xargs docker rmi
}

dockerStopAndRm() {
    docker rm $(docker stop $1)
}

dockerStopAndRmAll() {
  docker stop $(docker ps -a -q)
  docker rm $(docker ps -a -q)
}

dockerVolumeClean() {
  docker volume rm $(docker volume ls -qf dangling=true)
}

dockerStats() {
  docker stats $(docker ps --format '{{.Names}}')
}

# connect to docker-machine (uncomment below lines if using docker-machine
#echo 'connecting to docker-machine'
#eval $(docker-machine env)

# handy alias
alias dps="docker ps -a"
alias dpslike=dockerPsLike
alias dockerclean="docker images | grep \"<none>\" | awk '{print $3}' | xargs docker rmi"
alias dstoprmall=dockerStopAndRmAll
alias dstoprm=dockerStopAndRm
alias dvolclean=dockerVolumeClean
alias dimglike=dockerImageGrep
alias dimglikerm=dockerImageGrepRm
alias dstats=dockerStats
