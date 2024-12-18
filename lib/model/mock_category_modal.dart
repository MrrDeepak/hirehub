class MockTestCategoryModal {
  String? sId;
  String? testName;
  String? imgUrl;
  List<String>? testType;
  int? iV;

  MockTestCategoryModal({this.sId, this.testName, this.imgUrl, this.testType, this.iV});

  MockTestCategoryModal.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    testName = json['testName'];
    imgUrl = json['imgUrl'];
    testType = json['testType'].cast<String>();
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['testName'] = this.testName;
    data['imgUrl'] = this.imgUrl;
    data['testType'] = this.testType;
    data['__v'] = this.iV;
    return data;
  }
}