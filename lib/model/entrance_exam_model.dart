
class EntranceExamModel {
  String? sId;
  String? catagory;
  Null? imgUrl;
  List<ExamData>? examData;
  String? createdAt;
  String? updatedAt;
  int? iV;

  EntranceExamModel(
      {this.sId,
      this.catagory,
      this.imgUrl,
      this.examData,
      this.createdAt,
      this.updatedAt,
      this.iV});

  EntranceExamModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    catagory = json['catagory'];
    imgUrl = json['imgUrl'];
    if (json['examData'] != null) {
      examData = <ExamData>[];
      json['examData'].forEach((v) {
        examData!.add(new ExamData.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['catagory'] = this.catagory;
    data['imgUrl'] = this.imgUrl;
    if (this.examData != null) {
      data['examData'] = this.examData!.map((v) => v.toJson()).toList();
    }
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class ExamData {
  String? field;
  String? eligibility;
  String? document;
  String? examDate;
  String? examTime;
  String? examDuration;
  String? examLocation;
  String? examInstructions;
  String? sId;

  ExamData(
      {this.field,
      this.eligibility,
      this.document,
      this.examDate,
      this.examTime,
      this.examDuration,
      this.examLocation,
      this.examInstructions,
      this.sId});

  ExamData.fromJson(Map<String, dynamic> json) {
    field = json['field'];
    eligibility = json['eligibility'];
    document = json['document'];
    examDate = json['examDate'];
    examTime = json['examTime'];
    examDuration = json['examDuration'];
    examLocation = json['examLocation'];
    examInstructions = json['examInstructions'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['field'] = this.field;
    data['eligibility'] = this.eligibility;
    data['document'] = this.document;
    data['examDate'] = this.examDate;
    data['examTime'] = this.examTime;
    data['examDuration'] = this.examDuration;
    data['examLocation'] = this.examLocation;
    data['examInstructions'] = this.examInstructions;
    data['_id'] = this.sId;
    return data;
  }
}