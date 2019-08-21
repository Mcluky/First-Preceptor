import 'dart:math';

class Preceptor {
  num bias;
  num learning_rate;
  Function activationFunction;

  List<num> weights;
  num biasWeight;

  Preceptor(num amountInputs, {
    this.bias = 1,
    this.learning_rate = 0.1,
    this.activationFunction(num input) = defaultActivationFunction}){

    weights = List(amountInputs);
    Random r = Random();
    for(int i = 0; i < amountInputs; i++){
      weights[i] = r.nextInt(10) - 5;
    }
    biasWeight = r.nextInt(10) - 5;
  }

  /// Returns either 1 or -1 for given input (for now at least)
  num guess(List<num> input){
    num sum = 0;
    for(int i = 0; i < input.length; i++){
      sum += weights[i] * input[i];
    }

    sum += biasWeight * bias;

    return this.activationFunction(sum);
  }

  void train(List<num> input, num target){
    num guess = this.guess(input);
    num error = target - guess;

    for(int i = 0; i < input.length; i++){
      weights[i] += error * input[i] * learning_rate;
    }

    biasWeight += error * bias * learning_rate;
  }
}

/// very basic activation function
/// returns 1 if bigger than or equal to 0 and otherwise -1
num defaultActivationFunction(num input){
  return input >= 1 ? 1 : -1;
}