void main(List<String> args) {
  if (args.isEmpty) {
    print("Hello World"); 
  } else {
    String name = args.join(" ");
    print("Hallo $name!"); 
    }
}