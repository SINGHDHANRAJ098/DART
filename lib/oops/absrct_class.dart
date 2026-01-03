// abstract class Vehicle {
//   void start(); // abstract method (no body)
//
//   void stop() {
//     print("Vehicle stopped"); // concrete method
//   }
// }
//
// void main(){
//
//
// }
// abstract class Vehicle {
//   void start();
//
//   void stop() {
//     print("Vehicle stopped");
//   }
// }





void main() {
  List<String> cityList = ["Delhi", "Mumbai", "Pune", "Delhi", "Goa"];

  Set<String> citySet = cityList.toSet();

  print("City List: $cityList");
  print("City Set (Unique): $citySet");
}
