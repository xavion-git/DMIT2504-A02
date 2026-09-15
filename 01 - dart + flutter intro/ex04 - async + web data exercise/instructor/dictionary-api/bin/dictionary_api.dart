// 1. get user input for lookup word (stdin, via dart:io)
// 2. I need some sort of function to:
//      - attach that value to the end of a URL
//      - send a get request at that URL
//      - tries to return the JSON-decoded body of that response
// 3. loop this until the user quits
// 4. create a class to represent the returned word
import 'dart:io';

void main() {
  print("What's the word you want to look up?");
  String word = stdin.readLineSync()!;


}
