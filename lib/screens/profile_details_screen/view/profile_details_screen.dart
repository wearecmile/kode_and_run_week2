import 'package:flutter/material.dart';
import '../../../utils/constants/string_constants.dart';
import '../../../utils/widgets/appbar.dart';

class ProfileDetailsScreen extends StatefulWidget {
  const ProfileDetailsScreen({super.key});

  @override
  State<ProfileDetailsScreen> createState() => _ProfileDetailsScreenState();
}
class _ProfileDetailsScreenState extends State<ProfileDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        appBar:Appbar(title:StringConstant.textProfile),
    );
  }
}
