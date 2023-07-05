import '../../../main/model/master/meeting.dart';

class GroupMeetingResponse {
  String? status;
  int? statusCode;
  String? message;
  GroupData? data;

  GroupMeetingResponse({this.status, this.statusCode, this.message, this.data});

  GroupMeetingResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusCode = json['statusCode'];
    message = json['message'];
    data = json['data'] != null ? GroupData.fromJson(json['data']) : null;
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

class GroupData {
  String? id;
  String? groupName;
  List<Meeting>? listOfMeetings;

  GroupData({this.id, this.groupName, this.listOfMeetings});

  GroupData.fromJson(Map<String, dynamic> json) {

    id = json['id'];
    groupName = json['groupName'];
    if (json['listOfMeeting'] != null) {

      listOfMeetings = <Meeting>[];
      json['listOfMeeting'].forEach((v) {

        listOfMeetings!.add(Meeting.fromJson(v));
      });
    }
   // listOfMeeting
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['groupName'] = this.groupName;
    //data['default_group'] = this.defaultGroup;
    return data;
  }
}
