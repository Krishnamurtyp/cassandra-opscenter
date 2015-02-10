FROM        ubuntu:14.04
MAINTAINER  Thomas Borg Salling <tbsalling@tbsalling.dk>

# Install OpsCenter
RUN apt-get update; \
    apt-get -y -o Dpkg::Options::='--force-confold' dist-upgrade; \
    apt-get -y install python wget libjna-java openjdk-7-jre-headless java-common; \
    cd /opt; \
    wget http://downloads.datastax.com/community/opscenter-5.0.2.tar.gz; \
    tar zxf opscenter-5.0.2.tar.gz; \
    rm opscenter-5.0.2.tar.gz; \
    apt-get clean; \ 
    echo "sleep infinity" >> /opt/opscenter-5.0.2/bin/opscenter

# Expose OpsCenter
EXPOSE 8888

# Launch OpsCenter
ENTRYPOINT ["/opt/opscenter-5.0.2/bin/opscenter"]
