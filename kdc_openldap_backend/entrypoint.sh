# create Kerberos admin stash file. Default OpenLDAP admin password is admin ([see README](https://github.com/osixia/docker-openldap#create-new-ldap-server))
printf "admin\nadmin\nadmin" | kdb5_ldap_util -D cn=admin,dc=example,dc=com -H ldap://openldap.com create -subtrees dc=example,dc=com -r EXAMPLE.COM -s
printf "admin\nadmin\nadmin" | kdb5_ldap_util -D cn=admin,dc=example,dc=com stashsrvpw -f /var/kerberos/krb5kdc/admin_stash.keyfile cn=admin,dc=example,dc=com
