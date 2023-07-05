import 'package:flutter/material.dart';
import '../../../main/navigation/bottomNavigation.dart';

class Transaction extends StatefulWidget {
  const Transaction({super.key});

  @override
  State<Transaction> createState() => _TransactionState();
}
bool isCaptain = true;
class _TransactionState extends State<Transaction> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: bottomNavigation(),
    );
  }
}
