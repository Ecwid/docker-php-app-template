FROM php:fpm

ADD zz-www.conf /usr/local/etc/php-fpm.d/

RUN DEBIAN_FRONTEND=noninteractive apt-get update \
  && debconf-set-selections -v /tmp/nullmailer_conf \
  && apt-get -o Dpkg::Options::="--force-confold" -yq install --no-install-recommends -y python-pip \
  && apt-get install -y libpq-dev libmcrypt-dev libxml2-dev php-soap\
  && docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql \
  && docker-php-ext-install pdo pdo_pgsql pgsql mcrypt soap\
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


# Prepare startup script
RUN echo 'start\nexec php-fpm' > /usr/local/bin/startup.sh \
  && chmod 700 /usr/local/bin/startup.sh

CMD ["/usr/local/bin/startup.sh"]
