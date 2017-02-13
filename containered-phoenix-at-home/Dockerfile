FROM sequenceiq/phoenix
MAINTAINER Sascha Kerbler


ENV JAVA_HOME /usr/java/default


# bootstrap-phoenix
ADD bootstrap-phoenix.sh /etc/bootstrap-phoenix.sh
RUN chown root:root /etc/bootstrap-phoenix.sh
RUN chmod +x /etc/bootstrap-phoenix.sh
ENTRYPOINT ["/etc/bootstrap-phoenix.sh"]

EXPOSE 16010 2181 60000 60010 60020 60030 16000 16201 2888 3888
