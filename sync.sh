#!/bin/bash
PASSWORD=password
docker exec -it moein_db_1 mysql -u root --password=$PASSWORD  -e"INSERT INTO db1.User   (lastname, firstname , username) SELECT lastname,  firstname,  username   FROM db2.User   WHERE username NOT IN (SELECT username  FROM db1.User);"
docker exec -it moein_db_1 mysql -u root --password=$PASSWORD  -e"INSERT INTO db2.User   (lastname, firstname , username) SELECT lastname,  firstname,  username   FROM db1.User   WHERE username NOT IN (SELECT username  FROM db2.User);"

docker exec -it moein_db_1 mysql -u root --password=$PASSWORD  -e"select * from db1.User;"
docker exec -it moein_db_1 mysql -u root --password=$PASSWORD  -e"select * from db2.User;"
