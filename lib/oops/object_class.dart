void main (){

  Person person = Person();
  person.name = 'dhanraj';
  person.name2= 'kp';

  person.displayinfo();

}
class Person{
  String ?name;
  String ?name2;
  int age = 21;

  void displayinfo(){

    print("${name}");
    print("${name2}");

    print("${age}");
  }

}