import 'package:flutter/material.dart';

import '../../utils/constants/string_constants.dart';

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
        title: const Text(StringConstant.textLogin),
      ),
    );
  }
}
