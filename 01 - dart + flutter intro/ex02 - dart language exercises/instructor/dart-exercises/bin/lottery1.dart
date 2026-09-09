// 1. we're going to run this directly as a program -> so I need a main()
// 2. I know I need to handle (command-line) user inputs
// 3. I need some sort of logic that returns a list of 6 ints, ranging 1-49 inclusively
// 4. I need some sort of logic that ensures no duplicates in the list (TBD)


// 2. command-line user inputs: I need to import dart:io module
import 'dart:io';
import 'dart:math';


// 1. main function - no error handling yet
void main() {
  // I can use print() if I want an immediate new line, or
  // stdout.write if I want input on the same line.
  // print() is basically just shorthand for stdout.writeln
  print('How many lottery numbers to pick? '); // print is equiv. to stdout.write
  int count = int.parse(stdin.readLineSync()!);

  print('What is the upper bound of numbers to pick? (inclusively) ');
  int largestNum = int.parse(stdin.readLineSync()!);

  // 3. generate {count} numbers between 1 and {largestNum}
  Random    rng          = Random();
  List<int> lottoNumbers = List.filled(count, 0); // {count} number of elements, all initialised as 0

  for (int i = 0; i < count; i++) {
    int value;

    // https://api.dart.dev/dart-math/Random-class.html
    value = rng.nextInt(largestNum) + 1; // Random.nextInt(upperLimit), 0 <= x < upperLimit, 
                                         // so we add 1 to make it an inclusive range 
    lottoNumbers[i] = value;
  }

  print(lottoNumbers.join(' '));
}
