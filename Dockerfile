FROM ubi9/ubi:latest

USER 0

ENV DELAY=10 HOME=/opt/app MEMORY=512m CPUS=1 TIME=30

RUN mkdir -p /opt/app
COPY load_cpu.sh load_memory.sh start.sh /opt/app
RUN chmod g+x /opt/app/* && \
    chgrp -R 0 /opt/app

WORKDIR /opt/app

CMD /opt/app/start.sh $MEMORY $CPUS $TIME

USER 1000