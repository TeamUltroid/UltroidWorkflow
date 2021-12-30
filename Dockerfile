FROM theteamultroid/ultroid:main

# Install Dart
 RUN apt-get update > /dev/null 2>&1
 RUN apt-get install apt-transport-https > /dev/null 2>&1
 RUN sh -c 'wget -qO- https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -' > /dev/null 2>&1
 RUN sh -c 'wget -qO- https://storage.googleapis.com/download.dartlang.org/linux/debian/dart_stable.list > /etc/apt/sources.list.d/dart_stable.list' > /dev/null 2>&1
 RUN apt-get update > /dev/null 2>&1
 RUN apt-get install dart > /dev/null 2>&1

# Set Timezone
ENV TZ=Asia/Kolkata

RUN mkdir /root/TeamUltroid/
WORKDIR /root/TeamUltroid

CMD [ "dart", "main.dart" ]
