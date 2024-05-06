//defining class, constructors
class Player{
  //class 생성 시에는 타입 명시해주기

  //late: 변수 값 나중에 받아오겠다
  //final: 변수 값 바꾸지 마라
  //(생성자 방법1에 대응되는 선언 방식: late 사용)
  // late final String name;
  // late int xp;

  //(생성자 방법2에 대응되는 선언 방식: late 안 씀)
  // late 사용하지 않는 이유: 값이 바로 초기화되기 때문
  final String name;
  int xp;

  //Constructors

  // 생성자 방법1
  // Player(String name, int xp){
  //   this.name=name;
  //   this.xp=xp;
  // }

  //생성자 방법2
  Player(this.name,this.xp);//대응되는 위치가 중요


  void sayHi(){
    //class 내에서는 this 사용하지 않는 것 권장
    //따로 sayHi 내에서 name이라는 변수를 선언해서 이와 구분할 경우엔 ${this.name}
    print("Hi my name is $name");
  }
}

//named constructor parameters
class Player2{
  final String name;
  int xp, age;
  String team;

  Player2({
    required this.name, //null이 될 수도 있어서 required를 붙여줌
    required this.xp, 
    required this.team, 
    required this.age});

   void sayHi(){
    //class 내에서는 this 사용하지 않는 것 권장
    //따로 sayHi 내에서 name이라는 변수를 선언해서 이와 구분할 경우엔 ${this.name}
    print("Hi my name is $name");
  } 

  //named constructor
  //name, age만 받고 나머지는 미리 정한 값으로 클래스 초기화
  //named syntax 사용: required 따로 명시해야 함
  Player2.createBluePlayer({
    required String name,
    required int age,
  }): this.age=age, //colon(:)을 쓰고 초기화해주기
      this.name=name,
      this.team='blue', //기본값으로 넣어주기
      this.xp=0;

  //positional syntax 사용: default로 required
  Player2.createRedPlayer(String name, int age): this.age=age,
    this.name=name,
    this.team='red',
    this.xp=0;
}


//cascade notation
//enum (ex. Color.red)
enum Team {red,blue}//red, blue 오타낼 수도 있다
enum XPLevel {beginner, medium, pro}

class Player3{
  String name;
  XPLevel xp;
  Team team; //String이 아닌 Team을 사용

  Player3({required this.name, required this.xp, required this.team});

  void sayHello(){
    print("Hi my name is $name");
  }
}


//abstract
//클래스가 가지고 있어야하는 메소드들이 정의됨
//메소드 자체를 정의하지 않음
abstract class Human{
  void walk();
}

class Coach extends Human{//Human 상속
  void walk(){//Human에는 반드시 walk이 들어가야함
    print("I walk. I'm a coach.");
  }
}

class Spectator extends Human{//Human 상속
  void walk(){//Human에는 반드시 walk이 들어가야함
    print("I walk. I'm a spectator.");
  }
}



void main(){
  var player=Player('mickey mouse',1500); //new Player() 써도 되는데 필수는 아님
  player.sayHi();
  //player.name='minnie'; -> final로 선언해서 오류

  var player2=Player2(
    name: 'minnie mouse', //required라서 입력 안 하면 오류
    team: 'blue',
    xp: 2300,
    age: 12);

  player2.sayHi();

  //named syntax
  var bluePlayer=Player2.createBluePlayer(
    name: "donald duck",
    age: 11,
  );

  //positional syntax
  var redPlayer=Player2.createRedPlayer(
    "daisy duck",
    11,
  );


  //cascade notation
  var goofy=Player3(name: 'gooofy', xp:XPLevel.pro, team: Team.blue);
  //값 변경 위해서 goofy를 여러번 가져옴(불편)
  goofy.name='goofy';
  goofy.xp=XPLevel.beginner;
  goofy.team=Team.red;

  //(해결) pluto 대신 .을 사용  
  var pluto=Player3(name: 'plutoo', xp:XPLevel.beginner, team: Team.red)  
    ..name='pluto'
    ..xp=XPLevel.medium
    ..team=Team.blue;//'blue'가 아닌 Team.blue 사용

  var totoro=pluto
    ..name='totoro'
    ..xp=XPLevel.pro
    ..team=Team.red
    ..sayHello();
}