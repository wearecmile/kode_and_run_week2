import 'package:flutter/material.dart';
import '../../main/navigation/bottomNavigation.dart';

class Profile_details extends StatefulWidget {
  const Profile_details({super.key});

  @override
  State<Profile_details> createState() => _Profile_detailsState();
}
bool isCaptain = true;
class _Profile_detailsState extends State<Profile_details> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: bottomNavigation(),
    );
  }
}
