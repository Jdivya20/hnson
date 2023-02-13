FROM centos:centos7.7.1908
RUN yum -y update && \
      yum -y install sudo

# RUN useradd -m docker && echo "docker:docker" | chpasswd && adduser docker sudo

# USER docker
# CMD /bin/bash

 RUN yum install -y wget && \
lsblk && \
wget https://archives.streamsets.com/datacollector/3.22.3/rpm/el7/streamsets-datacollector-3.22.3-el7-all-rpms.tar && \
tar -xvf streamsets-datacollector-3.22.3-el7-all-rpms.tar && \
yum install -y java-11-openjdk && \
java -version && \
cd streamsets-datacollector-3.22.3-el7-all-rpms && \
yum install -y streamsets-datacollector-3.22.3-1.noarch.rpm && \
# systemctl start sdc && \
# systemctl status sdc 
# ENTRYPOINT [ "sh","/Docker/script.sh" ]
# CMD [ "/usr/bin/init" ]
# RUN systemctl enable httpd
sudo su && \
ulimit -n 32768 
ENV SDC_HOME=/opt/streamsets-datacollector \
    SDC_CONF=/etc/sdc \
    SDC_LOG=/var/log/sdc \
    SDC_DATA=/var/lib/sdc 
COPY ./script.sh .
ENTRYPOINT [ "/bin/bash","./script.sh" ]
EXPOSE 18630
