#!/bin/bash

option_dist=stable
option_debRepositoryUrl=http://deb.debian.org/debian/

## checks for -OPTARG{VALUE}
#script -aVALUE1 -bVALUE2
#while getopts a:b: flag
while getopts d: flag
do
    case "${flag}" in
        d) option_dist=${OPTARG};;
        *)
            echo "Usage: $0 [-h] [-i value] [-f filename]" >&2
            exit 1;;
    esac
done
option_name=debian-${option_dist}-base

##output all space separated line items
i=1;
for arg in "$@"; do
    #echo "arg[$i]=$arg";
    i=$((i + 1));
done

echo "building chroot image for Debian with debootstrap : ${option_name} : repository at ${option_debRepositoryUrl}"
sudo debootstrap ${option_dist} /tmp/${option_name}-root  http://deb.debian.org/debian/

echo "importing image into docker as : ${option_name}"
sudo tar -C /tmp/${option_name}-root -c . |  sudo docker import - ${option_name}

docker-clean

echo "testing it"
docker run -it --rm ${option_name} uname -a

echo "checking list of docker images"
docker images | grep ${option_name}

