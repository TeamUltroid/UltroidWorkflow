FROM theteamultroid/ultroid:main

# Install Dart
 RUN apt-get update
 RUN apt-get install apt-transport-https
 RUN sh -c 'wget -qO- https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -'
 RUN sh -c 'wget -qO- https://storage.googleapis.com/download.dartlang.org/linux/debian/dart_stable.list > /etc/apt/sources.list.d/dart_stable.list'
 RUN apt-get update
 RUN apt-get install dart

# Set Timezone
ENV TZ=Asia/Kolkata

RUN mkdir /root/TeamUltroid/
WORKDIR /root/TeamUltroid

CMD [ "dart", "main.dart" ]
