FROM theteamultroid/ultroid:main

# Set Timezone
ENV TZ=Asia/Kolkata

RUN mkdir /root/TeamUltroid/
# COPY ./test.py /root/TeamUltroid
WORKDIR /root/TeamUltroid


RUN ver=$(curl https://raw.githubusercontent.com/BLUE-DEVIL1134/UltroidCli/main/version.txt) && curl -L -o ultroid https://github.com/BLUE-DEVIL1134/UltroidCli/releases/download/$ver/ultroid-linux

# Give Permissions
RUN chmod u+x ultroid

# Clone the repository and install the dependencies
RUN ./ultroid init

# Install Dependencies
RUN pip install -U pip \
    && pip install --no-cache-dir -r TeamUltroid/requirements.txt \
    && pip install install av --no-binary av

ENTRYPOINT [ "./ultroid" ]
CMD [ "heroku" ]
