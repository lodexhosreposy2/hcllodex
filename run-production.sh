## Remove lodex previous lodex folder, container and image
rm -rf lodex
docker stop lodex-lodex-1
docker rm lodex-lodex-1
docker rmi lodex-lodex

make fetch-latest-lodex
make custom-config
chmod 777 lodex/upload
make start-prod