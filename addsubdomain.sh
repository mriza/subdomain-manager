#! /bin/bash
DOCROOT="/var/www/sites"
echo -ne "Subdomain (FQDN)"
read SUBDOMAIN
mkdir -p $DOCROOT/$SUBDOMAIN/html $DOCROOT/$SUBDOMAIN/logs
echo "<VirtualHost *:80>" >> /etc/httpd/conf.vhost.d/$SUBDOMAIN.conf
echo "  DocumentRoot $DOCROOT/$SUBDOMAIN/html" >> /etc/httpd/conf.vhost.d/$SUBDOMAIN.conf
echo "  ServerName $SUBDOMAIN" >> /etc/httpd/conf.vhost.d/$SUBDOMAIN.conf
echo "  ErrorLog $DOCROOT/$SUBDOMAIN/logs/$SUBDOMAIN-error_log" >> /etc/httpd/conf.vhost.d/$SUBDOMAIN.conf
echo "  CustomLog $DOCROOT/$SUBDOMAIN/logs/$SUBDOMAIN-access_log common" >> /etc/httpd/conf.vhost.d/$SUBDOMAIN.conf
echo "  <Directory \"$DOCROOT/$SUBDOMAIN/html\">" >> /etc/httpd/conf.vhost.d/$SUBDOMAIN.conf
echo "    AllowOverride All" >> /etc/httpd/conf.vhost.d/$SUBDOMAIN.conf
echo "    Order allow,deny" >> /etc/httpd/conf.vhost.d/$SUBDOMAIN.conf
echo "    Allow from all" >> /etc/httpd/conf.vhost.d/$SUBDOMAIN.conf
echo "  </Directory>" >> /etc/httpd/conf.vhost.d/$SUBDOMAIN.conf
echo "</VirtualHost>" >> /etc/httpd/conf.vhost.d/$SUBDOMAIN.conf

systemctl restart httpd
