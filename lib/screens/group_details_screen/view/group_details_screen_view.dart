import 'package:flutter/material.dart';
import '../../../main/navigation/bottomNavigation.dart';

class Group_details extends StatefulWidget {
  const Group_details({super.key});

  @override
  State<Group_details> createState() => _Group_detailsState();
}
bool isCaptain = true;
class _Group_detailsState extends State<Group_details> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: bottomNavigation(),
    );
  }
}
