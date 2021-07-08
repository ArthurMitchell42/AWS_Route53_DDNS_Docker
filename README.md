# AWS_Route53_DDNS_Docker
## History
<table>
<thead>
<tr bgcolor="lightblue"><th align="center">Date</th>
<th>Version</th>
<th>Notes</th>
</tr>
</thead>
<tbody><tr>
<td align="left">8/7/21</td>
<td align="left">2.0.0.2</td>
<td align="left">Added support for docker health checking</td>
</tr>
</tbody></table>

## Set the environment variables in power shell
$env:AWS_ACCESS_KEY_ID = "XXXXXXXXXXXXXXXXXXXX" <br>
$env:AWS_SECRET_ACCESS_KEY="YYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY" <br>

## Set the environment variables in Linux shell
Variable for the credentials file <br>
env AWS_SHARED_CREDENTIALS_FILE <br>

## Build
docker build -t aws-route53-ddns . 

## Run
docker run -d \ <br>
    --name AWS_Route53_DDNS \ <br>
    -v "C:\Users\USERNAME\config:/config" \ <br>
    -e AWS_ACCESS_KEY_ID=XXXXXXXXXXXXXXXXXXXX \ <br>
    -e AWS_SECRET_ACCESS_KEY=YYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY \ <br>
    -e TZ=Europe/London \ <br>
    --restart unless-stopped \ <br>
    aws-route53-ddns <br>

## To tag and push it
docker login -u YOUR-USER-NAM <br>
docker tag aws-route53-ddns kronos443/aws-route53-ddns:amd64-latest <br>
docker push kronos443/aws-route53-ddns:amd64-latest <br>
