import 'dart:io';
import 'dart:math';

void main() {

  Random random = Random();
  

  int? throws; // this is how many throws will it be thrown
  while( throws == null || throws <= 0) {
    stdout.write("How many throws do you want to throw?");
    String? input = stdin.readLineSync();
    throws = int.tryParse(input ?? ""); //transform str to int

    if ( throws == null || throws <=0) { //then make sure it is greater then 0
      print("Invalid input. Please enter a number greater then 0.");
    }
  }

  List<int> rolls = []; // create empty rolls list 
  bool doubleSix = false; // create doubleSix bool value to use for comparison 

  int throwCount = 0; // "place holder for throw count"

  while( throwCount < throws && doubleSix == false ) { 
    int diceRollValue = random.nextInt(6) + 1; // https://api.dart.dev/dart-math/Random-class.html || needs to be inside while loop, otherwise it will use only one value 
    rolls.add(diceRollValue);
    throwCount++;
    
    if (rolls.length >= 2 && rolls[rolls.length - 1] == 6 && rolls[rolls.length - 2] == 6) {
      doubleSix = true;
    } 
  }

  if(doubleSix) {
    print("WINER! Two sixes in a row! It took $throwCount throws");
    print("Your rolls are : $rolls");
  } else { 
    print("Limit reached! $rolls rolls.");
    print("All rolls: $rolls");
  } 
}

