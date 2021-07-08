FROM ubuntu
RUN apt-get update
RUN apt-get install -y tzdata
RUN apt-get install python3 -y --no-install-recommends 
RUN apt-get install pip -y --no-install-recommends 
RUN pip install boto3
RUN apt-get remove python3-pip -y
RUN apt-get autoremove -y
RUN rm -rf /var/lib/apt/lists/*
ENV AWS_CONFIG_PATH=/config/
ENV HEALTHCHECK_HEARTBEAT_FILE=/app/heartbeat
ENV AWS_DOCKER_VERSION="2.0.0.1"
WORKDIR /app
COPY ./app /app
HEALTHCHECK --start-period=60s --interval=360s --retries=2 CMD sh -c '/app/healthcheck.sh' 
CMD ["/app/AWS_Route53_DDNS.py"]
ENTRYPOINT ["python3"]
