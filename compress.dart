import "dart:io";

// https://api.flutter.dev/flutter/dart-core/StringBuffer-class.html

/* helper function that receives result we are building, 
  current character, and count of how many times the letter appears */
void writeGroup(StringBuffer result, String character, int count) {   
  
  if (count >= 3 ) { // letter hast to appear 3 or more times 
    result.write("$character$count"); // aaa -> a3 , bbbbb -> b4 
  } else {
    for (int i=0; i < count; i++) {
      result.write(character);
    }
  }
}

String compress(String input) { // we define compress function that takes one input String 
  if( input.isEmpty) { //check if it's empty
    return ""; // returns empty string
  }
      
  StringBuffer result = StringBuffer(); // create a place holder instance for result
  
  String currentCharacter = input[0]; // look at the first letter in the input
  int count = 1; // count it as first 

  for (int i = 1; i < input.length; i++ ) { //now itterate over the whole input 
    String nextCharacter = input[i]; // nextCharacter is the letter at i position in the input

    if ( nextCharacter == currentCharacter) { // when next and current character are the same/true -> then raise the counter value || aa -> counter=2 || aaa -> counter 3
      count ++;
    } else { // when it's a different letter then call writeGroup and write it down, aa for example
      writeGroup(result, currentCharacter, count);
      currentCharacter = nextCharacter;
      count = 1;
    }
  }

  writeGroup(result, currentCharacter, count);
  return result.toString(); // convert StringBuffer to normal String 
} 

void main(List<String> arguments) { // Program start || arguments is value from the terminal -> dart run compress.dart aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa ||
  String input; 

  if (arguments.isNotEmpty) {
    input = arguments.join(); // check if arguments hold anything? if it does, run it as input 
  }else {
    stdout.write("Enter a string: "); // otherwise promt a user to give us a string 
    input = stdin.readLineSync() ?? "";
  }

  if ( !RegExp(r"^[a-zA-Z ]*$").hasMatch(input)) { // if not only lower and upper letters and space are found, show an error || https://api.flutter.dev/flutter/dart-core/RegExp-class.html|| https://api.flutter.dev/flutter/dart-core/RegExp/hasMatch.html
    /* ^ start of the text
    $ end of the text 
    [a-zA-Z] * <- zero or more of these in the array 
    */
    
    print("Invalid input. Only letters are allowed.");
    return;
  }

  String compressed = compress(input); // run compresed with the input 
  print(compressed);
}

// TODO search for why from terminal arguments doesent take multiple values 
// because it had input = arguments[0] instead of taking everything and joining it 