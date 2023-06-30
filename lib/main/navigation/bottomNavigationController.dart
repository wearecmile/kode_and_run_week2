import 'package:flutter/material.dart';

import '../../screens/Dashboard_Screen/view.dart';


class BottomNavigationController extends ChangeNotifier {
 final List tabs = [
    (title:"",icon: Icons.home_outlined, destination: const Dashboard()),
    (title:"",icon: Icons.currency_rupee_sharp, destination: const Dashboard()),
    (title:"",icon: Icons.notifications_none_rounded, destination: const Dashboard()),
    (title:"",icon: Icons.groups_outlined, destination: const Dashboard()),
  ];
 int currentIndex = 0;
 void onTabChanged(int index,BuildContext context) {
    currentIndex = index;
    Navigator.push(context,MaterialPageRoute(builder: (context) => tabs[index].destination),
    );
  }
}
