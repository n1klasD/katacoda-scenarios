sudo apt-get update > /dev/null
sudo apt-get install mariadb-server -y > /dev/null
sudo systemctl start mariadb.service
echo Installed MariaDB ...