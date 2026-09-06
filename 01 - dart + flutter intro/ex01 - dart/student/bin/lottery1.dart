import 'dart:io'; 

// Main function
void main() {
    // You can use print() if I want to immediate new line, or
    // stdout.write() if I want to stay on the same line
    // 
    stdout.write('How many lottery numbers to pick?');
    int count = int.parse(stdin.readLineSync()!);
    stdout.write(count);

    
}
