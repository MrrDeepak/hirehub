class HomepageModal {
  String? name;
  int? newJobs;
  int? applied;

  HomepageModal({this.name, this.newJobs, this.applied});

  HomepageModal.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    newJobs = json['newJobs'];
    applied = json['applied'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['newJobs'] = this.newJobs;
    data['applied'] = this.applied;
    return data;
  }
}