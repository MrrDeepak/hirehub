class User {
  String? education;
  String? address;
  String? profession;
  String? sId;
  String? name;
  String? email;
  String? password;
  String? mobile;
  Null profileImage;
  String? cinNumber;
  String? createdAt;
  String? updatedAt;
  int? iV;

  User(
      {this.education,
      this.address,
      this.profession,
      this.sId,
      this.name,
      this.email,
      this.password,
      this.mobile,
      this.profileImage,
      this.cinNumber,
      this.createdAt,
      this.updatedAt,
      this.iV});

  User.fromJson(Map<String, dynamic> json) {
    education = json['education'];
    address = json['address'];
    profession = json['profession'];
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    mobile = json['mobile'];
    profileImage = json['profileImage'];
    cinNumber = json['cin_number'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['education'] = this.education;
    data['address'] = this.address;
    data['profession'] = this.profession;
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['password'] = this.password;
    data['mobile'] = this.mobile;
    data['profileImage'] = this.profileImage;
    data['cin_number'] = this.cinNumber;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}