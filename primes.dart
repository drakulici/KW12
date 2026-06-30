import "dart:io";
// https://en.wikipedia.org/wiki/Sieve_of_Eratosthenes EFFICIENCY 


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

  // brute force - How many dividers does this number have? 

  Stopwatch bruteWatch = Stopwatch()..start();  // start timer to time efficiency 

  List<int> primes1 = []; // instance of empty primes list to store all the primes

  for ( int i = 2; i <= max; i++ ) {  //for loop to parse from i to max(user input) 
    int foundDividers = 0;

    for(int j = 1; j <= i; j++) { // for every instance -1 (we dont need to check for 1) that gets to have max 2 foundDividers we add them to primes list 
      if ( i % j == 0) {
        foundDividers++;
      }
    }
    

    if (foundDividers == 2) { 
      primes1.add(i);
    }
  }
  bruteWatch.stop(); // stop timer



  print("*BRUTE* Your prime numbers are: $primes1");
  print("Time it took: ${bruteWatch.elapsedMicroseconds} microseconds.");

  // optimisation - does this nuber have more then 2 dividers? 


  Stopwatch optiWatch = Stopwatch()..start(); // timer to time efficiency 

  List<int> primes2 = []; // instance of empty list

  for (int i = 2; i <= max; i++) { 
    bool isPrime = true; // start with assumption the number is prime ( true ) and then disprove it by using modulo 
      /* logic here is that prime has only 2 dividers 1 and itself  
        - example i = 9 -> dividers 1, 9 and algo finds imediately 3, so it breaks the loop... 
        - example i = 17, 2 < 17, so it checks up to 17, 3,4,5,6,7,8,9,10,11,12,13,14,15,16 and it breaks the loop
        */
    for ( int j = 2; j < i; j++) {
      if (i % j == 0) { 
        isPrime = false;
        break;
      }
    }
  if( isPrime) { //add i to the list
    primes2.add(i);
  }
  }

  optiWatch.stop(); // stop timer

  print("###############################################################");
  print("Optimised algo solution is : $primes2");
  print("Time it took: ${optiWatch.elapsedMicroseconds} microseconds.");
}
