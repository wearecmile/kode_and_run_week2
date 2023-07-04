import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:meet_well/screens/add_visitor/add_visitor_response.dart';
import 'package:meet_well/utils/constants/number_constants.dart';

class AddVisitorController extends ChangeNotifier {
  //TODO Static api calling for only validation
  Future<Object> AddVisitor(fullName, phoneNumber, fees) async {
    const url =
        'https://your-api-endpoint.com'; // Replace with your API endpoint
    try {
      VisitorData data;
      data =
          VisitorData(fullName: fullName, phoneNumber: phoneNumber, fees: fees);
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == NumberConstant.intTwoHundred) {
        return String;
      } else {
        ///Error Response
      }
    } catch (error) {
      ///Exception
    }
    return String;
  }

  ///Read convert json file to string
}
