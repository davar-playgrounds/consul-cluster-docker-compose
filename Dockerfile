FROM centos
RUN yum -y update && yum -y upgrade && yum -y install openssh-server openssh-client curl bash unzip epel-release && yum -y install nginx

ADD https://releases.hashicorp.com/consul/0.8.5/consul_0.8.5_linux_amd64.zip /tmp/consul.zip
RUN cd /bin && unzip /tmp/consul.zip && chmod +x /bin/consul && rm /tmp/consul.zip

ADD https://releases.hashicorp.com/consul/0.8.5/consul_0.8.5_web_ui.zip /web-ui.zip
RUN mkdir -p /var/lib/consul/ui && unzip /web-ui.zip -d /var/lib/consul/ui

ADD https://releases.hashicorp.com/consul-template/0.19.0/consul-template_0.19.0_linux_amd64.zip /consul-template.zip
RUN unzip consul-template.zip -d /usr/local/bin

EXPOSE 8300 8301 8301/udp 8302 8302/udp 8400 8500 53/udp

CMD  chmod +x /usr/local/bin/consul
