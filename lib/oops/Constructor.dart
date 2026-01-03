// void main (){
//   String name = "Hello";
//
//   int i = 0;
//   do{
//     print(name[i]);
//     i++;
//    } while(i<name.length);
//   // {
//   //   // print(name[i]);
//   //   // i = i+1;
//   //
//   // }
// }


/// model using factory constructer

class User {
  final int age;
  final String name;

  User({required this.age, required this.name});

  factory User.formJson(Map<String ,dynamic> json) =>
      User(age: json['age'], name: json['name']);
}



