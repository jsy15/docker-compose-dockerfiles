FROM centos:7.3.1611
LABEL org.jsy15.distro="centos" \
      org.jsy15.osversion="7.3.1611" \
      org.jsy15.clistats="1.0.0"

# Update and install dependencies
RUN yum install install -y \
    make \
    gcc-c++ \
    cmake \
    libstdc++-static

# Download sort source
ARG STAT_VERSION=v1.0.0
ARG STAT_DIR=1.0.0
ARG STAT_URL=https://github.com/dpmcmlxxvi/clistats/archive/${STAT_VERSION}.tar.gz
RUN curl -L -O $STAT_URL

# Extract the source
RUN tar xvzf ${STAT_VERSION}.tar.gz

# Make the build directory and compile the program
RUN cd clistats-${STAT_DIR} && mkdir build && cd build && cmake .. && make