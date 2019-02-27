FROM debian:latest

RUN apt-get update && apt-get install -y openssh-server
RUN mkdir /var/run/sshd

RUN echo 'root:test' | chpasswd
RUN useradd rewieer \
	&& echo 'rewieer:test' | chpasswd \
	&& mkdir /home/rewieer \
	&& chown rewieer:rewieer /home/rewieer \
	&& addgroup rewieer sudo

EXPOSE 22
CMD ["/usr/sbin/sshd","-D"]
