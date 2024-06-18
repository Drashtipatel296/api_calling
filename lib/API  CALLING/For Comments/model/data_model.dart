class CommentsModel {
  int? postId;
  int? id;
  String? name;
  String? email;
  String? body;

  CommentsModel({this.postId, this.id, this.body, this.email, this.name});

  factory CommentsModel.fromJson(Map json){
    return CommentsModel(
      postId: json['postId'],
      id: json['id'],
      name: json['name'],
      email: json['email'],
      body: json['body'],
    );
  }
}