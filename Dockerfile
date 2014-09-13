FROM blalor/centos

# base
RUN yum install -y sudo git gcc gcc++ wget
RUN yum install -y python python-devel python-setuptools
RUN yum install -y libevent-devel
RUN easy_install pip

# pip
ADD app/pip-requirements.txt /tmp/pip-requirements.txt
RUN pip install -r /tmp/pip-requirements.txt

CMD python /mnt-app/server.py > /mnt-log/app.log 2>&1
