docker stop xiaoya
docker rm xiaoya
if [ -d /etc/xiaoya/mytoken.txt ]; then
        rm -rf /etc/xiaoya/mytoken.txt
fi
mkdir -p /etc/xiaoya
touch /etc/xiaoya/mytoken.txt
touch /etc/xiaoya/pikpak.txt
touch /etc/xiaoya/guestpass.txt
touch /etc/xiaoya/myopentoken.txt
touch /etc/xiaoya/temp_transfer_folder_id.txt

if [[ ! -s /etc/xiaoya/mytoken.txt ]] || [[ ! -s /etc/xiaoya//myopentoken.txt ]] || [[ ! -s /etc/xiaoya/temp_transfer_folder_id.txt ]]; then
echo -e "请配置三个必须文件后再执行安装: \n/etc/xiaoya/mytoken.txt \n/etc/xiaoya/myopentoken.txt \n/etc/xiaoya/temp_transfer_folder_id.txt \n安装停止，请参考指南配置文件\nhttps://www.notion.so/xiaoyaliu/xiaoya-docker-69404af849504fa5bcf9f2dd5ecaa75f \n"
exit
fi

docker pull xiaoyaliu/alist:latest
docker run -d -p 5678:80 -p 5244:5244 -v /etc/xiaoya/mytoken.txt:/mytoken.txt --restart=always -- name=xiaoya xiaoyaliu/alist:latest