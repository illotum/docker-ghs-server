FROM amazoncorretto:19.0.0-alpine

ARG SERVER_ARTIFACT
ARG CLIENT_ARTIFACT

WORKDIR /root

ADD $SERVER_ARTIFACT ./
ADD $CLIENT_ARTIFACT ./ghs/gloomhavensecretary/

ENTRYPOINT java -jar $HOME/ghs-server-*.jar -Djava.awt.headless=true

VOLUME $HOME/.ghs
EXPOSE 8080 8081
