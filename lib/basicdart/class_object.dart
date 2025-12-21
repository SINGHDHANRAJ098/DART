void main(){
  dhanraj Dhanraj =dhanraj();
  dhanraj Dhanraj2 =dhanraj();
 Dhanraj.name= 'dhanraj';
 Dhanraj.lastName = 'singh';
 Dhanraj.age = 21  ;
 Dhanraj.grade= "b";


  Dhanraj2.name= 'kp';
  Dhanraj2.lastName = 'singh';
  Dhanraj2.age = 21  ;
  Dhanraj2.grade= "a";
  Dhanraj.displayinfo();
  Dhanraj.update("a++");

  Dhanraj2.displayinfo();
  Dhanraj2.update("a++");

}

class dhanraj{
     String ?name ;
     String ?lastName  ;
     int ?age ;
     String? grade;

     void displayinfo(){
       print("first name: $name");
       print("last name: $lastName");
       print(" age: $age");
       print(" grade: $grade");

     }
     void update(String newGrade){
       grade = newGrade;
       print("new grade:$newGrade of this $name");
     }

}