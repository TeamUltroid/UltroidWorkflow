import os
os.system('''
ver=$(curl https://raw.githubusercontent.com/BLUE-DEVIL1134/UltroidCli/main/version.txt) && curl -L -o ultroid https://github.com/BLUE-DEVIL1134/UltroidCli/releases/download/$ver/ultroid-linux
chmod u+x ultroid
./ultroid init
pip install -U pip \
  && pip install --no-cache-dir -r TeamUltroid/requirements.txt \
  && pip install install av --no-binary av
./ultroid heroku
''')
