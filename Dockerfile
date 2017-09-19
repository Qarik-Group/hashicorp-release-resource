FROM alpine

COPY in check /opt/resource/
RUN chmod +x /opt/resource/*
