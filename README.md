## build
docker build -t i1185 .

# run the following command and don't kill until you get the log
docker run -p 80:80 -p 9000:9000 -v "$PWD":/var/www/html --name xdebug1185 i1185

# find your docker's ip (this could vary depending in your configuration)
docker machine ls
docker machine ip default

# RUN the script with debugging

# Obtain the xdebug.log
docker exec -it xdebug-1185 cat /tmp/xdebug.log > xdebug.log

