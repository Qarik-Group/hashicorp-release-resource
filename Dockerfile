FROM alpine

RUN apk add --no-cache curl bash jq

COPY in check /opt/resource/
RUN chmod +x /opt/resource/*
