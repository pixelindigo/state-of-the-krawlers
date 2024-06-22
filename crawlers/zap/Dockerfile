FROM ghcr.io/zaproxy/zap-archives/zap2docker-stable:2.12.0@sha256:135bfc511087969b67224e1a813d0c0211f27411a77d19033936ed7bac55abe2

COPY auth_bootstrap.py spider.py ./

ENTRYPOINT ["python", "auth_bootstrap.py"]
