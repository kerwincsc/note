#! /bin/bash
# nginx.sh
# 设置nginx在runlevel 为 3 或 5 时, 随着系统一起启动, 如果不需要开机启动,
# 则可以设置为 chkconfig: - 13 68 ; 这里的 13 和 68 分别表示开机和关机时
# nginx的顺序
# chkconfig: 35 13 68
# description: nginx server
# http://nginx.org/download/nginx-1.9.5.tar.gz
# 定义变量
nginx_bin="/usr/local/nginx/sbin/nginx"
nginx_prefix="/usr/local/nginx/"
nginx_pid="/usr/local/nginx/logs/nginx.pid"
# 加载系统函数
. /etc/rc.d/init.d/functions

# 进程是否正在运行, 若运行则返回0, 若没有则返回1
function nginx_is_running {
    local nginx_pid_number=$(cat $nginx_pid)
    # /proc 下有和进程 PID 相同名称的目录, 即为该进程正在运行
    if [ -d /proc/$nginx_pid_number ]
    then
        echo 0
    else
        echo 1
    fi
}

# 启动函数
function start {
    if [ -f ${nginx_pid} ]; then
        [ $(nginx_is_running) = 0 ] && echo "nginx is running"
        exit 2
    else
        # 启动nginx
        ${nginx_bin} -p ${nginx_prefix}
    fi
}

# 停止函数
function stop {
    if [ $(nginx_is_running) = 1 ]; then
        echo "nginx is not run"
        exit 2
    else
        # 停止nginx
        ${nginx_bin} -p ${nginx_prefix} -s stop
    fi
}

# 重启函数
function restart {
    stop
    start
}

function status {
    if [ -f ${nginx_pid} ]; then
        [ $(nginx_is_running) = 0 ] && echo "nginx is running"
        exit 0
    fi
    echo "nginx is not run"
    exit 2
}

case "$1" in
    start)
        start
        ;;
    stop)
        stop
        ;;
    restart)
        restart
        ;;
    status)
        status
        ;;
    *)
        echo "Usage: $0 {start|stop|restart|status}"
        ;;
esac
