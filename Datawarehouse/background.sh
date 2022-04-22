sudo apt update
sudo apt install mariadb-server -y
sudo systemctl start mariadb.service
echo "Starting MariaDB shell ..."
sudo mariadb