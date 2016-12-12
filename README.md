# mysql

## create mysql container
docker run -it -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v $HOME/.Xauthority:/root/.Xauthority -v $HOME/project/mysql:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=test -P --name mysql_test amostsai/mysql


## create webserver container and link mysql container
docker run -it -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v $HOME/.Xauthority:/root/.Xauthority -P --net=host --name stmtca -v  /home/amos/project/stmtca:/app amostsai/flask
