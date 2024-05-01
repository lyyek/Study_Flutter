void main(){
  print('hello world');

  //변수 선언 방법1
  //주로 함수나 메소드 내부에서 지역 변수 선언 시 사용
  var name1='ye'; //compiler가 type 추측해줌. 하지만 변수에 새로운 값 넣을 때 타입 맞춰서 넣어야함.
  
  //변수 선언 방법2
  //주로 class에서 변수나 속성 선언 시 사용
  String name2='o'; //type 명시 선언 방법

  final name3='yeo'; //수정 불가(js의 const)
  //final String name3='yeo'; 이렇게 타입 명시해도 됨

  //dynamic type: 필요할 때만 써라
  var dynamic_var;//var 이용
  dynamic dynamic_var2; //타입 명시 선언하는 방법
  dynamic_var='hi';
  dynamic_var=3;
  dynamic_var=true;
  if(dynamic_var2 is String){//string이라면

  }
  if(dynamic_var2 is int){//int라면

  }


  //null safety: data가 null이 될 수 있음을 명시하여 null을 참조하지 않게함
  String apple='red';//apple=null; -> apple이 String이어야 하므로 안됨

  //어떤 변수가 null일 수도 있다: ? 사용
  String? pear='yellow';
  pear=null;
  if(pear!=null){//pear가 null일 수도 있어서 아닐 때만 처리 가능하게
    pear.isNotEmpty;
  }
  //if문으로 확인하는 대신에 이런 방법도 있음
  pear?.isNotEmpty; //pear가 null이 아니라면 isNotEmpty 속성을 달라

  
  //late: 초기 데이터 없이 변수 선언
  //data fetching할 때 유용(무슨 타입이 올지 모르니까)
  late final String str;
  //do something, go to api
  //print(str); -> 오류(빈 값이라서)
  str='late';

  //const: js의 const와 다름(이건 final에 가깝). compile time constant를 생성.
  //compile time에 알고 있어야하는 값
  //앱이 앱스토어에 올라가기 전에 알고 있는 값
  //const API=fetchApi(); -> 오류(api에서 값 받아와야해서 compiler가 모르는 값임.)
  //사용자가 화면에서 입력 또는 api로 받아와야하는 값->final, var 사용
  const max_allowed_price=120;
  //max_allowed_price=12; -> final처럼 수정 불가
}