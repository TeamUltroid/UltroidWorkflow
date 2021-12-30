FROM theteamultroid/ultroid:main

# Set Timezone
ENV TZ=Asia/Kolkata

RUN mkdir /root/TeamUltroid/
WORKDIR /root/TeamUltroid

CMD [ "python", "test.py" ]
