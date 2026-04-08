
for v in "8.1" "8.2" "8.3" "8.4";do
    docker push ghcr.io/devertix/phpenv-mssql-oracle:$v
done
