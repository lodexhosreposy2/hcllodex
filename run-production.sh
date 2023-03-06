## Remove lodex container or image
docker rm lodex
docker rmi lodex

make fetch-latest-lodex
make custom-config
make start-prod