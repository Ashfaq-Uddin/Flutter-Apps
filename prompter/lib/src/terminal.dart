import 'dart:io';
import 'option.dart';

class Terminal {
  const Terminal();
  void printOptions(List<Option> options) {
    options.asMap().forEach(
      (index, option) {
        stdout.writeln('[$index]-${option.label}');
      },
    );

    stdout.writeln('Enter a choice');
    stdout.write('>');
  }

  void printPrompt(String prompt) {
    stdout.writeln(prompt);
  }

  String collectInput() {
    return stdin.readLineSync();
  }

  void clearScreen() {
    if (Platform.isWindows) {
      stdout.write('\x1B[2J\x1B[0f');
    } else {
      stdout.write('\x1B[2J\x1B[3J\x1B[H');
    }
  }
}
