FROM simplyintricate/nginx-php

ENV BASEDIR /usr/share/nginx/html
ENV PHPMYADMIN_MAJOR 4.4
ENV PHPMYADMIN_MINOR 15

WORKDIR ${BASEDIR}

RUN apt-get update && apt-get install -y curl
RUN curl -L -o phpmyadmin.tar.gz "http://sourceforge.net/projects/phpmyadmin/files/phpMyAdmin/${PHPMYADMIN_MAJOR}.${PHPMYADMIN_MINOR}/phpMyAdmin-${PHPMYADMIN_MAJOR}.${PHPMYADMIN_MINOR}-all-languages.tar.gz"
RUN tar -xvzf phpmyadmin.tar.gz && mv phpMyAdmin-${PHPMYADMIN_MAJOR}.${PHPMYADMIN_MINOR}-all-languages/* . && rm -rf phpMyAdmin-${PHPMYADMIN_MAJOR}.${PHPMYADMIN_MINOR}-all-languages

RUN chown -R www-data:www-data ${BASEDIR}
