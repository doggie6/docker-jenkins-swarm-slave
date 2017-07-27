FROM home1oss/ci-ubuntu:16.04

MAINTAINER youhouhouhou

RUN sed -i 's/http:\/\/archive.ubuntu.com\/ubuntu\//http:\/\/mirrors.163.com\/ubuntu\//g' /etc/apt/sources.list

ENV SWARM_CLIENT_VERSION="3.3" \
    COMMAND_OPTIONS="" \
    USER_NAME_SECRET="" \
    PASSWORD_SECRET=""

RUN adduser -G root -D jenkins && \
    wget -q https://repo.jenkins-ci.org/releases/org/jenkins-ci/plugins/swarm-client/${SWARM_CLIENT_VERSION}/swarm-client-${SWARM_CLIENT_VERSION}.jar -P /home/jenkins/


VOLUME ["/opt/node","/opt/maven","/home/jenkins/"]

COPY run.sh /run.sh
RUN chmod +x /run.sh

CMD ["/run.sh"]