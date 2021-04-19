echo "Installing the server controller setup..."
sudo apt-get update && sudo apt-get upgrade -y
sudo apt-get install supervisor -y 
sudo apt-get install python3-pip -y
sudo apt-get install python3-virtualenv -y
sudo pip3 install flask
sudo pip3 install pyfirmata 
sudo pip3 install RPi.GPIO  
sudo pip3 install gunicorn
git clone https://github.com/adafruit/Adafruit_Python_DHT
echo "Install nginx"
sudo apt-get install nginx nginx-full -y 
sudo systemctl start nginx 
sudo systemctl enable nginx 
sudo systemctl status nginx 
sudo cp -R /home/ubnutu/supervisor -t /etc/
sudo cp -R /home/ubuntu/nginx -t /etc/
sudo mkdir /var/log/Servercontol
sudo supervisorctl reread 
sudo service supervisor restart
sudo nginx -t 
sudo service nginx restart
echo "ufw fire wall setting and port"
sudo ufw enable
sudo ufw status 
sudo ufw allow 80
sudo ufw allow 81
sudo ufw allow 8000
sudo ufw allow ssh 
sudo ufw status

