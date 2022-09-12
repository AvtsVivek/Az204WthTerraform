echo "Starting to execute scripts"
sudo systemctl stop firewalld
sudo systemctl disable firewalld

echo "Adding repo to config manager"

sudo dnf config-manager --add-repo=https://download.docker.com/linux/centos/docker-ce.repo

echo "Adding repo to config manager - DONE"

echo "Starting to install docker-ce "

sudo dnf install docker-ce -y

echo "Starting to install docker-ce - DONE "

echo "Starting to install docker-ce-cli "

sudo dnf install docker-ce-cli -y

echo "Starting to install docker-ce-cli - DONE "

echo "Starting to install containerd.io"

sudo dnf install containerd.io -y

echo "Starting to install containerd.io - DONE "

echo "Starting to install docker-compose-plugin"

sudo dnf install docker-compose-plugin -y

echo "Starting to install docker-compose-plugin - DONE "

sudo systemctl start docker

sudo systemctl start firewalld
sudo systemctl enable firewalld

sudo iptables -t filter -F
sudo iptables -t filter -X
sudo systemctl restart docker

echo "Starting docker nginx conainer "

sudo docker run --name appnginx -p 80:80 -d nginx

echo "Starting docker nginx conainer - DONE"

echo "Building the custom mysql docker image "

sudo docker build -t mysqlwithdata:v1 /tmp/ -f /tmp/Dockerfile

echo "Building the custom mysql docker image - DONE"

echo "Starting docker mysql conainer "

sudo docker run --name mysql-instance -p 3306:3306 --restart on-failure -d -e MYSQL_ROOT_PASSWORD=H@Sh1CoR3! mysqlwithdata:v1

echo "Starting docker mysql conainer - DONE"