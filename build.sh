
for v in "8.1" "8.2";do
    cd $v && docker build -t ghcr.io/devertix/phpenv-mssql-oracle:$v . && cd ..
done
