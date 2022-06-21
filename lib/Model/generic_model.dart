class Generic {
  String name = '';
  int id = 0;
  String? type = '';
  Generic({
    required this.id,
    required this.name,
  });
  Generic.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
  Map<String, dynamic> toJson() => {'id': name, 'name': name};
}
