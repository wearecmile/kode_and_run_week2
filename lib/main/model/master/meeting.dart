import 'package:meet_well/main/model/master/user.dart';
import 'package:meet_well/main/model/master/visitor.dart';

import 'meeting_settings.dart';

class Meeting {
  String? id;
  String? title;
  String? location;
  String? dateTime;
  int? feesPerPerson;
  MeetingSettings? meetingSettings;
  List<User>? listOfMembers;
  List<Visitor>? listOfVisitors;

  Meeting(
      {this.id,
      this.title,
      this.location,
      this.dateTime,
      this.feesPerPerson,
      this.meetingSettings,
      this.listOfMembers,
      this.listOfVisitors});

  Meeting.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    location = json['location'];
    dateTime = json['dateTime'];
    feesPerPerson = json['feesPerPerson'];
    meetingSettings = json['meetingSettings'] != null
        ? new MeetingSettings.fromJson(json['meetingSettings'])
        : null;
    if (json['listOfMembers'] != null) {
      listOfMembers = <User>[];
      json['listOfMembers'].forEach((v) {
        listOfMembers!.add(new User.fromJson(v));
      });
    }
    if (json['listOfVisitors'] != null) {
      listOfVisitors = <Visitor>[];
      json['listOfVisitors'].forEach((v) {
        listOfVisitors!.add(new Visitor.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['location'] = this.location;
    data['dateTime'] = this.dateTime;
    data['feesPerPerson'] = this.feesPerPerson;
    if (this.meetingSettings != null) {
      data['meetingSettings'] = this.meetingSettings!.toJson();
    }
    if (this.listOfMembers != null) {
      data['listOfMembers'] =
          this.listOfMembers!.map((v) => v.toJson()).toList();
    }
    if (this.listOfVisitors != null) {
      data['listOfVisitors'] =
          this.listOfVisitors!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
