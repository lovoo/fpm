#
# FPM Dockerfile
#
# https://github.com/dockerfile/fpm
#

# Pull base image.
FROM dockerfile/ruby

# Install FPM.
RUN gem install fpm

# Adding aptly repository
RUN echo deb http://repo.aptly.info/ squeeze main > /etc/apt/sources.list.d/aptly.list
RUN apt-key adv --keyserver hkp://keys.gnupg.net --recv-keys 2A194991

# Install rpm tools
RUN \
  apt-get update -qqy && \
  apt-get install -qqy rpm aptly createrepo

# Define mountable directories.
VOLUME ["/data"]

# Define working directory.
WORKDIR /data

# Define default command.
CMD ["bash"]
