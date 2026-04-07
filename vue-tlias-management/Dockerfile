# 基于 Nginx 镜像
FROM nginx:1.20.2

# 把 build 好的静态文件复制到 Nginx 的默认目录
COPY dist/ /usr/share/nginx/html/

# 把自定义的 Nginx 配置复制进去（包含反向代理规则）
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80
