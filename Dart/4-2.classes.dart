//inheritance
class Human{
  final String name;
  Human({required this.name}); //Human(this.name); -> Student에서 super(name)으로

  void sayHello(){
    print("Hello my name is $name");
  }
}

enum Team {red,blue}

class Student extends Human{
  final Team team;

  Student({ //부모 클래스 생성자가 이미 있을 때
    required this.team,
    required String name,
  }): super(name: name); //Human에 name 보내줌(Human(this.name) 호출)

  //override
  @override 
  void sayHello(){//Human의 sayHello에다가 추가하고 싶다
    super.sayHello(); //부모클래스 호출
    print('and I play for ${team}');
  }
}


//Mixin: 생성자가 없는 클래스
//클래스에 property 추가할 때 사용. 하나의 클래스에만 쓰일거라면 의미 없음. 여러 클래스에 재사용할 때
mixin class Strong{
  final double strengthLevel=1500.99;
}

mixin class QuickRunner{
  void runQuick(){
    print("ruuuuuuun!!!!");
  }
}

//with: 상속 안 하고 다른 클래스의 property, method 긁어오기
class Athlete with Strong, QuickRunner{
  final Team team;

  Athlete(this.team);

  void introduce(){
    print("Hi I'm an athlete");
  }
}

//mixin 재사용
class Horse with Strong{}

void main(){
  var student=Student(team:Team.red, name:'chacha');
  
  student.sayHello();
}