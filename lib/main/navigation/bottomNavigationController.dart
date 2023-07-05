import 'package:flutter/material.dart';
import 'package:meet_well/utils/constants/number_constants.dart';
import 'package:meet_well/utils/route/route.dart' as routes;

import '../../utils/constants/string_constants.dart';

class BottomNavigationController extends ChangeNotifier {
  final List tabs = [
    (
      title: StringConstant.textDashboard,
      icon: StringConstant.iconHome,
      destination: routes.dashboard
    ),
    (
      title: StringConstant.textTransactions,
      icon: StringConstant.iconTransaction,
      destination: routes.transactions
    ),
    (
      title: StringConstant.textNotifications,
      icon: StringConstant.iconNotifications,
      destination: routes.notifications
    ),
    (
      title: StringConstant.textGroupDetails,
      icon: StringConstant.icongroupdetails,
      destination: routes.groupDetails
    ),
  ];
  int currentIndex = NumberConstant.intZero;
  void onTabChanged(int index, BuildContext context) {
    currentIndex = index;
    Navigator.pushReplacementNamed(context, tabs[index].destination);
  }

  void onLongPress(int index, BuildContext context) {}
}
