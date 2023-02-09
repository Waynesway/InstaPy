docker stop xiaoya
docker rm xiaoya
docker pull xiaoyaliu/alist:latest
if [ -d /etc/xiaoya/mytoken.txt ]; then
	rm -rf /etc/xiaoya/mytoken.txt
fi
mkdir -p /etc/xiaoya
touch /etc/xiaoya/mytoken.txt
touch /etc/xiaoya/pikpak.txt
docker run -d -p 5678:80 -p 5244:5244 -v /etc/xiaoya/mytoken.txt:/mytoken.txt --restart=always --name=xiaoya xiaoyaliu/alist:latest
