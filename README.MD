# Aim:
    1. Run dcm4che without nasty installation errors.
    2. A parent image for dcm4che based applications.

# change history:
0.3:added `'RUN echo 1.3.12.2.1107.5.9.1:ImplicitVRLittleEndian;ExplicitVRLittleEndian'>>/opt/dcm4che-3.3.8/etc/getscu/store-tcs.properties`
0.2: removed pydicom installation

# how to use example:
  `docker run --rm -it yinglilu/dcm4che findscu -h`
  
