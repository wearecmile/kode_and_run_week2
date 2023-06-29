
import 'package:meet_well/main/model/master/user.dart';

import 'group_settings.dart';

class Group {
  String? id;
  String? groupName;
  String? groupDescription;
  String? imageURL;
  GroupSettings? groupSettings;
  List<User>? listOfMembers;

  Group(
      {this.id,
      this.groupName,
      this.groupDescription,
      this.imageURL,
      this.groupSettings,
      this.listOfMembers});

  Group.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    groupName = json['groupName'];
    groupDescription = json['groupDescription'];
    imageURL = json['imageURL'];
    groupSettings = json['groupSettings'] != null
        ? new GroupSettings.fromJson(json['groupSettings'])
        : null;
    if (json['listOfMembers'] != null) {
      listOfMembers = <User>[];
      json['listOfMembers'].forEach((v) {
        listOfMembers!.add(new User.fromJson(v));
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
    return data;
  }
}
