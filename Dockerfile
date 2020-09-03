FROM ubuntu:18.04

COPY ./install-packages.sh ./install-packages.sh
RUN chmod +x ./install-packages.sh && ./install-packages.sh

COPY ./build-vbox.sh ./build-vbox.sh
RUN chmod +x ./build-vbox.sh

CMD ["./build-vbox.sh", "--help"]
