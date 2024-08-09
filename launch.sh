#!/bin/bash

[ -z $(which docker-compose) ] && echo "ERR: docker-compose is not installed" && exit 1

docker-compose down
[ $? -ne 0 ] && echo "ERR: Couldn't STOP" && exit 4

[ "$1" = "stop" ] && exit 0

[ -z $(which git) ] && echo "ERR: git is not installed" && exit 1
[ -z $(which curl) ] && echo "ERR: curl is not installed" && exit 1

if [ "$1" = "clean" ]; then
    rm -rf ./api
    rm -rf ./www
    echo "CLEANED"
    exit 0
fi

[ ! -e ./mfdb.sql ] && echo "ERR: Initial SQL doesn't exist!" && exit 3

if [ ! -d ./api ]; then
    git clone https://github.com/adiliso/MasalFood.git ./api
else
    git -C ./api pull -f
    [ -e ./api/main.jar ] && rm ./api/main.jar
    curl -L $(curl -s https://api.github.com/repos/adiliso/MasalFood/releases/latest | grep "browser_download_url.*jar" | cut -d : -f 2,3 | tr -d \") -o ./api/main.jar
fi

if [ ! -d ./www ]; then
    git clone https://github.com/Mirali44/MasalFood.git ./www
else
    [ -d ./www/dist ] && rm -rf ./www/dist
    git -C ./www pull -f
fi

docker run -it --rm -v $(pwd)/www:/www -w /www node:slim "npm install && npm run build"
if [ $? -ne 0 ] || [ ! -d ./www/dist ] && echo "ERR: Couldn't build node project" && exit 2

docker-compose up -d
[ $? -ne 0 ] && echo "ERR: Couldn't docker-compose up!" && exit 5
echo "UP"
exit 0