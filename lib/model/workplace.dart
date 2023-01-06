class Workplace {
  String? company;
  String? location;
  String? end;
  String? start;
  String? position;
  String? desc;
  String? logo;

  Workplace(
      {this.company,
      this.location,
      this.end,
      this.start,
      this.position,
      this.desc,
      this.logo});

  Workplace.fromJson(Map<String, dynamic> json) {
    company = json['company'];
    location = json['location'];
    end = json['end'];
    start = json['start'];
    position = json['position'];
    desc = json['desc'];
    logo = json['logo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['company'] = this.company;
    data['location'] = this.location;
    data['end'] = this.end;
    data['start'] = this.start;
    data['position'] = this.position;
    data['desc'] = this.desc;
    data['logo'] = this.logo;
    return data;
  }
}
