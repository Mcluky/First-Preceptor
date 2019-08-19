import 'package:preceptor/preceptor.dart';
import 'package:test/test.dart';

main(List<String> arguments) {
  List exampleData = [
    {
      "input": [255.0, 255.0, 255.0],
      "target": -1,
    },
    {
      "input": [0.0, 0.0, 0.0],
      "target": 1,
    },
    {
      "input": [129.0, 219.0, 216.0],
      "target": -1,
    },
    {
      "input": [71.0, 12.0, 64.0],
      "target": 1,
    },
    {
      "input": [222.0, 222.0, 64.0],
      "target": -1,
    },
    {
      "input": [64.0, 53.0, 56.0],
      "target": 1,
    },
    {
      "input": [185.0, 217.0, 184.0],
      "target": -1,
    },
    {
      "input": [255.0, 17.0, 0.0],
      "target": -1,
    },
    {
      "input": [0.0, 64.0, 255.0],
      "target": 1,
    },
    {
      "input": [143.0, 77.0, 142.0],
      "target": 1,
    },
  ];


  Preceptor preceptor = Preceptor(3);

  print("Before training...\n");

  exampleData.forEach((obj) {
    List<num> input = obj["input"];
    num actual = obj["target"];
    num guess = preceptor.guess(input);
    printBlackOrWhite(guess, actual);
  });

  print("\n---------------------------------------\n");

  print("Weights after each training\n");

  for(int i = 0; i < 20; i++) {
    exampleData.forEach((obj) {
      List<num> input = obj["input"];
      num actual = obj["target"];
      preceptor.train(input, actual);
      //print(preceptor.weights);
    });
  }

  print("\n Final weights:");
  print(preceptor.weights);

  print("\n---------------------------------------\n");

  print("After training...\n");

  exampleData.forEach((obj) {
    List<num> input = obj["input"];
    num actual = obj["target"];
    num guess = preceptor.guess(input);
    printBlackOrWhite(guess, actual);
  });

  //print('Hello world: ${preceptor.calculate()}!');
}

///Prints "Black" for -1 and "White" for 1
void printBlackOrWhite(num val, num actual){
  var color = val == 1 ? "White" : "Black";
  if(val == actual){
    print(color);
  } else {
    print("[Wrong] " + color);
  }
}
