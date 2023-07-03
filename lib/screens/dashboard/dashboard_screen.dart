import 'package:flutter/material.dart';
import 'package:meet_well/utils/constants/string_constants.dart';

class DashboardScreen extends StatefulWidget {
  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: StringConstant.boolFalse,
        title: const Text(StringConstant.textDashboard),
      ),
    );
  }
}
