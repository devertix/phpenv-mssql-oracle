FROM devertix/phpenv:8.1

RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add - && curl https://packages.microsoft.com/config/ubuntu/20.04/prod.list > /etc/apt/sources.list.d/mssql-release.list && \
    apt-get update && \
    ACCEPT_EULA=Y DEBIAN_FRONTEND=noninteractive apt-get install -y -o DPkg::Options::=--force-confdef php8.1-fpm && \
    ACCEPT_EULA=Y DEBIAN_FRONTEND=noninteractive apt-get install -y --allow-unauthenticated msodbcsql17 unixodbc-dev php8.1-dev php-pear && \
    update-alternatives --set php /usr/bin/php8.1 && \
    pecl install sqlsrv-5.10.0 && pecl install pdo_sqlsrv-5.10.0 && \
    echo "extension=sqlsrv.so" > /etc/php/8.1/mods-available/sqlsrv.ini && \
    echo "extension=pdo_sqlsrv.so" > /etc/php/8.1/mods-available/pdo_sqlsrv.ini && \
    phpenmod sqlsrv && phpenmod pdo_sqlsrv && chmod go+rw /tmp

COPY files/ /

ENV LD_LIBRARY_PATH="/usr/local/instantclient"

RUN unzip /build/instantclient-basic-linux.x64-12.2.0.1.0.zip -d /usr/local/ && \
    unzip /build/instantclient-sqlplus-linux.x64-12.2.0.1.0.zip -d /usr/local/ && \
    unzip /build/instantclient-sdk-linux.x64-12.2.0.1.0.zip -d /usr/local/ && \
    ln -s /usr/local/instantclient_12_2 /usr/local/instantclient && \
    ln -s /usr/local/instantclient/libclntsh.so.12.1 /usr/local/instantclient/libclntsh.so && \
    ln -s /usr/local/instantclient/sqlplus /usr/bin/sqlplus && \
    rm -rf /build && \
    apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --allow-unauthenticated libaio-dev && \
    echo 'instantclient,/usr/local/instantclient' | pecl install oci8-3.2.0 && \
    echo 'extension=oci8.so' > /etc/php/8.1/mods-available/oci8.ini && \
    phpenmod oci8 && \
    apt-get autoclean
