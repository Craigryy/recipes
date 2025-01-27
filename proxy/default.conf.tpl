server {
    listen 80;  # Listen on port 80

    # Serve static files
    location /static/static {
        alias /vol/static;
    }

    location /static/media {
        alias /vol/media;
    }

    # Proxy requests to Gunicorn (ensure APP_HOST and APP_PORT are set)
    location / { 
        include              gunicorn_headers;
        proxy_redirect       off;
        proxy_pass           http://${APP_HOST}:${APP_PORT};  # Ensure this is pointing to the correct app and port
        client_max_body_size 10M;
    }
}
