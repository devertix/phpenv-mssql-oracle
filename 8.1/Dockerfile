FROM ghcr.io/devertix/phpenv:8.1

RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add - && curl https://packages.microsoft.com/config/ubuntu/20.04/prod.list > /etc/apt/sources.list.d/mssql-release.list && \
    apt-get update && \
    ACCEPT_EULA=Y DEBIAN_FRONTEND=noninteractive apt-get install -y --allow-unauthenticated msodbcsql18 unixodbc-dev php8.1-dev php-pear && \
    update-alternatives --set php /usr/bin/php8.1 && \
    pecl install sqlsrv-5.12.0 && pecl install pdo_sqlsrv-5.12.0 && \
    echo "extension=sqlsrv.so" > /etc/php/8.1/mods-available/sqlsrv.ini && \
    echo "extension=pdo_sqlsrv.so" > /etc/php/8.1/mods-available/pdo_sqlsrv.ini && \
    phpenmod sqlsrv && phpenmod pdo_sqlsrv && chmod go+rw /tmp
