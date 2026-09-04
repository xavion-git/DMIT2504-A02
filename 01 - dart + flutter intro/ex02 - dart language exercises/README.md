# week 01 - dart exercises

Begin by starting a new `dart` project:

```bash
dart create dart-exercises
```

We'll do as many of these together as possible in-class. Highly encourage you to try at least a couple on your own!

## Object Problems

1. Create a `Student` class based on the following UML diagram:

   ```
   Student
   - FirstName: String
   - LastName: String
   - IdNumber: Integer
   + Student()
   + Student(FirstName: String, LastName: String, IdNumber: Integer)
   + GetFirstName(): String
   + SetFirstName(FirstName: String): Void
   + GetLastName(): String
   + SetLastName(LastName: String): Void
   + GetIdNumber(): Integer
   + SetIdNumber(IdNumber: Integer): Integer
   + GetFullName(): String
   ```

   The `GetFullName()` method returns the full student name in the following format:

   ```
   LastName, FirstName
   ```

2. Create a program that makes use of the `Student` class created in question 1 above. The program should allow the user to enter up to 25 students and display a class roster (create an array of type `Student`). Use a menu of options to allow the user to choose either to enter a student's information, to view the report, or to quit. The roster should be formatted as follows:

   ```
   Id Last Name First Name
   -- --------- ----------
   1  Doe       Jane
   2  Anne      Sally
   Total Students: 2
   ```

## Array Problems

1. Create a program that will generate a lottery ticket for the user. The user will enter the number of values in the pick and the range. For example, a lottery pick for 6 values in the range 1-49 might look like the following:

   ```
   7 13 22 34 43 46
   ```

   Store the values in an array of the appropriate length and ensure that there are no duplicates (i.e. the same number must not appear twice). Don't worry about sorting the values.

2. Update the previous solution to allow the user to choose how many picks they would like (choosing 3 picks would yield three separate lottery picks). Include a method that will load an array for a pick with the random values. The method signature should be as follows:

   ```
   static void QuickPick(int[ ] pick, int range)
   ```

   The method should use the length of the array to determine how many values are in the pick. Since arrays are passed by reference, there is no need to return anything.

## Method Problems

1. Write a program to tally up total change from user's pockets. The method `GetTotal()` will have number of pennies, nickels, dimes, quarters, loonies and twoonies passed into it and will return the total amount. All values entered must be integers and positive. Validation is required to ensure a negative value is not allowed.

2. Write a program that will return the number of seconds from hours, minutes and seconds. The method `CalculateSeconds()` will be passed in hours, minutes and seconds. All values entered must be integers and positive. Validation is required to ensure a negative value is not allowed.

3. Write a program to calculate pay. The method `CalculatePay()` will be passed in hours and pay rate and will return gross pay. Pay time and a half for any hours that are worked over 40 but less than 50. Pay double time for any hours that are worked over 50. All values entered must be integers and positive. Validation is required to ensure a negative value is not allowed.

4. Write a program to calculate and display the surface area and volume of a rectangle. The methods `CalculateArea()` and `CalculateVolume()` will be passed in 3 values, length, width, and height and will return the appropriate value. All values entered must be integers and positive. Validation is required to ensure a negative value is not allowed.