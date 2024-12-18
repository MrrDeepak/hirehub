// class IgnouDataModel {
//   List<IgnouDataModel>? data;

//   IgnouDataModel({this.data});

//   IgnouDataModel.fromJson(Map<String, dynamic> json) {
//     if (json['data'] != null) {
//       data = <IgnouDataModel>[];
//       json['data'].forEach((v) {
//         data!.add(new IgnouDataModel.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.data != null) {
//       data['data'] = this.data!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

class IgnouDataModel {
  String? sId;
  String? degreeType;
  String? createdAt;
  String? updatedAt;
  int? iV;
  List<FormData>? formData;

  IgnouDataModel(
      {this.sId,
      this.degreeType,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.formData});

  IgnouDataModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    degreeType = json['degreeType'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    if (json['formData'] != null) {
      formData = <FormData>[];
      json['formData'].forEach((v) {
        formData!.add(new FormData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['degreeType'] = this.degreeType;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    if (this.formData != null) {
      data['formData'] = this.formData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FormData {
  String? program;
  String? fieldOfStudy;
  String? college;
  String? location;
  String? totalFee;
  String? eligibility;
  int? platformFee;
  String? ageLimit;
  String? documents;
  String? imgUrl;
  String? sId;

  FormData(
      {this.program,
      this.fieldOfStudy,
      this.college,
      this.location,
      this.totalFee,
      this.eligibility,
      this.platformFee,
      this.ageLimit,
      this.documents,
      this.imgUrl,
      this.sId});

  FormData.fromJson(Map<String, dynamic> json) {
    program = json['program'];
    fieldOfStudy = json['fieldOfStudy'];
    college = json['college'];
    location = json['location'];
    totalFee = json['totalFee'];
    eligibility = json['eligibility'];
    platformFee = json['platformFee'];
    ageLimit = json['ageLimit'];
    documents = json['documents'];
    imgUrl = json['imgUrl'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['program'] = this.program;
    data['fieldOfStudy'] = this.fieldOfStudy;
    data['college'] = this.college;
    data['location'] = this.location;
    data['totalFee'] = this.totalFee;
    data['eligibility'] = this.eligibility;
    data['platformFee'] = this.platformFee;
    data['ageLimit'] = this.ageLimit;
    data['documents'] = this.documents;
    data['imgUrl'] = this.imgUrl;
    data['_id'] = this.sId;
    return data;
  }
}

///
/*class IgnouDataModel {
  String? sId;
  String? degreeType;
  String? program;
  String? fieldOfStudy;
  String? college;
  String? location;
  int? totalFee;
  String? eligibility;
  int? platformFee;
  String? ageLimit;
  String? documents;
  String? imgUrl;
  String? createdAt;
  String? updatedAt;
  int? iV;

  IgnouDataModel(
      {this.sId,
      this.degreeType,
      this.program,
      this.fieldOfStudy,
      this.college,
      this.location,
      this.totalFee,
      this.eligibility,
      this.platformFee,
      this.ageLimit,
      this.documents,
      this.imgUrl,
      this.createdAt,
      this.updatedAt,
      this.iV});

  IgnouDataModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    degreeType = json['degreeType'];
    program = json['program'];
    fieldOfStudy = json['fieldOfStudy'];
    college = json['college'];
    location = json['location'];
    totalFee = json['totalFee'];
    eligibility = json['eligibility'];
    platformFee = json['platformFee'];
    ageLimit = json['ageLimit'];
    documents = json['documents'];
    imgUrl = json['imgUrl'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> IgnouDataModel = new Map<String, dynamic>();
    IgnouDataModel['_id'] = this.sId;
    IgnouDataModel['degreeType'] = this.degreeType;
    IgnouDataModel['program'] = this.program;
    IgnouDataModel['fieldOfStudy'] = this.fieldOfStudy;
    IgnouDataModel['college'] = this.college;
    IgnouDataModel['location'] = this.location;
    IgnouDataModel['totalFee'] = this.totalFee;
    IgnouDataModel['eligibility'] = this.eligibility;
    IgnouDataModel['platformFee'] = this.platformFee;
    IgnouDataModel['ageLimit'] = this.ageLimit;
    IgnouDataModel['documents'] = this.documents;
    IgnouDataModel['imgUrl'] = this.imgUrl;
    IgnouDataModel['createdAt'] = this.createdAt;
    IgnouDataModel['updatedAt'] = this.updatedAt;
    IgnouDataModel['__v'] = this.iV;
    return IgnouDataModel;
  }
}*/