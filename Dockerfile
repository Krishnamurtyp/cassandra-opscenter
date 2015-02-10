FROM        ubuntu:14.04
MAINTAINER  Thomas Borg Salling <tbsalling@tbsalling.dk>

# Install OpsCenter
RUN apt-get -y -o Dpkg::Options::='--force-confold' dist-upgrade; \
    apt-get update; \
    apt-get -y upgrade; \
    apt-get -y install curl ssh; \
    echo "deb http://debian.datastax.com/community stable main" | sudo tee -a /etc/apt/sources.list.d/datastax.community.list; \
    curl -L http://debian.datastax.com/debian/repo_key | sudo apt-key add - ; \
    apt-get update; \
    apt-get -y install opscenter; \
    apt-get clean;

ADD start.sh /

# Expose OpsCenter
EXPOSE 8888 50031 61620

# Launch OpsCenter
ENTRYPOINT ["./start.sh"]
