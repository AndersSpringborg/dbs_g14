# RUN
Just run the two commands under docker setup
## docker setup
- install docker
- `docker-compose up -d`
- `docker exec -it self_study_db_db_1 /bin/bash /home/setup_db.sh`
### ip
  - server_ip: db
  - username: postgres
  - password: postgres
## pgadmin
- login
  - username: admin@admin.com
  - password: admin
  - ![](assets/login.png)
- connect to db
  - ![](assets/create_server4.png)
  - login
    - host: db
    - username: postgres
    - password: postgres
  - ![](assets/db_connect.png)
  
