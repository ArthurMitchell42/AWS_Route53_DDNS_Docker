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
WORKDIR /app
COPY ./app /app
CMD ["/app/AWS_Route53_DDNS.py"]
ENTRYPOINT ["python3"]

