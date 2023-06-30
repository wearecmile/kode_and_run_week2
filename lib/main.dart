import 'package:flutter/material.dart';
import 'package:meet_well/main/provider/main_provider.dart';
import 'package:meet_well/screens/Dashboard_Screen/view.dart';
import 'package:meet_well/screens/splash/view/splash_screen.dart';
import 'package:meet_well/utils/route/route.dart' as routes;
import 'package:provider/provider.dart';

import 'main/navigation/bottomNavigationController.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MainProvider>(create: (context) => MainProvider(),),
        ChangeNotifierProvider<BottomNavigationController>(create: (context) => BottomNavigationController(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          fontFamily: 'poppins',
          useMaterial3: true,
          primarySwatch: Colors.blue,
        ),
        home: Dashboard(),
      ),
    );
  }
}
