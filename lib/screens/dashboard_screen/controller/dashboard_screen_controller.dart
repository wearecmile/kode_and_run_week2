import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:meet_well/utils/constants/api_constants.dart';
import 'package:meet_well/utils/constants/number_constants.dart';
import 'package:meet_well/utils/constants/string_constants.dart';
import 'package:rxdart/rxdart.dart';

import '../model/group_meetings_response.dart';

class DashboardScreenController extends ChangeNotifier {
  GroupMeetingResponse? groupResponse;

  final getMeetingDetailsController = PublishSubject<GroupMeetingResponse>();
  Stream<GroupMeetingResponse> get getAllMeetingsStream =>
      getMeetingDetailsController.stream;

  //TODO Static api calling for only validation
  Future<Object> getMeetingDetails() async {
    const url = ApiConstants.dummyBaseURL; // Replace with your API endpoint
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == NumberConstant.intTwoHundred) {
        var staticgroupResponse = await readJson();
        groupResponse = GroupMeetingResponse.fromJson(
            jsonDecode(staticgroupResponse.toString()));
        getMeetingDetailsController.sink.add(groupResponse!);
        return groupResponse!;
      } else {
        ///Error Response
      }
    } catch (error) {
      ///Exception
    }
    return GroupMeetingResponse(
        status: groupResponse?.status,
        statusCode: groupResponse?.statusCode,
        message: groupResponse?.message,
        data: groupResponse?.data);
  }

  ///Read convert json file to string
  Future<String> readJson() async {
    final String response =
        await rootBundle.loadString(StringConstant.jsonMeetingList);
    return response;
  }
}
