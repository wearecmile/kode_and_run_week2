class AddVisitorResponse {
  String? status;
  int? statusCode;
  String? message;
  VisitorData? data;

  AddVisitorResponse({this.status, this.statusCode, this.message, this.data});

  AddVisitorResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusCode = json['statusCode'];
    message = json['message'];
    data = json['data'] != null ? VisitorData.fromJson(json['data']) : null;
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

class VisitorData {
  String? id;
  String? fullName;
  String? phoneNumber;
  String? fees;

  VisitorData({this.id, this.fullName, this.phoneNumber, this.fees});

  VisitorData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['groupName'];
    phoneNumber = json['phoneNumber'];
    fees = json["fees"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['fullName'] = fullName;
    data['phoneNumber'] = phoneNumber;
    data['fees'] = fees;

    return data;
  }
}
