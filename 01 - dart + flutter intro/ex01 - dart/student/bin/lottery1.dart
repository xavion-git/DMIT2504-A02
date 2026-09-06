// 1. we're going to run this directly as a program -> so I need a main()
// 2. I know I need to handle (command-line) user inputs
// 3. I need some sort of function that returns a list of 6 ints, ranging 1-49 inclusively
// 4. I need some sort of function that ensures no duplicates in the list (T

//2. command-line user inputs: I need to import dart:io module
import 'dart:io'; 

// Main function
// This is the main function input for dart programs 
// It similar to if __name__ == '__main__': in python,
void main() {
    // You can use print() if I want to immediate new line, or
    // stdout.write() if I want to input on the same line
    // print() is basically just shorthand for stdout.writeln
  
  stdout.write('How many lottery numbers to pick?');
  int count = int.parse(stdin.readLineSync()!);
    
  stdout.write('What is the upper bound of numbers to pick? (inclusively) ');
  int largestNum = int.parse(stdin.readLineSync()!);

}
