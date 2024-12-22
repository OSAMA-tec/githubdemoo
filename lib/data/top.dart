import 'package:flutter_on_boarding/data/a.dart';

List<money> geter_top() {
  money snap_food = money();
  snap_food.time = 'jan 30,2022';
  snap_food.image = 'pizza.jpg';
  snap_food.buy = true;
  snap_food.fee = '- Rs 100';
  snap_food.name = 'macdonald';
  money snap = money();
  snap.image = 'next.png';
  snap.time = 'today';
  snap.buy = true;
  snap.name = 'Transfer';
  snap.fee = '- Rs 60';

  return [snap_food, snap];
}