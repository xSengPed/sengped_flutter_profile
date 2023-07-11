class Profile {
  String? avatarUrl;
  String? name;
  String? jobTitle;
  String? workInfo;
  String? introduction;
  List<Awards>? awards;

  Profile(
      {this.avatarUrl,
      this.name,
      this.jobTitle,
      this.workInfo,
      this.introduction,
      this.awards});

  Profile.fromJson(Map<String, dynamic> json) {
    avatarUrl = json['avatar_url'];
    name = json['name'];
    jobTitle = json['job_title'];
    workInfo = json['work_info'];
    introduction = json['introduction'];
    if (json['awards'] != null) {
      awards = <Awards>[];
      json['awards'].forEach((v) {
        awards!.add(Awards.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['avatar_url'] = avatarUrl;
    data['name'] = name;
    data['job_title'] = jobTitle;
    data['work_info'] = workInfo;
    data['introduction'] = introduction;
    if (awards != null) {
      data['awards'] = awards!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Awards {
  String? title;
  String? issueBy;
  String? date;
  String? desc;

  Awards({this.title, this.issueBy, this.date, this.desc});

  Awards.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    issueBy = json['issue_by'];
    date = json['date'];
    desc = json['desc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['title'] = title;
    data['issue_by'] = issueBy;
    data['date'] = date;
    data['desc'] = desc;
    return data;
  }
}
