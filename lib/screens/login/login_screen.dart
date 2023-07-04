import 'package:flutter/material.dart';

import '../../utils/constants/string_constants.dart';
import 'package:meet_well/utils/route/route.dart' as routes;


class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: StringConstant.boolFalse,
        title: InkWell(
            onTap: ()=> Navigator.pushNamed(context, routes.registration ),
            child: const Text(StringConstant.textLogin)),
      ),
    );
  }
}
