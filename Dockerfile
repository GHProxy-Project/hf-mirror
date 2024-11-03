# 使用 Python 官方镜像
FROM python:3.9-slim

# 设置工作目录为 /app
WORKDIR /app

# 复制 requirements.txt 文件并安装依赖
COPY requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt

# 复制项目文件并以可编辑模式安装
COPY olah /app/olah
RUN pip install --no-cache-dir -e /app/olah

# 暴露默认端口
EXPOSE 8090

# 运行 olah 服务并指定配置文件路径
CMD ["olah-cli", "-c", "/app/configs.toml"]
