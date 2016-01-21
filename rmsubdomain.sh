#! /bin/bash
DOCROOT="/var/www/sites"
echo -ne "Subdomain (FQDN)"
read SUBDOMAIN
echo -ne "BEWARE! This step can't be undone"
echo -ne "Are you sure? (Yes/No)"
read YESNO
if [ $YESNO=="Yes" ]
	then
	echo "Removing configs"
	rm -rf /etc/httpd/conf.vhost.d/$SUBDOMAIN.conf
	echo "Deleting directories"
	rm -rf $DOCROOT/$SUBDOMAIN
fi

systemctl restart httpd
