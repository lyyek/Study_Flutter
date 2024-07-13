//json 형식의 데이터를 받아서 클래스로 바꿔주기 위함
class WebtoonModel {
  final String title, thumb, id;

//named constructor(:)
  WebtoonModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        thumb = json['thumb'],
        id = json['id'];
}
