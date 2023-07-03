class DefaultGroupResponse {
  String? status;
  int? statusCode;
  String? message;
  DefaultGroupData? data;

  DefaultGroupResponse({this.status, this.statusCode, this.message, this.data});

  DefaultGroupResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusCode = json['statusCode'];
    message = json['message'];
    data = json['data'] != null ? new DefaultGroupData.fromJson(json['data']) : null;
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

class DefaultGroupData {
  String? id;
  int? phoneNumber;
  String? defaultGroup;

  DefaultGroupData({this.id, this.phoneNumber, this.defaultGroup});

  DefaultGroupData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    phoneNumber = json['phoneNumber'];
    defaultGroup = json['default_group'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['phoneNumber'] = this.phoneNumber;
    data['default_group'] = this.defaultGroup;
    return data;
  }
}
