#FROM maven:3.5.2-jdk-8 AS MAVEN_TOOL_CHAIN
FROM maven:3.8.3-openjdk-8 AS MAVEN_TOOL_CHAIN

USER root

# cache Maven dependencies
ADD crawljax/pom.xml /cj/
ADD crawljax/core/pom.xml /cj/core/
ADD crawljax/examples/pom.xml /cj/examples/
ADD crawljax/plugins/pom.xml /cj/plugins/
ADD crawljax/plugins/crawloverview-plugin/pom.xml /cj/plugins/crawloverview-plugin/
ADD crawljax/plugins/test-plugin/pom.xml /cj/plugins/test-plugin/
ADD crawljax/plugins/testcasegenerator-plugin/pom.xml /cj/plugins/testcasegenerator-plugin/
ADD crawljax/cli/pom.xml /cj/cli/pom.xml
ADD crawljax/cli/src/main/resources/jar-with-dependencies.xml cj/cli/src/main/resources/jar-with-dependencies.xml
ADD rabin-hash-function-2.0.jar /tmp/

WORKDIR /cj/
RUN mvn install:install-file -Dfile=/tmp/rabin-hash-function-2.0.jar -DgroupId=com.rabinhash -DartifactId=rabinhash -Dversion=2.0 -Dpackaging=jar -DgeneratePom=true \
    && mvn -B dependency:go-offline clean package \
    -DskipTests -Dcheckstyle.skip -Dasciidoctor.skip -Djacoco.skip -Dmaven.gitcommitid.skip -Dspring-boot.repackage.skip \
    -Djavacpp.platform=linux-x86_64 \
    -Dmaven.exec.skip=true 
    #&& mvn -B -e -C dependency:go-offline
    #&& mvn -B - dependency:go-offline -s /usr/share/maven/ref/settings-docker.xml dependency:resolve-plugins clean package \
    #-DskipTests -Dcheckstyle.skip -Dasciidoctor.skip -Djacoco.skip -Dmaven.gitcommitid.skip -Dspring-boot.repackage.skip \
    #-Djavacpp.platform=linux-x86_64 \
    #-Dmaven.exec.skip=true -Dmaven.install.skip -Dmaven.resources.skip

COPY crawljax/ /cj/

RUN mvn clean package -DskipTests -Djavacpp.platform=linux-x86_64

FROM selenium/standalone-chrome:4.21.0-20240423

USER root

RUN apt-get update -qqy \
    && apt-get install -y --no-install-recommends python3 python3-pip libgtk-3-0 openjdk-17-jre xvfb \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /opt/crawljax/

COPY docker-entrypoint.sh ndalgorithms-0.0.1-py3-none-any.whl ./

ENV JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64/
RUN chmod +x docker-entrypoint.sh \
    && pip3 install jpy==0.11.1 \
    && python3 -m jpyutil -o . \
    && pip3 install ndalgorithms-0.0.1-py3-none-any.whl

#USER seluser

COPY --from=MAVEN_TOOL_CHAIN /cj/examples/target/crawljax-examples-4.2-SNAPSHOT-jar-with-dependencies.jar crawljax.jar

RUN java -jar crawljax.jar --setup

ENTRYPOINT ["./docker-entrypoint.sh"]
#CMD ["--app", "http://web/", "--saf", "dom_jaek", "--timeout", "30", "--threshold", "0.2", "--states", "50"]
