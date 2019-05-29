#!/usr/bin/env bash

TAG=smcroute_build

if [[ ! -d "smcroute" ]]; then
    git clone https://github.com/troglobit/smcroute.git
fi

cd smcroute

git pull

git reset --hard

cd ..

docker build -t ${TAG} .

docker run -d --name ${TAG} ${TAG}

docker exec -it ${TAG} /srv/_build.sh

rm -fr install

docker cp ${TAG}:/srv/install install

docker rm -f ${TAG}
