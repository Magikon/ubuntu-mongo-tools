FROM ubuntu:16.04

RUN apt-key list | grep "expired: " | sed -ne 's|pub .*/\([^ ]*\) .*|\1|gp' | xargs -n1 apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys && apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 9DA31620334BD75D9DCB49F368818C72E52529D4; echo "deb [ arch=amd64,arm64 ] http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/4.0 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-4.0.list; apt-get update; apt-get install -y mongodb-org-shell mongodb-org-tools s3cmd wget net-tools; rm -rf /var/cache/apt/*; apt-get -y --purge autoremove wget; apt-get clean

