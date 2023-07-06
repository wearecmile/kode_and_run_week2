class UserData {
  bool? status;
  int? statusCode;
  String? message;
  User? data;

  UserData({this.status, this.statusCode, this.message, this.data});

  UserData.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusCode = json['statusCode'];
    message = json['message'];
    data = json['data'] != null ? new User.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['statusCode'] = this.statusCode;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class User {
  String? userId;
  String? fullName;
  String? email;
  String? countryCode;
  String? phoneNumber;
  String? imageURL;
  bool? isCaptain;

  User(
      {this.userId,
        this.fullName,
        this.email,
        this.countryCode,
        this.phoneNumber,
        this.imageURL,
        this.isCaptain});

  User.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    fullName = json['fullName'];
    email = json['email'];
    countryCode = json['countryCode'];
    phoneNumber = json['phoneNumber'];
    imageURL = json['imageURL'];
    isCaptain = json['isCaptain'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['fullName'] = this.fullName;
    data['email'] = this.email;
    data['countryCode'] = this.countryCode;
    data['phoneNumber'] = this.phoneNumber;
    data['imageURL'] = this.imageURL;
    data['isCaptain'] = this.isCaptain;
    return data;
  }
}
