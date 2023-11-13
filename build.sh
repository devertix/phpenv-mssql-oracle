
for v in "8.1" "8.2";do
    cd $v && docker build -t devertix/phpenv-mssql-oracle:$v . && cd ..
done
