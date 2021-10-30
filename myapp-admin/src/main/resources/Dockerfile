## FROM ，表示使用 Jdk8 环境 为基础镜像，如果镜像不是本地的会从 DockerHub 进行下载
## 指定父镜像
FROM openjdk:8-jdk-alpine
## VOLUME ，VOLUME 指向了一个/tmp的目录，由于 Spring Boot 使用内置的Tomcat容器，Tomcat 默认使用/tmp作为工作目录。
## 这个命令的效果是：在宿主机的/var/lib/docker目录下创建一个临时文件并把它链接到容器中的/tmp目录
VOLUME /tmp
## 添加文件 拷贝文件并且重命名
ADD myapp-admin-3.0.0.jar app.jar
##为了缩短 Tomcat的启动时间，添加java.security.egd的系统属性指向/dev/urandom作为 ENTRYPOINT
## ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]
ENV LANG C.UTF-8
## 入口
ENTRYPOINT ["java","-Xms256m","-Xmx256m","-jar","/app.jar"]


