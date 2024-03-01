# Stage 1 - Install dependencies and build the app in a build environment
FROM ubuntu:22.04 AS build-env

# Install necessary dependencies
RUN apt-get update && apt-get install -y curl git unzip xz-utils zip libglu1-mesa

# define variables
ARG FLUTTER_SDK=/usr/local/flutter
ARG FLUTTER_VERSION=3.19.2
ARG APP=/app/

#clone flutter
RUN git clone https://github.com/flutter/flutter.git $FLUTTER_SDK
# change dir to current flutter folder and make a checkout to the specific version
RUN cd $FLUTTER_SDK && git fetch && git checkout $FLUTTER_VERSION

ENV PATH="/usr/local/flutter/bin:${PATH}"
RUN flutter precache
