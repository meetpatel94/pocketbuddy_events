# Base image: Use Tomcat 9 with JDK 17
FROM tomcat:9.0-jdk17

# Remove default web apps
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy WAR file into Tomcat webapps directory
COPY target/*.war /usr/local/tomcat/webapps/ROOT.war
