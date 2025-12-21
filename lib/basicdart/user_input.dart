

import 'dart:io';

void main (){
  print("enter your name");
  String name = stdin.readLineSync()!;
  print("enter your age ");
  int age = int.parse(stdin.readLineSync()!);
  print(age);

  print(name);
  stdout.write("enter about you");

  var data = stdin.readLineSync()!;
  print(data);
}