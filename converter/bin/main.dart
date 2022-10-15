import 'dart:io';
import 'package:prompter_aua/prompter_aua.dart';
import 'package:converter/src/converter.dart';

void main() {
  final prompter = new Prompter();

  final choice = prompter.askBinary('Do you want to convert your image?');

  if (!choice) {
    exit(0);
  }

  final format = prompter.askMultiple('Select Format:', buildFormatOptions());
  final selectedFile =
      prompter.askMultiple('Pick file to format:', buildFileOptions());
  final newPath = ConvertImage(selectedFile, format);

  final shouldOpen = prompter.askBinary('Open the image ?');

  if (shouldOpen) {
    Process.run('open', [newPath]);
  }
}

List<Option> buildFormatOptions() {
  return [
    new Option('Convert to JPEG', 'JPEG'),
    new Option('Convert to PNG', 'PNG')
  ];
}

List<Option> buildFileOptions() {
  final currentDirectory = Directory.current;
  final entities = currentDirectory.listSync();
  print(entities);
}
