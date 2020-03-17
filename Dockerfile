FROM amazon/aws-for-fluent-bit:latest

ADD ./custom_conf/tail-file-to-datadog.conf /fluent-bit/configs/

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Optional Metrics endpoint
EXPOSE 2020

# Entry point
CMD /entrypoint.sh