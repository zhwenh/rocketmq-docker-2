FROM registry.access.redhat.com/redhat-openjdk-18/openjdk18-openshift

ADD binary/apache-rocketmq-all /home/jboss

USER root

RUN chown -R jboss:jboss /home/jboss
USER jboss

RUN chmod -R 755 /home/jboss
RUN chmod -R +x /home/jboss/bin

ENV ROCKETMQ_HOME /home/jboss
ENV JAVA_OPT '-Xms1g -Xmx1g'
ENV BROKER_OPT '-Xms2g -Xmx2g'
EXPOSE 9876
EXPOSE 10911
EXPOSE 10912

ENTRYPOINT ${ROCKETMQ_HOME}/bin/playdocker.sh
