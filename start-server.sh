#!/bin/bash

# 清理旧进程
lsof -ti:9000 | xargs kill -9 2>/dev/null || true
sleep 1

# 启动 Python 服务器
cd "$(dirname "$0")"
python3 -m http.server 9000 > /tmp/portfolio-server.log 2>&1 &
SERVER_PID=$!
echo $SERVER_PID > /tmp/portfolio-server.pid

# 等待启动
sleep 2

# 验证
if ps -p $SERVER_PID > /dev/null 2>&1; then
    echo "✓ 服务器已启动"
    echo "PID: $SERVER_PID"
    echo "访问: http://localhost:9000/index.html"
else
    echo "✗ 启动失败"
    tail -n 20 /tmp/portfolio-server.log
    exit 1
fi
