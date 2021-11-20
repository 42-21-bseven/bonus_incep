if [ ! -f /tmp/create_ln ]; then
ln -s /etc/nginx/sites-available/xz_site.conf /etc/nginx/sites-enabled/xz_site.conf
rm -Rf /etc/nginx/sites-enabled/default
touch /tmp/create_ln
fi

if [ ! -f /tmp/create_ssl ]; then
mkdir /etc/nginx/ssl/
openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/nginx/ssl/private.pem -keyout /etc/nginx/ssl/public.key -subj "/C=RU/L=KAZAN/OU=21school/"
openssl rsa -noout -text -in /etc/nginx/ssl/public.key
touch /tmp/create_ssl
fi