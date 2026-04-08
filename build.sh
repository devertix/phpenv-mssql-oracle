
for v in "8.1" "8.2" "8.3" "8.4";do
    cd $v && docker buildx build --platform=linux/amd64 -t ghcr.io/devertix/phpenv-mssql-oracle:$v . && cd ..
done
