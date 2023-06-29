import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:meet_well/screens/splash/model/default_group_response.dart';
import 'package:meet_well/utils/constants/number_constants.dart';
import 'package:meet_well/utils/constants/string_constants.dart';

class SplashScreenController {
  DefaultGroupResponse? defaultGroupResponse;
  //TODO Static api calling for only validation
  Future<DefaultGroupResponse> makeApiCall() async {
    const url =
        'https://jsonplaceholder.typicode.com/posts'; // Replace with your API endpoint
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == NumberConstant.intTwoHundred) {
        var staticDefaultGroupResponse = readJson;
        defaultGroupResponse = DefaultGroupResponse.fromJson(jsonDecode(staticDefaultGroupResponse.toString()));
        return defaultGroupResponse!;
      } else {
        ///Error Response
      }
    } catch (error) {
      ///Exception
    }
    return DefaultGroupResponse(
        status: defaultGroupResponse?.status,
        statusCode: defaultGroupResponse?.statusCode,
        message: defaultGroupResponse?.message,
        data: defaultGroupResponse?.data);
  }

  ///Read convert json file to string
  Future<String> readJson() async {
    final String response = await rootBundle.loadString(StringConstant.jsonDefaultGroup);
    print(response);
    return response;
  }
}
