import 'package:flutter/material.dart';
import 'package:meet_well/utils/constants/string_constants.dart';
import 'package:meet_well/utils/route/route.dart' as routes;

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
        automaticallyImplyLeading: StringConstant.boolFalse,
        title: InkWell(
            onTap: () => Navigator.pushNamed(context, routes.registration,
                arguments: ModalRoute.of(context)?.settings.name ??
                    StringConstant.textEmpty),
            child: const Text(StringConstant.textDashboard)),
      ),
    );
  }
}
