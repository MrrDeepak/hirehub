class FilterModal {
  String? state;
  List<String>? location;

  FilterModal({this.state, this.location});

  FilterModal.fromJson(Map<String, dynamic> json) {
    state = json['state'];
    location = json['location'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['state'] = this.state;
    data['location'] = this.location;
    return data;
  }
}