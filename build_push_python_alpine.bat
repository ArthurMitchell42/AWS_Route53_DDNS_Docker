copy Dockerfile_Python_Alpine Dockerfile
docker buildx create --name mybuilder --use
docker buildx build --platform linux/amd64,linux/arm64,linux/arm/v7 -t kronos443/aws-route53-ddns:latest --push .
