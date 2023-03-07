## Remove lodex previous lodex folder, container and image
rm -rf lodex
docker rm lodex-lodex-1
docker rmi lodex-lodex

make fetch-latest-lodex
make custom-config
make start-prod