import 'package:flutter/material.dart';
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
      elevation: 0,
      currentIndex: Provider.of<BottomNavigationController>(context, listen: false).currentIndex,
      onTap: (index) {
        Provider.of<BottomNavigationController>(context, listen: false).currentIndex = index;
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Provider.of<BottomNavigationController>(context).tabs[index].destination),
        );
      },
      items: Provider.of<BottomNavigationController>(context).tabs.map((tab) {
        return BottomNavigationBarItem(

          backgroundColor: greycolor,
          icon: Icon(tab.icon , color: listTextPrimaryColor,size:38),
          label: tab.title,
        );
      }).toList(),
    );
  }
}
