// class Data {
//   int? code;
//   int? statusCode;
//   String? message;
//   Result? result;

//   Data({this.code, this.statusCode, this.message, this.result});

//   Data.fromJson(Map<String, dynamic> json) {
//     code = json['code'];
//     statusCode = json['statusCode'];
//     message = json['message'];
//     result =
//         json['result'] != null ? new Result.fromJson(json['result']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['code'] = this.code;
//     data['statusCode'] = this.statusCode;
//     data['message'] = this.message;
//     if (this.result != null) {
//       data['result'] = this.result!.toJson();
//     }
//     return data;
//   }
// }

// class Result {
//   List<AppliedJobsModal>? applicant;

//   Result({this.applicant});

//   Result.fromJson(Map<String, dynamic> json) {
//     if (json['applicant'] != null) {
//       applicant = <AppliedJobsModal>[];
//       json['applicant'].forEach((v) {
//         applicant!.add(new AppliedJobsModal.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.applicant != null) {
//       data['applicant'] = this.applicant!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

class AppliedJobsModal {
  String? sId;
  String? userId;
  JobpostId? jobpostId;
  String? status;
  String? createdAt;
  String? updatedAt;
  int? iV;

  AppliedJobsModal(
      {this.sId,
      this.userId,
      this.jobpostId,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.iV});

  AppliedJobsModal.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userId = json['userId'];
    jobpostId = json['jobpostId'] != null
        ? new JobpostId.fromJson(json['jobpostId'])
        : null;
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['userId'] = this.userId;
    if (this.jobpostId != null) {
      data['jobpostId'] = this.jobpostId!.toJson();
    }
    data['status'] = this.status;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class JobpostId {
  String? sId;
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
  String? jobSector;
  // String? interviewAddress;

  JobpostId(
      {this.sId,
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
      this.iV,
      this.jobSector,
      // this.interviewAddress
      });

  JobpostId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
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
    interviewAddress = json['interviewAddress'];
    aboutCompany = json['aboutCompany'];
    companyLogo = json['companyLogo'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    jobSector = json['jobSector'];
    // interviewAddress = json['InterviewAddress'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['jobTitle'] = this.jobTitle;
    data['categoryName'] = this.categoryName;
    data['subCategoryName'] = this.subCategoryName;
    data['jobType'] = this.jobType;
    data['companyName'] = this.companyName;
    data['jobDescription'] = this.jobDescription;
    data['gender'] = this.gender;
    data['qualification'] = this.qualification;
    data['experience'] = this.experience;
    data['skills'] = this.skills;
    data['salary'] = this.salary;
    data['city'] = this.city;
    data['locality'] = this.locality;
    data['numberOfOpening'] = this.numberOfOpening;
    data['workingHours'] = this.workingHours;
    data['workingDays'] = this.workingDays;
    data['contactPerson'] = this.contactPerson;
    data['contactNumber'] = this.contactNumber;
    data['interviewAddress'] = this.interviewAddress;
    data['aboutCompany'] = this.aboutCompany;
    data['companyLogo'] = this.companyLogo;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['jobSector'] = this.jobSector;
    // data['InterviewAddress'] = this.interviewAddress;
    return data;
  }
}