class Skill {
  int? id;
  String? name;
  String? type;
  String? imgSrc;

  Skill({this.id, this.name, this.type, this.imgSrc});

  Skill.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
    imgSrc = json['img_src'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['type'] = this.type;
    data['img_src'] = this.imgSrc;
    return data;
  }
}
