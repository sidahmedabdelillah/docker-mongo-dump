FROM mongo:latest


USER root

# Install CRON
RUN apt-get update && \
    apt-get install -y cron && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

COPY ./dump.sh /

RUN sed -i 's/\r$//' /dump.sh && chmod +x /dump.sh

CMD ["sudo ./dump.sh"] 