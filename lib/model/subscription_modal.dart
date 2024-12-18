class SubscriptionModal {
  String? sId;
  String? serviceDiscount;
  int? discountMoney;
  int? serviceMoney;
  String? serviceName;
  String? nextServiceDetail;
  List<ServiceDetails>? serviceDetails;
  int? formCount;
  int? admitCardCount;
  String? createdAt;
  String? updatedAt;
  int? iV;

  SubscriptionModal(
      {this.sId,
      this.serviceDiscount,
      this.discountMoney,
      this.serviceMoney,
      this.serviceName,
      this.nextServiceDetail,
      this.serviceDetails,
      this.formCount,
      this.admitCardCount,
      this.createdAt,
      this.updatedAt,
      this.iV});

  SubscriptionModal.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    serviceDiscount = json['serviceDiscount'];
    discountMoney = json['discountMoney'];
    serviceMoney = json['serviceMoney'];
    serviceName = json['serviceName'];
    nextServiceDetail = json['nextServiceDetail'];
    if (json['serviceDetails'] != null) {
      serviceDetails = <ServiceDetails>[];
      json['serviceDetails'].forEach((v) {
        serviceDetails!.add(new ServiceDetails.fromJson(v));
      });
    }
    formCount = json['formCount'];
    admitCardCount = json['admitCardCount'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['serviceDiscount'] = this.serviceDiscount;
    data['discountMoney'] = this.discountMoney;
    data['serviceMoney'] = this.serviceMoney;
    data['serviceName'] = this.serviceName;
    data['nextServiceDetail'] = this.nextServiceDetail;
    if (this.serviceDetails != null) {
      data['serviceDetails'] =
          this.serviceDetails!.map((v) => v.toJson()).toList();
    }
    data['formCount'] = this.formCount;
    data['admitCardCount'] = this.admitCardCount;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class ServiceDetails {
  String? detail;
  String? sId;

  ServiceDetails({this.detail, this.sId});

  ServiceDetails.fromJson(Map<String, dynamic> json) {
    detail = json['detail'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['detail'] = this.detail;
    data['_id'] = this.sId;
    return data;
  }
}