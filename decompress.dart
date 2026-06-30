import "dart:io";


String decompress(String input) { // start a decompress program that returns string and takes string input  
  StringBuffer result = StringBuffer(); // create a place to store out results 

  int i = 0; // counter set to 0 

  while (i < input.length) { // as long we are not at the last position of the input continue 
    String character = input[i]; // character holds the i-th value from the input  || aaabb , if i is 0 it will be a 

    if (!RegExp(r"[a-zA-Z]").hasMatch(character)) { //check if i is a letter, if true call error 
      print(
        "Invalid character at position $i: '$character'."
        "Expect a letter, but found a digit. "
      );
      break;
    }

    i++; // itterate one up

    String numberText = ""; // create a place holder for out numbers from the string 

    while (i < input.length && RegExp(r"[0-9]").hasMatch(input[i])) {  // as long we are not at the last position and we find a number 0 to 9 
      numberText += input[i]; // we add that value to numberText , so if it is aab3 the nuber text will hold 3 as a value 
      i++; // one up 
    }

    int count; // create an instance of count variable that is an integer 

    if (numberText.isEmpty) { // while looping we found no numbers to store in numberText, we assign a value of 1 to it so we can later write abc if it found only one a, one b, one c 
      count = 1; 
    } else {
      count = int.parse(numberText); // string data type to integer data type  
    }

    for (int j = 0; j < count; j++) { // example a4, loop runs 4 times || as long count is bigger then j 
      result.write(character); //-> write a, write a, write a, write a 
    }
  }

  return result.toString(); 
}

void main(List<String> arguments) { // Program start || arguments is value from the terminal -> dart run compress.dart aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa ||
  String input; 

  if (arguments.isNotEmpty) {
    input = arguments.join(); // check if arguments hold anything? if it does, run it as input 
  } else {
    stdout.write("Enter a string: "); // otherwise promt a user to give us a string 
    input = stdin.readLineSync() ?? "";
  }

  if ( !RegExp(r"^[a-zA-Z0-9]*$").hasMatch(input)) { // if not only lower and upper letters and space are found, show an error || https://api.flutter.dev/flutter/dart-core/RegExp-class.html|| https://api.flutter.dev/flutter/dart-core/RegExp/hasMatch.html
    /* ^ start of the text
    $ end of the text 
    [a-zA-Z] * <- zero or more of these in the array 
    */
    
    print("Invalid input. Only letters are allowed.");
    return;
  }
  String decompressed= decompress(input); // run compresed with the input 
  print(decompressed);
}

// TODO fix integer problem, 15 writes 11111
