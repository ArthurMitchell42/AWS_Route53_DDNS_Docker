copy Dockerfile_Ubuntu Dockerfile
docker buildx create --name mybuilder --use
docker buildx build --platform linux/amd64,linux/arm64,linux/arm/v7 -t kronos443/aws-route53-ddns:V2.2.1.0 --push .
