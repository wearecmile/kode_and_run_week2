import 'package:flutter/material.dart';
import 'package:meet_well/main/home_screen/home_screen.dart';
import 'package:meet_well/main/provider/main_provider.dart';
import 'package:meet_well/screens/dashboard/dashboard_screen.dart';
import 'package:meet_well/screens/registration/controller/registration_controller.dart';
import 'package:meet_well/screens/registration/view/registration_screen.dart';
import 'package:meet_well/screens/login/controller/login_controller.dart';
import 'package:meet_well/screens/login/view/login_screen.dart';
import 'package:meet_well/screens/notification_screen/view/notification_screen.dart';
import 'package:meet_well/screens/profile_details_screen/view/profile_details_screen.dart';
import 'package:meet_well/screens/splash/view/splash_screen.dart';
import 'package:meet_well/screens/transaction_screen/view/transavtion_screen.dart';
import 'package:meet_well/utils/constants/color_constants.dart';
import 'package:meet_well/utils/constants/string_constants.dart';
import 'package:meet_well/utils/route/route.dart' as routes;
import 'package:provider/provider.dart';
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
        Provider<SplashScreenController>(
            create: (_) => SplashScreenController()),
        ChangeNotifierProvider<DashboardScreenController>(
          create: (context) => DashboardScreenController(),
        ),
    ChangeNotifierProvider(
    create: (context) => RegistrationController(),
    ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: StringConstant.boolFalse,
        initialRoute: routes.splash,
        theme: ThemeData(
          fontFamily: StringConstant.textFontPoppins,
          useMaterial3: StringConstant.boolTrue,
          primarySwatch: blueColor,
        ),

        ///Routes
        routes: {
          routes.dashboard: (context) => const DashboardScreen(),
          routes.profileScreen: (context) => const ProfileDetailsScreen(),
          routes.homeScreen: (context) => const HomeScreen(),
          routes.transaction: (context) => const TransactionScreen(),
          routes.notifications :(context) => const NotificationsScreen(),
          routes.groupDetails:(context) => const GroupDetailsScreen(),
          routes.login: (BuildContext context) => const LoginScreen(),
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
