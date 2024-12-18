class PrivateJobsData {
  int? code;
  int? statusCode;
  String? message;
  Result? result;

  PrivateJobsData({this.code, this.statusCode, this.message, this.result});

  PrivateJobsData.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    statusCode = json['statusCode'];
    message = json['message'];
    result =
        json['result'] != null ? new Result.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = code;
    data['statusCode'] = statusCode;
    data['message'] = message;
    if (result != null) {
      data['result'] = result!.toJson();
    }
    return data;
  }
}

class Result {
  List<Data>? data;
  int? totalList;

  Result({this.data, this.totalList});

  Result.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    totalList = json['totalList'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['totalList'] = totalList;
    return data;
  }
}

class Data {
  bool? isSaved;
  String? sId;
  String? jobSector;
  String? jobTitle;
  String? categoryName;
  String? subCategoryName;
  String? jobType;
  String? companyName;
  String? jobDescription;
  String? gender;
  String? qualification;
  String? experience;
  String? skills;
  String? salary;
  String? city;
  String? locality;
  String? numberOfOpening;
  String? workingHours;
  String? workingDays;
  String? contactPerson;
  String? contactNumber;
  String? interviewAddress;
  String? aboutCompany;
  String? companyLogo;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Data(
      {
      this.isSaved,
      this.sId,
      this.jobSector,
      this.jobTitle,
      this.categoryName,
      this.subCategoryName,
      this.jobType,
      this.companyName,
      this.jobDescription,
      this.gender,
      this.qualification,
      this.experience,
      this.skills,
      this.salary,
      this.city,
      this.locality,
      this.numberOfOpening,
      this.workingHours,
      this.workingDays,
      this.contactPerson,
      this.contactNumber,
      this.interviewAddress,
      this.aboutCompany,
      this.companyLogo,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    isSaved = json['isSaved'];
    sId = json['_id'];
    jobSector = json['jobSector'];
    jobTitle = json['jobTitle'];
    categoryName = json['categoryName'];
    subCategoryName = json['subCategoryName'];
    jobType = json['jobType'];
    companyName = json['companyName'];
    jobDescription = json['jobDescription'];
    gender = json['gender'];
    qualification = json['qualification'];
    experience = json['experience'];
    skills = json['skills'];
    salary = json['salary'];
    city = json['city'];
    locality = json['locality'];
    numberOfOpening = json['numberOfOpening'];
    workingHours = json['workingHours'];
    workingDays = json['workingDays'];
    contactPerson = json['contactPerson'];
    contactNumber = json['contactNumber'];
    interviewAddress = json['InterviewAddress'];
    aboutCompany = json['aboutCompany'];
    companyLogo = json['companyLogo'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isSaved']=isSaved;
    data['_id'] = sId;
    data['jobSector'] = jobSector;
    data['jobTitle'] = jobTitle;
    data['categoryName'] = categoryName;
    data['subCategoryName'] = subCategoryName;
    data['jobType'] = jobType;
    data['companyName'] = companyName;
    data['jobDescription'] = jobDescription;
    data['gender'] = gender;
    data['qualification'] = qualification;
    data['experience'] = experience;
    data['skills'] = skills;
    data['salary'] = salary;
    data['city'] = city;
    data['locality'] = locality;
    data['numberOfOpening'] = numberOfOpening;
    data['workingHours'] = workingHours;
    data['workingDays'] = workingDays;
    data['contactPerson'] = contactPerson;
    data['contactNumber'] = contactNumber;
    data['InterviewAddress'] = interviewAddress;
    data['aboutCompany'] = aboutCompany;
    data['companyLogo'] = companyLogo;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}