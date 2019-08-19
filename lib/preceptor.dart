import 'dart:math';

class Preceptor {
  static num _bias = 1;
  static num _learning_rate = 0.1;

  List<num> weights;

  Preceptor(num amountInputs,
    {num bias = 1,
      num function(num input, num weight, num bias) = defaultFunction}){

    weights = List(amountInputs);
    Random r = Random();
    for(int i = 0; i < amountInputs; i++){
      weights[i] = (r.nextInt(10) - 5);
    }
  }

  /// Returns either 1 or -1 for given input (for now at least)
  num guess(List<num> input){
    num sum = 0;
    for(int i = 0; i < input.length; i++){
      sum += defaultFunction(input[i], weights[i], _bias);
    }
    return sum >= 0 ? 1 : -1;
  }

  void train(List<num> input, num target){
    num guess = this.guess(input);
    num error = target - guess;

    for(int i = 0; i < input.length; i++){
      weights[i] += error * input[i] * _learning_rate;
    }
  }
}

/// very basic function
/// y = mx + q
num defaultFunction(num input, num weight, num bias){
  //very basic function
  // y = mx + q
  return weight * input + bias;
}