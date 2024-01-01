apt-get update
DEBIAN_FRONTEND=noninteractive apt-get install -y git
mkdir /opt/monolith
cd /opt/monolith/
git clone -b monolith https://github.com/express42/reddit.git
cd reddit && bundle install
