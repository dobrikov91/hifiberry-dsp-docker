# Stage 1: Build and install dependencies
FROM debian:11 as builder

WORKDIR /app

RUN apt-get update && apt-get install -y \
    python3-pip libasound2-dev libxslt1-dev libxml2-dev zlib1g-dev \
    libxml2-dev libxslt-dev python3-dev git gcc wget

RUN git clone https://github.com/hifiberry/hifiberry-dsp
WORKDIR /app/hifiberry-dsp
RUN python3 setup.py install

# Stage 2: Final lightweight runtime image
FROM debian:11

WORKDIR /app

RUN apt-get update && apt-get install -y \
    python3-pip libasound2 alsa-utils wget --no-install-recommends && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

COPY --from=builder /usr/local/lib/python3.9/dist-packages /usr/local/lib/python3.9/dist-packages
COPY --from=builder /usr/local/bin /usr/local/bin

RUN mkdir -p /var/lib/hifiberry && mkdir ~/.dsptoolkit
RUN wget https://raw.githubusercontent.com/bang-olufsen/create/master/Beocreate2/beo-dsp-programs/beocreate-universal-10.xml

COPY run.sh .
RUN chmod +x run.sh

CMD ["./run.sh"]
