From ubuntu:18.04
LABEL org.jsy15.distro="ubuntu" \
      org.jsy15.osversion="18.04" \
      org.jsy15.clistats="1.0.0"

# Update and install dependencies
RUN apt-get update -y && apt-get install -y \
    make \ 
    g++ \
    cmake \
    curl

# Download the source
ARG STAT_VERSION=v1.0.0
ARG STAT_DIR=1.0.0
ARG STAT_URL=https://github.com/dpmcmlxxvi/clistats/archive/${STAT_VERSION}.tar.gz
RUN curl -L -O $STAT_URL

# Extract the source
RUN tar xvzf ${STAT_VERSION}.tar.gz  

# Make the build directory and compile the program
RUN cd clistats-${STAT_DIR} && mkdir build && cd build && cmake .. && make 