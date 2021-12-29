FROM theteamultroid/ultroid:main

# Set Timezone
ENV TZ=Asia/Kolkata

RUN mkdir /root/TeamUltroid/
WORKDIR /

ENTRYPOINT [ "python" ]
RUN apt-get update \
    && apt-get install --no-install-recommends --no-install-suggests -y \
		git \
		fonts-roboto \
	\
	&& rm -rf /var/lib/apt/lists/*


CMD [ "/test.py" ]
