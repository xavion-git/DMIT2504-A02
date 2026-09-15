// 1. get user input for lookup word (stdin, via dart:io)
// 2. I need some sort of function to:
//      - attach that value to the end of a URL
//      - send a get request at that URL
//      - tries to return the JSON-decoded body of that response
// 3. loop this until the user quits
// 4. create a class to represent the returned word
import 'dart:io';
import 'package:dictionary_api/http_requests.dart';

void main() async {
  print("What's the word you want to look up?");
  String word = stdin.readLineSync()!;

  final definition = await getWordDefinition(word);

  print('\nWord            Definition');
  print('--------------  ---------------------------------------------------');
  print('${word}      ${definition}'); // will be misaligned; how would you guarantee alignment?
}
