// 1. we're going to run this directly as a program -> so I need a main()
// 2. I know I need to handle (command-line) user inputs
// 3. I need some sort of function that returns a list of 6 ints, ranging 1-49 inclusively
// 4. I need some sort of logic function that ensures no duplicates in the list (T

// 5. Plainning for deduplacation:
//  Option A) use ta set, loop until the set is {count} long (set auto deduplicates)
// Option B) use a list, loop until the list is {count} long, check if the value is already in the list before adding it

//2. command-line user inputs: I need to import dart:io module
import 'dart:io';
import 'dart:math'; 

// Main function
// This is the main function input for dart programs 
// It similar to if __name__ == '__main__': in python,
void main() {
    // You can use print() if I want to immediate new line, or
    // stdout.write() if I want to input on the same line
    // print() is basically just shorthand for stdout.writeln
  
  print('How many lottery numbers to pick?'); 
  int count = int.parse(stdin.readLineSync()!);
    
  print('What is the upper bound of numbers to pick? (inclusively) ');
  int largestNum = int.parse(stdin.readLineSync()!);


  // 3. genarte count numbers between 1 and largestNum 
  Random rng = Random();
  List<int> lottoNumbers = List.filled(count, 0); // Count number of elements

   for (int i = 0; i < count; i++) {

    int value = rng.nextInt(largestNum) + 1; // .nextInt(upper range) print(i);
    
    // Option A) check if value exists in the list already,
    // if it does, decrement i to try again, else add the value to the list 
    if (lottoNumbers.contains(value)) {
      i--; // Decrement i to try again
    } else {
      lottoNumbers[i] = value; // assign the value to the list
    }

    lottoNumbers[i] = value; // assign the value to the list


   }
   print(lottoNumbers.join(' '));
}


