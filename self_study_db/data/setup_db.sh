psql -U postgres -c"CREATE DATABASE db1_1;"
psql -U postgres -c"CREATE DATABASE db1_2;"
psql -U postgres -c"CREATE DATABASE db3_1;"
psql -U postgres -c"CREATE DATABASE db3_2;"
psql -U postgres -c"CREATE DATABASE db8_1;"
psql -U postgres -c"CREATE DATABASE db8_2;"

psql -U postgres -d db1_1 -f /home/dump_db1_schema1.sql
psql -U postgres -d db1_2 -f /home/dump_db1_schema2.sql

psql -U postgres -d db3_1 -f /home/dump_db3_schema1.sql
psql -U postgres -d db3_2 -f /home/dump_db3_schema2.sql

psql -U postgres -d db8_1 -f /home/dump_db8_schema1.sql
psql -U postgres -d db8_2 -f /home/dump_db8_schema2.sql
