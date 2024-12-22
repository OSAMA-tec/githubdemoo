
import 'package:flutter_on_boarding/data/a.dart';
List<money> geter() {
  money upwork = money();
  upwork.name = 'upwork';
  upwork.fee = '650';
  upwork.time = 'today';
  upwork.image = 'up.jpg';
  upwork.buy = false;
  money starbucks = money();
  starbucks.buy = true;
  starbucks.fee = '15';
  starbucks.image = 'pizza.jpg';
  starbucks.name = 'Pizza';
  starbucks.time = 'today';
  money trasfer = money();
  trasfer.buy = true;
  trasfer.fee = '100';
  trasfer.image = 'Transfer.png';
  trasfer.name = 'trasfer for Ali';
  trasfer.time = 'jan 30,2022';
  return [upwork, starbucks, trasfer, upwork, starbucks, trasfer];
}
