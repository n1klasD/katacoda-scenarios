sudo apt update > /dev/null
sudo apt install mariadb-server -y > /dev/null
sudo systemctl start mariadb.service
echo "Installed MariaDB ..."