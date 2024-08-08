# linux/amd64 for online server
docker build --platform linux/amd64 \
--file ./Dockerfile \
-t app .