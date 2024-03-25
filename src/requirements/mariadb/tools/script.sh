set -a
source .env
set +a
service mysql start;

# create a database (if the database does not exist)
echo "1"
mysql -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"
sleep 2

# create an user with a password (if the user does not exist)
echo "2"
mysql -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';"
sleep 2
# give all privileges to the user
echo "3"
mysql -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"
sleep 2
#modify sql database
echo "4"
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"
sleep 2
#reload the database
echo "5"
sleep 2
#shutdown
echo "6"
mysqladmin -u root -p$SQL_ROOT_PASSWORD shutdown
sleep 2
#use exec to 
echo "7"
#exec mysqld_safe
