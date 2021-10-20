# 指定父镜像
FROM openjdk:8-jdk-alpine
VOLUME /tmp
# 添加文件 拷贝文件并且重命名
ADD *.jar app.jar
# 入口
ENTRYPOINT ["java","-Xms256m","-Xmx256m","-jar","/app.jar"]
