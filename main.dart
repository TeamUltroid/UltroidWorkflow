import 'dart:io';

void main(List<String> args) async {
  // Install UltroidCli
  Process.runSync(
    'curl',
    [
      '-L',
      '-o',
      'ultroid',
      'https://github.com/BLUE-DEVIL1134/UltroidCli/releases/download/1.0.6/ultroid-linux',
    ],
    runInShell: true,
    workingDirectory: './',
  );

  // Give permissions to UltroidCli
  Process.runSync(
    'chmod',
    [
      'u+x',
      'ultroid',
    ],
    runInShell: true,
    workingDirectory: './',
  );
  
  // Start UltroidCli
  var init = Process.runSync(
    './ultroid',
    [
      'init',
    ],
    runInShell: true,
    workingDirectory: './',
  );
  stdout.write(init.stdout);
  
  // Install Dependencies
  Process.runSync(
    'pip',
    [
      'install', '-U', 'pip',
    ],
    runInShell: true,
    workingDirectory: './',
  );
  
  // Install Dependencies
  Process.runSync(
    'pip',
    [
      'install', '--no-cache-dir', '-r', './TeamUltroid/requirements.txt',
    ],
    runInShell: true,
    workingDirectory: './',
  );
  
  // Install Dependencies
  Process.runSync(
    'pip',
    [
      'install', 'av', '--no-binary', 'av'
    ],
    runInShell: true,
    workingDirectory: './',
  );
  
  // Start UltroidCli
  Process.start(
    './ultroid',
    [
      'heroku',
    ],
    runInShell: true,
    workingDirectory: './',
    mode: ProcessStartMode.inheritStdio,
  );
}
