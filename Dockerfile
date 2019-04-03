FROM opensuse:42.3
LABEL org.jsy15.distro="opensuse" \
      org.jsy15.osversion="42.3" \
      org.jsy15.clistats="1.0.0"

RUN zypper --non-interactive update && zypper --non-interactive install \
    cmake \
    curl \
    tar \
    gcc-c++

# Download the source
ARG STAT_VERSION=v1.0.0
ARG STAT_DIR=1.0.0
ARG STAT_URL=https://github.com/dpmcmlxxvi/clistats/archive/${STAT_VERSION}.tar.gz
RUN curl -L -O $STAT_URL

# Extract the source
RUN tar xvzf ${STAT_VERSION}.tar.gz

# Make the build directory and compile the program
RUN cd clistats-${STAT_DIR} && mkdir build && cd build && cmake .. && make \
