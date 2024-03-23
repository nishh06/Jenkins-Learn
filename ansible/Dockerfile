FROM jenkins/jenkins

# Switch to root user
USER root

#Install Python and PIP
RUN apt-get update && \
    apt-get install -y ansible

# Switch back to the Jenkins user
USER jenkins
