FROM theteamultroid/ultroid:main

# Set Timezone
ENV TZ=Asia/Kolkata

RUN mkdir /root/TeamUltroid/
COPY ./test.py /root/TeamUltroid
WORKDIR /root/TeamUltroid

RUN apt-get update && apt-get install --no-install-recommends --no-install-suggests -y && rm -rf /var/lib/apt/lists/*

CMD [ "python", "test.py" ]
