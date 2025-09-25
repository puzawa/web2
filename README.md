ssh s413039@helios.cs.ifmo.ru -p 2222  

ssh -p 2222 s413039@helios.cs.ifmo.ru -L 8080:localhost:41393  

httpd -f ~/httpd-root/conf/httpd.conf -k start  

java -DFCGI_PORT=41393 -jar /home/studs/s413039/httpd-root/fcgi-bin/FcgiServer.jar  

