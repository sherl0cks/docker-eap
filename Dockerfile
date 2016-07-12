FROM jboss/base-jdk:8

#ADD http://download.eng.rdu2.redhat.com/released/JBEAP-6/6.4.4/jboss-eap-6.4.4-full-build.zip /tmp/eap


####### MAINTAINER ############
MAINTAINER "Justin Holmes" "jholmes@redhat.com"

####### ENVIRONMENT ############
ENV EAP_VERSION 6.4.8
ENV JBOSS_HOME /opt/jboss/jboss-eap-6.4

COPY jboss-eap-$EAP_VERSION-full-build.zip /opt/jboss

RUN cd /opt/jboss/ \
	&& unzip -q jboss-eap-$EAP_VERSION-full-build.zip -d .  \
	&& rm jboss-eap-$EAP_VERSION-full-build.zip

# Expose the ports we're interested in
EXPOSE 8080

# Set the default command to run on boot
# This will boot EAP in the standalone mode and bind to all interface
CMD ["/opt/jboss/jboss-eap-6.4/bin/standalone.sh", "-b", "0.0.0.0"]
