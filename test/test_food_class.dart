import '../lib/class_food.dart';

main(){
  Food testF = new Food();
  print(testF.find([Food.pro, Food.VC], 300));
}