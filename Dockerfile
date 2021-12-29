FROM theteamultroid/ultroid:main

# Set Timezone
ENV TZ=Asia/Kolkata

RUN mkdir /root/TeamUltroid/
WORKDIR /

# ENTRYPOINT [ "python" ]
RUN apt-get update && apt-get install --no-install-recommends --no-install-suggests -y && rm -rf /var/lib/apt/lists/*

RUN ls
CMD [ "python", "test.py" ]
