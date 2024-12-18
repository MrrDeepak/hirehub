class GovernmentJobData {
  int? code;
  int? statusCode;
  String? message;
  Result? result;

  GovernmentJobData({this.code, this.statusCode, this.message, this.result});

  GovernmentJobData.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    statusCode = json['statusCode'];
    message = json['message'];
    result =
        json['result'] != null ? new Result.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['statusCode'] = this.statusCode;
    data['message'] = this.message;
    if (this.result != null) {
      data['result'] = this.result!.toJson();
    }
    return data;
  }
}

class Result {
  List<GovernmentCategoryModel>? data;

  Result({this.data});

  Result.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <GovernmentCategoryModel>[];
      json['data'].forEach((v) {
        data!.add(new GovernmentCategoryModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GovernmentCategoryModel {
  String? sId;
  String? categoryName;
  String? categoryType;
  String? status;
  String? color;
  String? image;
  String? createdAt;
  String? updatedAt;
  int? iV;

  GovernmentCategoryModel(
      {this.sId,
      this.categoryName,
      this.categoryType,
      this.status,
      this.color,
      this.image,
      this.createdAt,
      this.updatedAt,
      this.iV});

  GovernmentCategoryModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    categoryName = json['categoryName'];
    categoryType = json['categoryType'];
    status = json['status'];
    color = json['color'];
    image = json['image'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['categoryName'] = this.categoryName;
    data['categoryType'] = this.categoryType;
    data['status'] = this.status;
    data['color'] = this.color;
    data['image'] = this.image;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}