FROM centos
MAINTAINER Andreas Knapp <andy.knapp.ak@gmail.com>

RUN echo "#!/bin/sh\nexit 0" > /usr/sbin/policy-rc.d
RUN yum update -y
#RUN yum install -y krb5-libs krb5-workstation krb5-server && \
#    yum install -y krb5-server-ldap krb5-pkinit

COPY krb5.conf /etc/krb5.conf
COPY kdc.conf /var/kerberos/krb5kdc/kdc.conf
COPY kadmin5.acl /var/kerberos/kadmin5.acl

COPY entrypoint.sh /
#ENTRYPOINT ["/entrypoint.sh"]
#RUN chmod +x entrypoint.sh

EXPOSE 749 88
