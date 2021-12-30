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

//   await Process.start(
//     'dart',
//     ['--version'],
//     runInShell: true,
//     workingDirectory: './',
//     mode: ProcessStartMode.inheritStdio,
//   );
  
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
  stderr.write(init.stderr);
  
  // Install Dependencies
  Process.start(
    'pip',
    [
      'install', '-U', 'pip',
      '&&', 'pip', 'install', '--no-cache-dir', '-r', './TeamUltroid/requirements.txt',
      '&&', 'pip', 'install', 'av', '--no-binary', 'av'
    ],
    runInShell: true,
    workingDirectory: './',
  );
  
  // Install Dependencies
  Process.start(
    'pip',
    [
      'install', '--no-cache-dir', '-r', './TeamUltroid/requirements.txt',
    ],
    runInShell: true,
    workingDirectory: './',
  );
  
  // Install Dependencies
  Process.start(
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
