FROM rockylinux/rockylinux:latest

RUN yum install -y epel-release

RUN yum update -y && \
    yum install -y openssh-server sudo mysql curl python3 unzip zip && \
    yum clean all && \
    rm -rf /var/cache/yum

COPY .ssh/id_rsa.pub /home/appuser/.ssh/authorized_keys
COPY .ssh/id_rsa.pub /home/appuser/.ssh/id_rsa.pub
COPY .ssh/id_rsa /home/appuser/.ssh/id_rsa

RUN useradd appuser && \
    echo "appuser:appuser" | chpasswd && \
    chmod 700 /home/appuser/.ssh && \
    chown appuser:appuser -R /home/appuser/ && \
    chmod 600 /home/appuser/.ssh/authorized_keys && \
    rm -rf /run/nologin && \
    ssh-keygen -A

# Download and install AWS CLI
RUN curl "https://d1vvhvl2y92vvt.cloudfront.net/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    sudo ./aws/install

# Test the installation
RUN aws --version

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]

