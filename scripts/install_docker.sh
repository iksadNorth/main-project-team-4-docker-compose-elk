# docker 설치
echo "================================"
echo "(docker install)[0/7]"
sudo apt-get install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common
echo "(docker install)[1/7]"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
echo "(docker install)[2/7]"
sudo add-apt-repository -y \
"deb [arch=amd64] https://download.docker.com/linux/ubuntu \
$(lsb_release -cs) \
stable"
echo "(docker install)[3/7]"
sudo apt-get update && sudo apt-get install -y docker-ce docker-ce-cli containerd.io
echo "(docker install)[4/7]"
sudo systemctl enable docker
echo "(docker install)[5/7]"
sudo service docker start
echo "(docker install)[6/7]"
sudo usermod -a -G docker $USER
echo "(docker install)[7/7]"

# docker-compose 설치
echo "================================"
echo "(docker-compose install)[0/2]"
sudo curl -L https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
echo "(docker-compose install)[1/2]"
sudo chmod +x /usr/local/bin/docker-compose
echo "(docker-compose install)[2/2]"

# 서버 시간 서울로 초기화
source ./scripts/set_timezone_as_seoul.sh

# 완벽한 적용을 위한 서버 리부트
echo "================================"
echo "reboot"
sudo reboot