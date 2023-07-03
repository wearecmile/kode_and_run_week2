
import 'package:meet_well/main/model/master/user.dart';

import 'group_settings.dart';
import 'meeting.dart';

class Group {
  String? id;
  String? groupName;
  String? groupDescription;
  String? imageURL;
  GroupSettings? groupSettings;
  List<User>? listOfMembers;
  List<Meeting>? listOfMeetings;

  Group(
      {this.id,
      this.groupName,
      this.groupDescription,
      this.imageURL,
      this.groupSettings,
      this.listOfMembers,
      this.listOfMeetings
      });

  Group.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    groupName = json['groupName'];
    groupDescription = json['groupDescription'];
    imageURL = json['imageURL'];
    groupSettings = json['groupSettings'] != null
        ? GroupSettings.fromJson(json['groupSettings'])
        : null;
    if (json['listOfMembers'] != null) {
      listOfMembers = <User>[];
      json['listOfMembers'].forEach((v) {
        listOfMembers!.add(User.fromJson(v));
      });
    }
    if (json['listOfMeetings'] != null) {
      listOfMeetings = <Meeting>[];
      json['listOfMeetings'].forEach((v) {
        listOfMeetings!.add(Meeting.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['groupName'] = this.groupName;
    data['groupDescription'] = this.groupDescription;
    data['imageURL'] = this.imageURL;
    if (this.groupSettings != null) {
      data['groupSettings'] = this.groupSettings!.toJson();
    }
    if (this.listOfMembers != null) {
      data['listOfMembers'] =
          this.listOfMembers!.map((v) => v.toJson()).toList();
    }
    if (this.listOfMeetings != null) {
      data['listOfMeetings'] =
          this.listOfMeetings!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
