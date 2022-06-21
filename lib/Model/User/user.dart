
class User {
  String id = '';
  String name = '';
  String avatarUrl = '';
  List<int>? followerId;
  User(this.id, this.name, this.avatarUrl);

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    avatarUrl = json['avatarUrl'];
    followerId = json['followerId'];
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'avatarUrl': avatarUrl,
        'followerId': followerId
      };
}
