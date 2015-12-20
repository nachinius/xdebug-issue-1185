FROM library/php:5.6-apache

#RUN apt-get -qqy update && apt-get -qqy install \ 
#libpq-dev \
#    libmcrypt-dev \
#    libxml2-dev \
#    ssl-cert \
#    vim \
#    git \
#    mc \
#    && rm -r /var/lib/apt/lists/*

# compile and add xdebug
RUN pecl install xdebug 
ENV XDEBUG_INI "/usr/local/etc/php/conf.d/xdebug.ini"
ADD xdebug.ini ${XDEBUG_INI}

# configure apache and vhosts
RUN a2ensite 000-default 
#&& a2ensite 000-default default-ssl

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_RUN_DIR /var/run/apache2
ENV APACHE_PID_FILE /var/run/apache2/apache2.pid
ENV APACHE_LOCK_DIR /var/lock/apache2

ENTRYPOINT ["apache2-foreground"]

# expose xdebug port (make it equal to what appears in xdebug.ini)
EXPOSE 9000
ADD index.php /var/www/html/index.php

