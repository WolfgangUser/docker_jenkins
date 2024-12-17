FROM jenkins/jenkins:lts

USER root

RUN apt-get update && apt-get install -y \
    git \
    curl \
    docker.io && \
    rm -rf /var/lib/apt/lists/*

RUN usermod -aG docker jenkins

USER jenkins

EXPOSE 8080

ENTRYPOINT ["/usr/bin/tini", "--", "/usr/local/bin/jenkins.sh"]
