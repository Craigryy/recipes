FROM nginx:1-alpine
LABEL maintainer="harrisonjames"

COPY ./default.conf.tpl /etc/nginx/templates/default.conf.tpl
COPY ./gunicorn_headers /etc/nginx/gunicorn_headers
COPY ./run.sh /run.sh

ENV LISTEN_PORT=80
ENV APP_HOST=app
ENV APP_PORT=9000

RUN mkdir -p /vol/static /vol/media && \
    chmod 755 /vol/static /vol/media && \
    chmod +x /run.sh

VOLUME /vol/static
VOLUME /vol/media

CMD ["/run.sh"]
