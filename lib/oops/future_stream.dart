// void main(){
//   print("program started");
//
//   Future.delayed(Duration(seconds: 5),(){
//     print("data loaded  in 5 sec");
//   });
//   print("program ended 90");
// }



//
// mixin Walk {
//   void walk() => print("walking");
// }
//
// mixin Run {
//   void run() => print("running");
// }
//
// class Human with Walk, Run {}
//
// void main() {
//   var h = Human();
//   h.walk();
//   h.run();
// }



class Employee {
  String name;
  double salary;

  Employee(this.name, this.salary);


  Employee.intern(String name)
      : this(name, 5000);
}

class Manager extends Employee {
  int teamSize;

  Manager(String name, double salary, this.teamSize)
      : super(name, salary);
}

void main() {
  Manager m1 = Manager("Neha", 60000, 5);

  print("Manager: ${m1.name}");
  print("Salary: ${m1.salary}");
  print("Team Size: ${m1.teamSize}");
}

