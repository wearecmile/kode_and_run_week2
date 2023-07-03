import 'package:meet_well/main/model/master/user.dart';
import 'package:meet_well/main/model/master/visitor.dart';

import 'meeting_settings.dart';

class Meeting {
  String? id;
  String? title;
  String? location;
  String? date;
  String? time;
  int? feesPerPerson;
  MeetingSettings? meetingSettings;
  List<User>? listOfMembers;
  List<Visitor>? listOfVisitors;

  Meeting(
      {this.id,
      this.title,
      this.location,
      this.date,
        this.time,
      this.feesPerPerson,
      this.meetingSettings,
      this.listOfMembers,
      this.listOfVisitors});

  Meeting.fromJson(Map<String, dynamic> json) {

    id = json['id'];
    title = json['title'];
    location = json['location'];
    date = json['date'];
    time =json['time'];
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
    data['id'] = id;
    data['title'] = title;
    data['location'] = location;
    data['date'] = date;
    data['time'] = time;
    data['feesPerPerson'] = feesPerPerson;
    if (meetingSettings != null) {
      data['meetingSettings'] = meetingSettings!.toJson();
    }
    if (listOfMembers != null) {
      data['listOfMembers'] =
          listOfMembers!.map((v) => v.toJson()).toList();
    }
    if (listOfVisitors != null) {
      data['listOfVisitors'] =
          listOfVisitors!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
