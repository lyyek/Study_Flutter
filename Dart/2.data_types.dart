void main(){
  //모두 object(class에서 옴)
  String person='tom';
  bool alive=true;

  //int와 double은 num을 extend
  int age=12;
  double money=74.79;

  //num: int일수도 double일수도
  num x=12;
  x=1.5;


  //Lists[]
  var giveMeFive=true;

  var numbers=[1,2,3,
    if(giveMeFive) 5, //collection if: 포함될 수도 아닐수도 있는 요소
  ];//리스트 만들기1
  //if(giveMeFive){
    //  numbers.add(5);
    // } 이거랑 동일함

  List<int> nums=[1,2,3,];//리스트 만들기2

  nums.add(4);//리스트 값 추가
  nums.first;//리스트의 처음
  nums.last;//리스트의 끝

  print(numbers);


  //String interpolation: string에 변수 값 담기
  var name='Jean';
  var year=2022;
  var greeting='Hello $name, nice to meet you in ${year+2}!';//그냥 대입: $변수 연산: ${변수 연산}
  //escape: \
  print(greeting);


  //Collection for
  var oldFriends=['papaya','banana'];
  var newFriends=[
    'mango',
    'tomato',
    'peach',
    //colllection 안에 들어가있는 for
    for(var friend in oldFriends) "⭐ $friend",
  ];
  //for(var friend in oldFriends){
  //  newFriends.add();
  //} 이거랑 동일
  print(newFriends);


  //Maps{}
  var player={ //Map<String, Object>
  //object: anything
    'name': 'kirby',
    'xp':19.99,
    'superpower':false,
  };

  Map<int,bool> player2={//타입 명확히 알 때(모르면 var 써라)
    1:true,
    2:false,
    3:true,
  };

  Map<List<int>,bool> player3={
    [1,2,3,4]:true,
  };
  //map도 method, property 가짐

  List<Map<String,Object>> players=[
    {
      'name':'miffy',
      'xp':10304930
    },
    {
      'name':'snoopy',
      'xp':343892
    },
  ];


  //Sets{}: 각 요소들 unique함(중복x)
  var setNums={1,2,3};//set 선언1
  Set<int> s={235,323,65};//set 선언2
  s.add(1);
  s.add(1);
  print(s);//1 여러개 추가해도 한 개임
}