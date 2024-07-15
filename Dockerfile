# Use the official Ubuntu 22.04 image as the base image
FROM ubuntu:22.04

# Set environment variables
ENV ANDROID_SDK_PATH=/root/Android
ENV ANDROID_HOME=/root/Android/Sdk
ENV JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64

# Update and install necessary packages

RUN apt-get update && apt-get install -y \
    curl \
    wget \
    unzip \
    git \
    build-essential \
    libssl-dev \
    libffi-dev \
    python3 \
    nano \
    python3-pip \
    openjdk-17-jdk \
    software-properties-common \
    && rm -rf /var/lib/apt/lists/*

# Install Node.js and npm
RUN curl -sL https://deb.nodesource.com/setup_16.x | bash - && \
    apt-get install -y nodejs && \
    node -v && \
    npm -v

# Install Yarn package manager
RUN npm install -g yarn

# Download and install Android Command Line Tools
RUN mkdir -p ${ANDROID_SDK_PATH} && \
    wget https://github.com/1xrohit/Setup-ReactNative-on-Ubuntu-without-Android-Studio/releases/download/AndroidSDK/Android.zip -O ${ANDROID_SDK_PATH}/Android.zip && \
    unzip ${ANDROID_SDK_PATH}/Android.zip -d ${ANDROID_SDK_PATH}

# Update PATH
#RUN echo "export ANDROID_HOME=${ANDROID_HOME}" >> ~/.bashrc && \
#    echo "export PATH=\$PATH:\$ANDROID_HOME/emulator" >> ~/.bashrc && \
 #   echo "export PATH=\$PATH:\$ANDROID_HOME/platform-tools" >> ~/.bashrc && \
  #  echo "export PATH=\$PATH:\$ANDROID_HOME/cmdline-tools/latest/bin" >> ~/.bashrc && \
   # echo "export JAVA_HOME=${JAVA_HOME}" >> ~/.bashrc && \
    #echo "export PATH=\$PATH:\$JAVA_HOME/bin" >> ~/.bashrc && \
    #source ~/.bashrc

# Install React Native CLI
RUN npm install -g react-native-cli

# Print a success message
RUN echo "Congratulations! You have successfully set up React Native on Linux or Ubuntu without relying on Android Studio."

# Create and set application directory
WORKDIR /WORKDIR

# Copy package.json and yarn.lock files
COPY package.json yarn.lock ./

# Install project dependencies
RUN yarn install

# Copy the rest of the application code
COPY . .

