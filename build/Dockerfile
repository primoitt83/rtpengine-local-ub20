FROM ubuntu:focal as builder

COPY ${PWD}/install.sh /install.sh
 
RUN chmod +x /install.sh && /install.sh

FROM ubuntu:focal as final

COPY --from=builder /*.deb /

COPY ${PWD}/install-final.sh /install-final.sh
 
RUN chmod +x /install-final.sh && /install-final.sh

COPY ${PWD}/rtpengine.conf /rtpengine.conf
COPY ${PWD}/rtpengine.sh /rtpengine.sh
RUN chmod 755 /rtpengine.sh

CMD /rtpengine.sh