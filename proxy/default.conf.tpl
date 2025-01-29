upstream app {
    # Forward traffic to the Django app running on port 9000
    server 127.0.0.1:9000;
}

server {
    listen 80;
    listen [::]:80;
    listen 8000;
    

    # Static files
    location /static/static {
        alias /vol/static;
    }

    # Media files
    location /static/media {
        alias /vol/media;
    }

    # Forward all other requests to the application
    location / {
        include              gunicorn_headers;
        proxy_redirect       off;
        proxy_pass           http://${APP_HOST}:${APP_PORT};
        client_max_body_size 10M;  # Limit the size of client requests
    }
}
