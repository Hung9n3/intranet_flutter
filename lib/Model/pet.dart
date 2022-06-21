class Pet {
  String name = '';
  String id = '';
  String department = '';
  int credits = 1;
  String courseCode = '';
  int classes = 1;
  Pet(this.name, this.id, this.department, this.credits);
  Pet.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    department = json['department'];
    credits = json['credits'];
    courseCode = json['courseCode'];
    classes = json['classes'];
  }
  Map<String, dynamic> toJson() =>
      {'name': name, 'credits': credits, 'courseCode': courseCode};
}
