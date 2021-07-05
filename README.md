# AWS_Route53_DDNS_Docker
# Set the environment variables in power shell
$env:AWS_ACCESS_KEY_ID = "XXXXXXXXXXXXXXXXXXXX" <br>
$env:AWS_SECRET_ACCESS_KEY="YYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY" <br>

# Set the environment variables in Linux shell
Variable for the credentials file <br>
env AWS_SHARED_CREDENTIALS_FILE <br>

# Build
docker build -t aws-route53-ddns . 

# Run
docker run -d --name AWS_Route53_DDNS -v "C:\Users\USERNAME\config:/config" -e AWS_ACCESS_KEY_ID=XXXXXXXXXXXXXXXXXXXX -e AWS_SECRET_ACCESS_KEY=YYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY -e TZ=Europe/London --restart unless-stopped aws-route53-ddns <br>

# To tag and push it
docker login -u YOUR-USER-NAM <br>
docker tag aws-route53-ddns kronos443/aws-route53-ddns:amd64-latest <br>
docker push kronos443/aws-route53-ddns:amd64-latest <br>
