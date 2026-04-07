# 基于官方 JDK 17 镜像（不用像你之前那样手动装 JDK 了）
FROM eclipse-temurin:17-jre

# 创建工作目录
RUN mkdir -p /tlias
WORKDIR /tlias

# 把 Maven 打好的 jar 包复制进去
COPY target/tlias.jar tlias.jar

# 暴露端口
EXPOSE 8080

# 启动命令
ENTRYPOINT ["java", "-jar", "/tlias/tlias.jar"]
