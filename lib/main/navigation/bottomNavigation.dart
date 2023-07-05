import 'package:flutter/material.dart';
import 'package:meet_well/utils/constants/number_constants.dart';
import 'package:meet_well/utils/constants/string_constants.dart';
import '../../utils/constants/color_constants.dart';
import 'package:provider/provider.dart';

import 'bottomNavigationController.dart';

class bottomNavigation extends StatefulWidget {
  const bottomNavigation({super.key});
  @override
  State<bottomNavigation> createState() => _bottomNavigationState();
}

class _bottomNavigationState extends State<bottomNavigation> {

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: whiteColor,
      showSelectedLabels: StringConstant.boolFalse,

      currentIndex: Provider.of<BottomNavigationController>(context, listen: StringConstant.boolFalse).currentIndex,
      onTap: (index) {
        Provider.of<BottomNavigationController>(context, listen: StringConstant.boolFalse).currentIndex = index;
        Provider.of<BottomNavigationController>(context, listen: StringConstant.boolFalse).onTabChanged(index, context);
      },
      items: Provider.of<BottomNavigationController>(context).tabs.map((tab) {
        return BottomNavigationBarItem(
          backgroundColor: greycolor,
          icon: Icon(tab.icon , color: listTextPrimaryColor,size:NumberConstant.doubleThirtyFive),
          label: tab.title,
        );
      }).toList(),
    );
  }
}
