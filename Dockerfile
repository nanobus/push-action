FROM nanobus/nanobus:latest

#SET WORKDIR to value from env variable name BUS_PATH

ENV OCI_REGISTRIES 'CANDLE'
ENV CANDLE_HOSTNAME 'reg.candle.run'
ENV CANDLE_USERNAME $REGISTRY_USERNAME
ENV CANDLE_PASSWORD $REGISTRY_PASSWORD

COPY $BUS_PATH/ /app

WORKDIR /app
#RUN "export CANDLE_HOSTNAME=`grep -Eo 'registry: (.*)' bus.yaml | cut -d ' ' -f2`"

ENTRYPOINT ["/app/nanobus", "push"]