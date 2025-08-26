FROM ghcr.io/devertix/phpenv:8.4

RUN curl -sSL https://packages.microsoft.com/keys/microsoft.asc \
    | gpg --dearmor \
    | tee /usr/share/keyrings/microsoft.gpg > /dev/null

RUN echo "deb [arch=amd64 signed-by=/usr/share/keyrings/microsoft.gpg] https://packages.microsoft.com/ubuntu/24.04/prod noble main" \
    > /etc/apt/sources.list.d/microsoft.list

RUN apt-get update && \
    ACCEPT_EULA=Y DEBIAN_FRONTEND=noninteractive apt-get install -y --allow-unauthenticated msodbcsql18 unixodbc-dev php8.4-dev php-pear && \
    update-alternatives --set php /usr/bin/php8.4 && \
    pecl install sqlsrv-5.12.0 && pecl install pdo_sqlsrv-5.12.0 && \
    echo "extension=sqlsrv.so" > /etc/php/8.4/mods-available/sqlsrv.ini && \
    echo "extension=pdo_sqlsrv.so" > /etc/php/8.4/mods-available/pdo_sqlsrv.ini && \
    phpenmod sqlsrv && phpenmod pdo_sqlsrv && chmod go+rw /tmp
