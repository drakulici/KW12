import "dart:io";

/* void main() {
  
  stdout.write("Please enter your first name:");
  String firstName = stdin.readLineSync()!;
 
  stdout.write("Please enter your last name:");
  String lastName = stdin.readLineSync()!;

  stdout.write("Please enter your gender (male, female, diverse):");
  String gender = stdin.readLineSync()!;
  
  stdout.write("How old are you? Please entere your age:");
  int age = int.tryParse(stdin.readLineSync()!);

  print("$firstName, $lastName, $gender, $age");


  

} */
 
void main() {

  String? firstName;

  while (firstName == null || firstName.trim().isEmpty) { 
    stdout.write("Please enter your first name:");
    firstName = stdin.readLineSync();

    if (firstName == null || firstName.trim().isEmpty){ //trim strips string of spaces " " 
      print("First name can not be empty.");
    }
  }

  String? lastName;
  while (lastName == null || lastName.trim().isEmpty) {
    stdout.write("Please enter your last name:");
    lastName = stdin.readLineSync();

    if (lastName == null || lastName.trim().isEmpty){
      print("Last name can not be empty.");
    }
  }

  int? age;
  while (age == null || age < 0 || age > 150 ) {
    stdout.write("How old are you? Please enter your age: ");

    String? input = stdin.readLineSync();
    age = int.tryParse(input ?? "");

    if (age == null || age <  0 || age > 150) {
      print("Wrong input! Please write your correct age.");
    }    
  }


  String? gender;
  while (gender != "male" && gender != "female" && gender !="other") {
    stdout.write("Please enter your gender (male, female, other): ");
    gender = stdin.readLineSync();

    if (gender != "male" && gender != "female" && gender !="other") {
      print("Incorect entry! Please enter one of the offered (male, female, other)");
    } else 
      print("Thank you for loging in.");
  }


  if (age < 40) {
    print("Hello $firstName!");
  } else {
    DateTime now = DateTime.now();
    // int hour = now.hour;
    int hour = 12; 

    if (hour < 10) {
      if (gender == "male") {
      print("Guten Morgen Herr $lastName!");
      } else if (gender == "female") {
      print("Guten Morgen Frau $lastName!");
      } else if (gender == "other") {
      print("Guten Morgen $firstName $lastName");
      }       
    } else if (hour > 10 && hour < 18) {
      if (gender == "male") {
      print("Guten Tag Herr $lastName!");
      } else if (gender == "female") {
      print("Guten Tag Frau $lastName!");
      } else if (gender == "other") {
      print("Guten Tag $firstName $lastName");
      }
    } else {
      if (gender == "male") {
      print("Guten Abend Herr $lastName!");
      } else if (gender == "female") {
      print("Guten Abend Frau $lastName!");
      } else if (gender == "other") {
      print("Guten Abend $firstName $lastName");
      }
    }
  } 
}