FROM dockenstack/base

RUN \
  wget https://repo.percona.com/apt/percona-release_0.1-3.$(lsb_release -sc)_all.deb && \
  dpkg -i percona-release_0.1-3.$(lsb_release -sc)_all.deb && \
  ln -fs /bin/true /usr/bin/chfn && \
  apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y percona-xtradb-cluster-client-5.6 \
  percona-xtradb-cluster-server-5.6 percona-xtrabackup percona-xtradb-cluster-garbd-3.x && \
  sed -i 's/^\(bind-address\s.*\)/# \1/' /etc/mysql/my.cnf && \
  rm -rf /var/lib/mysql/* && \
  rm -rf /var/log/mysql/*


# Define mountable directories.
VOLUME ["/var/lib/mysql", "/var/log/mysql"]

ADD . /app

# Define working directory.
WORKDIR /app

RUN chmod +x /app/bin/*

# Define default command.
CMD ["/app/bin/boot"]

# Expose ports.
EXPOSE 3306 4444 4567 4568
