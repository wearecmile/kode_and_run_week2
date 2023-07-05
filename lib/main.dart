import 'package:flutter/material.dart';
import 'package:meet_well/main/provider/main_provider.dart';
import 'package:meet_well/screens/dashboard_Screen/controller/dashboard_screen_controller.dart';
import 'package:meet_well/screens/dashboard_Screen/view/dashboard_screen_view.dart';
import 'package:meet_well/screens/add_visitor/controller/add_visitor_controller.dart';
import 'package:meet_well/screens/add_visitor/view/add_visitor_view.dart';
import 'package:meet_well/screens/group_details_screen/view/group_details_screen_view.dart';
import 'package:meet_well/screens/login/view/login_screen.dart';
import 'package:meet_well/screens/notification_screen/view/notification_screen_view.dart';
import 'package:meet_well/screens/profile_details_screen/view/profile_details_screen_view.dart';
import 'package:meet_well/screens/splash/view/splash_screen.dart';
import 'package:meet_well/screens/transaction_screen/view/transavtion_screen_view.dart';
import 'package:meet_well/utils/route/route.dart' as routes;
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
        ChangeNotifierProvider<BottomNavigationController>(
          create: (context) => BottomNavigationController(),
        ),
        ChangeNotifierProvider<AddVisitorController>(
          create: (context) => AddVisitorController(),
        ),
        ChangeNotifierProvider<MainProvider>(
          create: (context) => MainProvider(),
        ),
        Provider<SplashScreenController>(
            create: (_) => SplashScreenController()),
        ChangeNotifierProvider<DashboardScreenController>(
          create: (context) => DashboardScreenController(),
        ),
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
          routes.addVisitor: (context) => const AddVisitor(),
          login: (BuildContext context) => LoginScreen(),
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
        home: const Dashboard(),
      ),
    );
  }
}
