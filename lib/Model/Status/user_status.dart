// ignore_for_file: file_names

import 'package:petaverse/Model/User/user.dart';

class Status {
  String title = '';
  String id = '';
  String topic = '';
  String content = '';
  String postingTime = '';
  User author = User('id', 'name','avatarUrl');

  Status(this.title, this.id, this.topic, this.content, this.postingTime,
      this.author);

  Status.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    id = json['id'];
    topic = json['topic'];
    content = json['content'];
    postingTime = json['postingTime'];
    author = User.fromJson(json['author']);
  }

  Map<String, dynamic> toJson() => {
        'title': title,
        'topic': topic,
        'content': content,
        'postingTime': postingTime,
        'author': author.toJson()
      };
}
