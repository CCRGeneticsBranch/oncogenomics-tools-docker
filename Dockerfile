FROM debian:11-slim
RUN apt-get update && apt-get install -y apache2 apache2-utils apache2-dev mariadb-client\
    pkg-config libmariadb-dev gcc git vim wget rsync libapache2-mod-wsgi-py3 python3-pip\
    && apt-get clean \
    && apt-get autoremove \
    && rm -rf /var/lib/apt/lists/*

COPY ./app /var/www/html/app
WORKDIR /var/www/html/app
RUN pip install --upgrade pip && pip install -r requirements.txt
COPY ./ogtools.conf /etc/apache2/sites-available/ogtools.conf
RUN a2enmod wsgi
RUN a2ensite ogtools.conf
RUN a2enmod headers
RUN a2enmod rewrite
RUN echo 'alias ll="ls -l"' >> ~/.bashrc
RUN echo 'alias log="tail -f /var/log/apache2/error.log"' >> ~/.bashrc

RUN mkdir -p /mnt/otl
COPY ./app/mount /mnt/otl
RUN chown -R www-data /mnt/otl
RUN chown -R www-data /var/www/html/app/ogtools

EXPOSE 80

WORKDIR /var/www/html
CMD  /usr/sbin/apache2ctl -D FOREGROUND

