## Remove previous build cache, container and image
docker builder prune -f
docker stop lodex-lodex-1
docker rm lodex-lodex-1
docker rmi lodex-lodex

make fetch-latest-lodex
make custom-config
make setup-theme
chmod 777 lodex/upload
make start-prod