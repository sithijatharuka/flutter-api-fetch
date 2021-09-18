class PostModel {
  int id;
  String title;
  String body;

  PostModel({required this.id, required this.title, required this.body});

  static PostModel fromjson(json) => PostModel(
        id: json['id'],
        title: json['title'],
        body: json['body'],
      );
}
