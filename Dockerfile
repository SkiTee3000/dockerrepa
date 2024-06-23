FROM        ghcr.io/pterodactyl/yolks:java_21

LABEL       author="Test" maintainer="Test@Test.Test"

LABEL       org.opencontainers.image.source="https://github.com/SkiTee3000/dockerrepa"
LABEL       org.opencontainers.image.licenses=MIT
LABEL       org.opencontainers.image.description="This Yolk is made for Pterodactyl panel as part of GravitLauncher Egg. Based on official Pterodactyl yolk for Java"

USER        root
RUN         apt update && apt install -y osslsigncode unzip

ENV         JMODS_DIR=/usr/share/openjfx/jmods
ENV         JMODS_URL=https://download2.gluonhq.com/openjfx/21/openjfx-21_linux-x64_bin-jmods.zip

RUN         curl -L ${JMODS_URL} -o openjfx.zip \
            && unzip openjfx.zip && rm openjfx.zip \
            && mkdir -p ${JMODS_DIR} \
            && cp javafx-jmods-21/* ${JMODS_DIR}

USER        container

CMD         [ "/bin/bash", "/entrypoint.sh" ]
