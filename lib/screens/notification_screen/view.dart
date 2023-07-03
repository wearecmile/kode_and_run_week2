import 'package:flutter/material.dart';
import '../../main/navigation/bottomNavigation.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}
bool isCaptain = true;
class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: bottomNavigation(),
    );
  }
}
