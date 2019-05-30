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

mkdir -p install/sbin

docker cp ${TAG}:/sbin/smcroute install/sbin/smcroute
docker cp ${TAG}:/sbin/smcroutectl install/sbin/smcroutectl
docker cp ${TAG}:/sbin/smcrouted install/sbin/smcrouted

docker rm -f ${TAG}
