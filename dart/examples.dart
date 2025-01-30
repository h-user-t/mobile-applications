/* Comments
Variables and Data types
Control Flows and Looping
Functions and methods
Void creates a function with no return value
main() is just the name of the function (reserved word)
{ code to be executed when the function runs }
*/
void main() {
  // call a function
  greeting();
  print(addTwo(100));

  int result = addTwo(30);
  print(result);

  var inferredString = "William";

  String explicitString = "Jattin";
  print(inferredString + " "  + explicitString);

  // null safety
  int? someNumber;
  print(someNumber);
  someNumber = 12;
  print(someNumber);
  // late keyword
  late int willBeNumber;
  //
  int? goals;
  // control flow of the program when accessing the variable
  if (goals != null) {
      print(goals + 2);
  } else {
    print("the variable goals is null");
  }

// Built in data types
// Numeric
int age = 21;
num count = 3;
double temp = 29.9;
// Bools
bool isReady = false;
// Collections: lists, arrays, and maps
// Strings for expressing text
String school = "University of Miami";

print("My school is " + school);

// Using placeholders to insert variables inside strings
print("My school is $school");

// Built-in type operations
print("my school name has ${school.length} characters");

if(school.length > 20){
  print("This name is really long");
} else {
  print("Your school has a short name");
}
// control operators
// > greater than
// < less than
// >= greater than or equal to
// <= less than or equal to
// == equal to
// != not equal to
// % modulus

// Arithmetic operators
// + addition
// - subtraction
// * multiplication
// / division
// % modulus
// Math Shortcuts
int x = 10;
x = x + 5;
// same as
x += 5; //20 -= *= /= %=
// ! the opposite of an expression
bool isHere = false; // !isHere is evaluated as true
// || or operator, one condition must be true
if(isHere || (school.length < 10)) {
  // do something
}
// and operator all conditions must be true
if(!isHere && (school.length < 10) ) {
  // do something
}

// while loops
int counter = 0;
while(counter < 2){
  print(counter);
  counter++;
}

// do while
do {
  print(counter);
  counter++;
  } while(counter < 20);

}
// variable declaration
// type identifier/name = value;
// dynamic types
// var identifier/name = value;

// custom function
void greeting () {
  print("hello");
}
// operation with options (parameters)
int addTwo(int number){
  return number + 2;
}
