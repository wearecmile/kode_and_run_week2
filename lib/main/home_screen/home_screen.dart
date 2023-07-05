import 'package:flutter/material.dart';
import 'package:meet_well/screens/dashboard_screen/view/dashboard_screen_view.dart';
import 'package:meet_well/screens/notification_screen/view/notification_screen_view.dart';
import 'package:meet_well/screens/transaction_screen/view/transavtion_screen_view.dart';
import 'package:meet_well/utils/constants/number_constants.dart';
import 'package:meet_well/utils/constants/string_constants.dart';
import 'package:meet_well/utils/route/route.dart' as routes;

import '../../screens/group_details_screen/view/group_details_screen_view.dart';
import '../../utils/constants/color_constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

bool isCaptain = StringConstant.boolTrue;

class _HomeScreenState extends State<HomeScreen> {
  @override
  final List tabs = [
    (
      title: StringConstant.textDashboard,
      icon: StringConstant.iconHome,
    ),
    (
      title: StringConstant.textTransactions,
      icon: StringConstant.iconTransaction,
    ),
    (
      title: StringConstant.textNotifications,
      icon: StringConstant.iconNotifications,
    ),
    (
      title: StringConstant.textGroupDetails,
      icon: StringConstant.icongroupdetails,
    ),
  ];
  var selectedeIndex;
  void initState() {
    // TODO: implement initState
    selectedeIndex = 0;
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: (selectedeIndex == NumberConstant.intZero)
          ? AppBar(
              automaticallyImplyLeading: StringConstant.boolFalse,
              backgroundColor: whiteColor,
              title: Image.asset(StringConstant.logo),
              centerTitle: StringConstant.boolTrue,
              actions: [
                Padding(
                  padding: const EdgeInsets.only(
                      right: NumberConstant.doubleSeventeen),
                  child: CircleAvatar(
                    backgroundColor: greycolor,
                    child: IconButton(
                      icon: const Icon(StringConstant.iconPerson),
                      onPressed: () {
                        Navigator.pushNamed(context, routes.profileScreen);
                      },
                    ),
                  ),
                ),
              ],
            )
          : null,
      body: (selectedeIndex == NumberConstant.intZero)
          ? DashboardScreen()
          : (selectedeIndex == NumberConstant.intOne)
              ? TransactionScreen()
              : (selectedeIndex == NumberConstant.intTwo)
                  ? NotificationsScreen()
                  : (selectedeIndex == NumberConstant.intThree)
                      ? GroupDetailsScreen()
                      : null,
      floatingActionButton:
          (selectedeIndex == NumberConstant.intZero && isCaptain)
              ? FloatingActionButton(
                  onPressed: () {},
                  backgroundColor: greycolor,
                  child: const Icon(StringConstant.iconAdd,
                      color: listTextPrimaryColor,
                      size: NumberConstant.doubleThirty),
                )
              : null,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: whiteColor,
        showSelectedLabels: StringConstant.boolFalse,
        currentIndex: selectedeIndex,
        onTap: (index) {
          setState(() {
            selectedeIndex = index;
          });
        },
        items: tabs.map((tab) {
          return BottomNavigationBarItem(
            backgroundColor: greycolor,
            icon: Icon(tab.icon,
                color: listTextPrimaryColor,
                size: NumberConstant.doubleThirtyFive),
            label: tab.title,
          );
        }).toList(),
      ),
    );
  }
}