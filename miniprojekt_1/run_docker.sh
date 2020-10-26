if [ -d "./db-data" ] 
then
    echo "db-data allready exists." 
else
    mkdir db-data
    echo "Created db-data dir"
fi

docker-compose up