FROM python:3.9.16-alpine3.17

RUN apk update && apk add cargo && pip install wapiti3==3.1.5 requests==2.28.2

COPY auth_bootstrap.py .
RUN chmod +x auth_bootstrap.py

ENTRYPOINT ["./auth_bootstrap.py"]
