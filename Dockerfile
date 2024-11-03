# 使用 Python 官方镜像
FROM python:3.9-slim

# 设置工作目录为 /app
WORKDIR /app

# 安装 git，因为 olah 项目依赖于 GitPython
RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*

# 复制 requirements.txt 文件并安装依赖
COPY requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt

# 复制项目代码到容器中
COPY . /app

# 安装项目以使 olah-cli 命令可用
RUN pip install --no-cache-dir -e .

# 暴露默认端口
EXPOSE 8090

# 运行 olah 服务并指定配置文件路径
CMD ["olah-cli", "-c", "/app/configs.toml"]
