import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../login/controller/login_controller.dart';

class DashboardScreen extends StatefulWidget {
  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Dashboard${Provider.of<NumberProvider>(context, listen: false).countryCode}"),
      ),
    );
  }
}
