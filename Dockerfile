FROM python:3.12.0b3-alpine3.18
ENV AWS_CONFIG_PATH=/config/
ENV HEALTHCHECK_HEARTBEAT_FILE=/usr/src/app/heartbeat
ENV HEALTHCHECK_INTERVAL_FILE=/usr/src/app/max_age
ENV AWS_SHARED_CREDENTIALS_FILE=/config/credentials
ENV AWS_DOCKER_VERSION="2.2.1.0"
WORKDIR /usr/src/app
#RUN apk add nano
RUN apk add tzdata
#COPY requirements.txt ./
COPY ./app .
RUN pip install --no-cache-dir -r requirements.txt
RUN chmod +x healthcheck.sh
RUN rm put_python_app_here
RUN rm requirements.txt
HEALTHCHECK --start-period=60s --interval=360s --retries=2 CMD sh -c '/app/healthcheck.sh' 
CMD [ "python", "./AWS_Route53_DDNS.py" ]


#FROM alpine
#RUN apk update
#RUN apk upgrade
##RUN apk add nano
#RUN apk add tzdata
# ENV PYTHONUNBUFFERED=1
# RUN apk add --update --no-cache python3 py3-pip
# RUN python3 -m ensurepip
# #RUN pip3 install --no-cache --upgrade pip setuptools
# RUN pip3 install --no-cache --upgrade boto3
# RUN apk del py3-pip
# RUN rm /var/cache/apk/*
# ENV AWS_CONFIG_PATH=/config/
# ENV HEALTHCHECK_HEARTBEAT_FILE=/app/heartbeat
# ENV HEALTHCHECK_INTERVAL_FILE=/app/max_age
# ENV AWS_SHARED_CREDENTIALS_FILE=/config/credentials
# ENV AWS_DOCKER_VERSION="2.2.1.0"
# WORKDIR /app
# COPY ./app /app
# RUN chmod +x healthcheck.sh
# RUN rm put_python_app_here
# HEALTHCHECK --start-period=60s --interval=360s --retries=2 CMD sh -c '/app/healthcheck.sh' 
# CMD ["/app/AWS_Route53_DDNS.py"]
# ENTRYPOINT ["python3"]
