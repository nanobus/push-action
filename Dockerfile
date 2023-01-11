FROM nanobus/nanobus:latest

#SET WORKDIR to value from env variable name BUS_PATH

ENV OCI_REGISTRIES 'CANDLE'
ENV CANDLE_USERNAME $REGISTRY_USERNAME
ENV CANDLE_PASSWORD $REGISTRY_PASSWORD

WORKDIR $BUS_PATH
RUN "export CANDLE_HOSTNAME=`grep -Eo 'registry: (.*)' bus.yaml | cut -d ' ' -f2`"

ENTRYPOINT ["/app/nanobus", "push", "|", "grep", "-Eo", "'Pushing (.*)'", "|", "cut", "-d", "' '", "-f2"]