# Admin

```sh
sudo sed -i '/^job.execinfo.server.enabled=/s/false/true/g' /opt/gobblin/conf/yarn/reference.conf
```

```sh
mysql -ve 'CREATE DATABASE IF NOT EXISTS gobblin' -u root -p
mysql -ve "CREATE USER 'gobblin'@'%' IDENTIFIED BY 'gobblin'" -u root -p
mysql -ve "GRANT ALL PRIVILEGES ON gobblin.* TO 'gobblin'@'%'" -u root -p
mysql -ve 'FLUSH PRIVILEGES' -u root -p
```

```sh
sudo tee -a /opt/gobblin/conf/yarn/application.conf << EOF
# Job history server
job.history.store.enabled=true
job.history.store.url="jdbc:mysql://127.0.0.1:3306/gobblin?useSSL=false"
job.history.store.jdbc.driver=com.mysql.jdbc.Driver
job.history.store.user=gobblin
job.history.store.password=gobblin

rest.server.host=127.0.0.1
rest.server.port=8080

# Enable admin web server
admin.server.enabled=true
EOF
```

```sh
sudo systemctl restart gobblin-yarn
```

```sh
curl http://127.0.0.1:8080/jobExecutions/idType=JOB_NAME&id.string=TestJobName&limit=10
```
