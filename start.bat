@echo off
for /f "tokens=4" %%a in ('route print^|findstr 0.0.0.0.*0.0.0.0') do (
 set IP=%%a
)
echo 你的局域网IP是：
echo %IP%
copy C:\Users\chs07\Desktop\code\dnmp\conf\php-base.ini  C:\Users\chs07\Desktop\code\dnmp\conf\php.ini
set a=xdebug.remote_host = "%IP%"
echo %a% >> C:\Users\chs07\Desktop\code\dnmp\conf\php.ini
docker-compose up