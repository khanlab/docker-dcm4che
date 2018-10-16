FROM ubuntu:xenial

#docker build -t yinglilu/dcm4che:0.1 .

COPY ./*.sh /

RUN apt-get update && apt-get install -y --no-install-recommends apt-utils \
    sudo \
    git \
    wget \
    curl \
    zip \
    unzip \
    python2.7 \
    python-pip \
    rsync \
    openssh-client

RUN pip install -U pip setuptools

#needed when install dcm4che
RUN apt-get install -y default-jre

#install dcm4che
ENV DEBIAN_FRONTEND=noninteractive
RUN bash install_dcm4che_ubuntu.sh /opt
RUN rm /*.sh

ENV PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
ENV PATH=/opt/dcm4che-3.3.8/bin:$PATH

#For retrieving physio dicom files. without this line, all the physio series will not be retrieved with getscu
RUN echo '1.3.12.2.1107.5.9.1:ImplicitVRLittleEndian;ExplicitVRLittleEndian' >>/opt/dcm4che-3.3.8/etc/getscu/store-tcs.properties

#allow the getscu client to download CFMM's 9.4T data.
RUN echo 'EnhancedMRImageStorage:ImplicitVRLittleEndian;ExplicitVRLittleEndian'>>/opt/dcm4che-3.3.8/etc/getscu/store-tcs.properties

#########
#fix error if run the singuairity image on graham:
#   Error occurred during initialization of VM
#   java.lang.OutOfMemoryError: unable to create new native thread
ENV _JAVA_OPTIONS="-Xmx2048m"