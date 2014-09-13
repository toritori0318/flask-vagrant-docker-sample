FROM dockerfile/nginx

# envの定義をnginx.confに追加
RUN echo "\nenv APP_PORT_5000_TCP_ADDR;" >> /etc/nginx/nginx.conf

ADD nginx-default.conf /etc/nginx/sites-available/default

RUN apt-get install sed -y

ADD run.sh /usr/local/bin/run.sh
RUN chmod +x /usr/local/bin/run.sh
CMD ["/usr/local/bin/run.sh"]
