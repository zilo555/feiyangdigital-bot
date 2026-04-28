# 使用Maven + Eclipse Temurin 17基础镜像进行构建
FROM maven:3.9.14-eclipse-temurin-17 AS build

# 设置工作目录
WORKDIR /app

# 复制pom.xml
COPY pom.xml .

# 复制源代码
COPY src/ src/

# 执行Maven构建
RUN mvn clean package

# 使用Eclipse Temurin 17运行时镜像
FROM eclipse-temurin:17-jre-jammy

# 安装中文字体
RUN apt-get update \
 && apt-get install -y --no-install-recommends fonts-wqy-microhei \
 && rm -rf /var/lib/apt/lists/*

# 设置应用的目录结构
WORKDIR /app

# 从构建阶段复制构建的jar文件和src目录
COPY --from=build /app/target/*.jar app.jar
COPY --from=build /app/src/ /app/src/

# 设置Java的Headless模式（key=value 写法）
ENV JAVA_TOOL_OPTIONS="-Djava.awt.headless=true"

# 设置启动命令
ENTRYPOINT ["java", "-jar", "app.jar"]
