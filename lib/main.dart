import 'package:flutter/material.dart';
import 'package:meet_well/main/home_screen/home_screen.dart';
import 'package:meet_well/main/provider/main_provider.dart';
<<<<<<<<< Temporary merge branch 1
import 'package:meet_well/screens/dashboard/dashboard_screen.dart';
import 'package:meet_well/screens/login/controller/login_controller.dart';
import 'package:meet_well/screens/login/view/login_screen.dart';
import 'package:meet_well/screens/splash/view/splash_screen.dart';
import 'package:meet_well/utils/constants/string_constants.dart';
=========
import 'package:meet_well/screens/Dashboard_Screen/controller.dart';
import 'package:meet_well/screens/Dashboard_Screen/view.dart';
import 'package:meet_well/screens/group_details_screen/view.dart';
import 'package:meet_well/screens/notification_screen/view.dart';
import 'package:meet_well/screens/profile_details_screen/view.dart';
import 'package:meet_well/screens/splash/view/splash_screen.dart';
import 'package:meet_well/screens/transaction_screen/view.dart';
>>>>>>>>> Temporary merge branch 2
import 'package:meet_well/utils/route/route.dart' as routes;
import 'package:meet_well/utils/route/route.dart';
import 'package:provider/provider.dart';
import 'main/navigation/bottomNavigationController.dart';

import 'screens/splash/controller/splash_screen_controller.dart';
import 'utils/route/route.dart';

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
        ChangeNotifierProvider<MainProvider>(
          create: (context) => MainProvider(),
        ),

        ChangeNotifierProvider<MainProvider>(
          create: (context) => MainProvider(),
        ),
        Provider<SplashScreenController>(
            create: (_) => SplashScreenController()),

        ChangeNotifierProvider<LoginController>(
          create: (context) => LoginController(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: StringConstant.boolFalse,
        initialRoute: routes.splash,

        ///Routes
        routes: <String, WidgetBuilder>{
          login: (BuildContext context) => LoginScreen(),
          dashboard: (BuildContext context) => DashboardScreen()


      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'poppins',
          useMaterial3: true,
          primarySwatch: Colors.blue,
        ),

        initialRoute: routes.splash,

        ///Routes
        routes: {
          routes.dashboard: (context) => const Dashboard(),
          routes.transactions: (context) => const Transaction(),
          routes.notifications: (context) => const Notifications(),
          routes.groupDetails: (context) => const Group_details(),
          routes.profileScreen: (context) => const Profile_details(),

        },

        /// Passing Data as Arguments to screens
        // onGenerateRoute: (settings) {
        //   if (settings.name == route.productStatusDetails) {
        //     final args = settings.arguments as ScreenArguments;
        //     return MaterialPageRoute(
        //       builder: (context) {
        //         return SiteProductStatusDetailPage();
        //       },
        //     );
        //   }
        //   assert(false, 'Implementation ${settings.name}');
        //   return null;
        // },
        home: const SplashScreen(),
      ),
    );
  }
}
