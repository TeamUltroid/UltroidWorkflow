import 'dart:io';

void main(List<String> args) async {
  // Install UltroidCli
  await Process.start(
    'ver=\$(curl https://raw.githubusercontent.com/BLUE-DEVIL1134/UltroidCli/main/version.txt)',
    [
      '&&',
      'curl -L -o ultroid https://github.com/BLUE-DEVIL1134/UltroidCli/releases/download/\$ver/ultroid-linux',
    ],
    runInShell: true,
    workingDirectory: './',
//     mode: ProcessStartMode.inheritStdio,
  );
  
  // Give permissions to UltroidCli
  await Process.start(
    'chmod',
    [
      'u+x',
      'ultroid',
    ],
    runInShell: true,
    workingDirectory: './',
  );
  
  // Start UltroidCli
  await Process.run(
    './ultroid',
    [
      'init',
    ],
    runInShell: true,
    workingDirectory: './',
//     mode: ProcessStartMode.inheritStdio,
  );
  
  // Install Dependencies
  await Process.start(
    'pip',
    [
      'install', '-U', 'pip',
      '&&', 'pip', 'install', '--no-cache-dir', '-r', './TeamUltroid/requirements.txt',
      '&&', 'pip', 'install', 'av', '--no-binary', 'av'
    ],
    runInShell: true,
    workingDirectory: './',
  );
  
  // Start UltroidCli
  await Process.run(
    './ultroid',
    [
      'heroku',
    ],
    runInShell: true,
    workingDirectory: './',
//     mode: ProcessStartMode.inheritStdio,
  );
}
