import 'package:prompter_aua/prompter_aua.dart';

void main() {
  final prompter = new Prompter();

  //prompter.clearScreen();

  var options = [
    new Option('I want red', '#f00'),
    new Option('I want blue', '#00f'),
  ];

  String coloCode =
      prompter.askMultiple("Which Color do you want, Miguel ?", options);

  bool answer = prompter.askBinary('What do you like dart?');
  print(coloCode);
  print(answer);
}
