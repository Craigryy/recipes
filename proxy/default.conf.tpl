server {
    listen 80; # Use port 80 directly
    server_name _;

    location /static/static {
        alias /vol/static;
    }

    location /static/media {
        alias /vol/media;
    }

    location / {
        include              gunicorn_headers;
        proxy_redirect       off;
        proxy_pass           http://127.0.0.1:9000;  # Forward traffic to the API container on port 9000
        client_max_body_size 10M;
    }
}
