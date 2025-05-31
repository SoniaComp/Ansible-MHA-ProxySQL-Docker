FROM rockylinux:8

RUN dnf -y update && \
dnf -y install \
    curl \
    less \
    sudo \
    vim \
    epel-release \
    openssh-clients \
    && dnf clean all

# Ansible 설치 (EPELRepository 활성화 후)
RUN dnf -y install ansible && dnf clean all

ENV PATH $PATH:/root/
WORKDIR /root
CMD cd build/damp/ ; ansible-playbook -i hostfile setup.yml --limit localhost ; /bin/bash
