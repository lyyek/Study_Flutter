//바로 return하는 함수일 때 return이랑 괄호 생략하고 =>를 이용해서 곧바로 return(=>)
String sayHi(String name) => "Hi $name!";
num plus(num a, num b)=> a+b;


//Named parameters: {}
String sayHello({
  String name='anon', //방법1: null일 경우 default value로 anon
  required int age, //방법2: required로 설정해서 함수 부를 때마다 반드시 얘를 넣어줘야함
  String country='Wakanda',
  }){
  return "Hello $name, you are $age, and you came from $country!";
}

//Optional positional parameters
String sayBye(
  String name, 
  String month, 
  [int? day=4]
  )=>'Bye $name, see you on $month ${day}th!';


//QQ Operator
//if(name!=null) return name.toUpperCase();
//return 'ANON'; 이거랑 같은 효과

//?: name이 null일 수도 있다
String capitalizeName(String? name)=>name!=null?name.toUpperCase():'ANON';

//더 짧게하기: ??
// left ?? right: left이 null이면 right을 return, else left return
String capitalizeName2(String? name)=>
name?.toUpperCase() ?? 'ANON';


//Typedef
typedef ListOfInts=List<int>;

ListOfInts reverseListNums(List<int> list){
  var reversed=list.reversed;
  return reversed.toList();
}

typedef UserInfo=Map<String,String>;
String infoMsg(UserInfo userInfo){
  return "User: ${userInfo['name']}";
}


void main(){
  //print(sayHello('Toto',2,"US"));->인자 순서 기억해야함(불편)
  print(sayHello(
    age:3,
    country: 'US',
    name: 'Toto'
  ));
  print(sayHello(
    age: 35,
    country:'Korea'));//인자 다 안 넘길 경우
  print(sayHi('Dorothy'));

  print(sayBye('Peter', 'May'));


  capitalizeName('annie');
  capitalizeName(null);

  String? name;
  name ??='default';//name null이면 default로 채워라
  print(name);

  
  print(reverseListNums([1,2,3]));


  print(infoMsg({"name":"kim"}));
}