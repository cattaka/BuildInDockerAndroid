FROM ubuntu:xenial

RUN apt-get update && \
  apt-get -y upgrade
RUN apt-get -y install vim openjdk-8-jdk wget unzip git

ENV ANDROID_HOME /opt/android-sdk
RUN ANDROID_SDK_URL="https://dl.google.com/android/repository/sdk-tools-linux-3859397.zip" && \
  mkdir -p ${ANDROID_HOME} && \
  cd ${ANDROID_HOME} && \
  wget -q ${ANDROID_SDK_URL} && \
  unzip *tools*linux*.zip && \
  rm *tools*linux*.zip

RUN ${ANDROID_HOME}/tools/bin/sdkmanager --update
RUN yes | ${ANDROID_HOME}/tools/bin/sdkmanager --licenses
RUN ${ANDROID_HOME}/tools/bin/sdkmanager \
  "add-ons;addon-google_apis-google-24" \
  "build-tools;26.0.2" \
  "build-tools;26.0.3" \
  "build-tools;27.0.3" \
  "cmake;3.6.4111459" \
  "extras;android;m2repository" \
  "extras;google;google_play_services" \
  "extras;google;instantapps" \
  "extras;google;m2repository" \
  "extras;m2repository;com;android;support;constraint;constraint-layout-solver;1.0.1" \
  "extras;m2repository;com;android;support;constraint;constraint-layout-solver;1.0.2" \
  "extras;m2repository;com;android;support;constraint;constraint-layout;1.0.0" \
  "extras;m2repository;com;android;support;constraint;constraint-layout;1.0.1" \
  "extras;m2repository;com;android;support;constraint;constraint-layout;1.0.2" \
  "lldb;3.0" \
  "ndk-bundle" \
  "platform-tools" \
  "platforms;android-27" \
  "tools"

CMD ["/bin/bash"]
