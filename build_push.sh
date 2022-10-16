docker buildx create --name mybuilder --use
docker buildx build --platform linux/amd64,linux/arm64,linux/arm/v7 --tag kronos443/aws-route53-ddns:test --push .
