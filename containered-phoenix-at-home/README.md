#Avaiable at Docker Hub 
(https://hub.docker.com/r/saschak94/containered-phoenix-at-home/)

# Docker Image for local testing of Apache Phoenix and MySQL

This Docker image is created on top of [the existing phoenix image] (https://github.com/sequenceiq/docker-phoenix) and should provide the capability to test locally within eclipse on Phoenix and MySQL.  


Windows Problem while starting => execute this: 
```bash
sed -i 's/\r//' 
```


## TO build:
```bash
docker build -t phoenix/localtest:latest .
```

## Windows 
Use the following ip to connect with jdbc 

```bash
docker-machine ip default 
```

Add this ip to the Windows Host file 
C:\Windows\System32\drivers\etc\hosts
```bash
ip of docker   disag-test
```


## Linux Append the /etc/hosts
```bash
127.0.0.1       disag-test
```

## Start the Container

Start hadoop and login to the container

```bash
docker run -it -h phoenix-local -p 16010:16010 -p 2181:2181 -p 60000:60000 -p 60010:60010 -p 60020:60020 -p 60030:60030  -p 16000:16000 -p 16201:16201 -p 2888:2888 -p 3888:3888 -p 3306:3306 "image_id"  /etc/bootstrap-phoenix.sh -bash
```

## Mysql Access


Run the following Java Code (dont forget to add the mysql-connector-java dependency)
```
String myDriver = "org.gjt.mm.mysql.Driver";
String myUrl = "jdbc:mysql://127.0.0.1/test";
Class.forName(myDriver);
Connection conn = DriverManager.getConnection(myUrl, "test","test123");

....do something....

conn.close();
```

## Phoenix Access
```bash
After starting the container, wait a few secs until HBase is properly started
```

Start phoenix command line:
```bash
/usr/local/phoenix/bin/sqlline.py localhost
```

Connect via Java Code
## Connect via JDBC
```
  Connection con = null;
  Properties conf = new Properties();
  conf.put("hbase.zookeeper.quorum", "127.0.0.1");
  conf.put("hbase.zookeeper.property.clientPort", "2181");
  conf.put("zookeeper.znode.parent", "/hbase");

  conf.put("hbase.client.retries.number", "3"); // default 35
  conf.put("hbase.rpc.timeout", "10000"); // default 60 secs
  conf.put("hbase.rpc.shortoperation.timeout", "5000"); // default 10 secs
  try {
    con = DriverManager.getConnection("jdbc:phoenix:127.0.0.1:2181:/hbase", conf);
  } catch (SQLException e) {
    e.printStackTrace();
  }
```
