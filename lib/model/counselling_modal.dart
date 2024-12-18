class CounsellingModal {
  String? sId;
  Null? imgUrl;
  String? message;
  PdfDetails? pdfDetails;
  int? iV;

  CounsellingModal({this.sId, this.imgUrl, this.message, this.pdfDetails, this.iV});

  CounsellingModal.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    imgUrl = json['imgUrl'];
    message = json['message'];
    pdfDetails = json['pdfDetails'] != null
        ? new PdfDetails.fromJson(json['pdfDetails'])
        : null;
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['imgUrl'] = this.imgUrl;
    data['message'] = this.message;
    if (this.pdfDetails != null) {
      data['pdfDetails'] = this.pdfDetails!.toJson();
    }
    data['__v'] = this.iV;
    return data;
  }
}

class PdfDetails {
  String? pdfName;
  Null? pdfUrl;
  String? sId;

  PdfDetails({this.pdfName, this.pdfUrl, this.sId});

  PdfDetails.fromJson(Map<String, dynamic> json) {
    pdfName = json['pdfName'];
    pdfUrl = json['pdfUrl'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pdfName'] = this.pdfName;
    data['pdfUrl'] = this.pdfUrl;
    data['_id'] = this.sId;
    return data;
  }
}