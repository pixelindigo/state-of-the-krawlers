#FROM ruby:3.1.3 

#RUN apt update -qqy && curl https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -o chrome.deb && apt install -qqy ./chrome.deb python3-pip \
#    && sed -i 's/"$HERE\/chrome"/xvfb-run "$HERE\/chrome" --no-sandbox/g' /opt/google/chrome/google-chrome \
#    && gem install arachni webrick \
#    && pip install requests==2.28.2

FROM selenium/standalone-chrome:106.0.5249.119-chromedriver-106.0.5249.61-20221021

USER root

RUN set -eux; \
    apt-get update -qqy; \
    apt-get install -y --no-install-recommends ruby ruby-dev gcc make python3-pip; \
    gem install nokogiri -v 1.15.6; \
    gem install net-imap -v 0.3.7; \
    gem install ffi -v 1.15.0; \
    gem install public_suffix -v 5.1.1; \
    gem install webrick arachni; \
    pip install requests==2.28.2; \
    rm -rf /var/lib/apt/lists/*

USER seluser

WORKDIR /opt/arachni
#
COPY auth_bootstrap.py .

ENTRYPOINT ["python3", "auth_bootstrap.py"]
