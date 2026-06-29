import "dart:io";

void main() { // MODULO % 
  
  int? max;
  while( max == null || max < 2) {
    stdout.write("Enter a number: "); // prompt user to enter a number 
    String? input = stdin.readLineSync();
    max = int.tryParse(input ?? ""); // make sure it is int and not a str
    if (max == null || max < 2) {
      print("Invalid input. Please enter a whole number greater than or equal to 2.");
    }
  }


  List<int> primes = []; // instance of empty primes list to store all the primes

  for ( int i = 2; i <= max; i++) {  //for loop to parse from i to max(user input)
    int foundDividers = 0;

    for(int j = 1; j <= i - 1; j++) { // for every instance -1 (we dont need to check for 1) that gets to have max 2 foundDividers we add them to primes list 
      if ( i % j == 0) {
        foundDividers++;
      }
    }
    

    if (foundDividers == 2) { 
      primes.add(i);
    }
  }
  print("Your prime numbers are: $primes");
}