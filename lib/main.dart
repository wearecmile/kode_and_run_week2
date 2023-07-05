import 'package:flutter/material.dart';
import 'package:meet_well/main/home_screen/home_screen.dart';
import 'package:meet_well/main/provider/main_provider.dart';
import 'package:meet_well/screens/dashboard_screen/controller/dashboard_screen_controller.dart';
import 'package:meet_well/screens/dashboard_screen/view/dashboard_screen_view.dart';
import 'package:meet_well/screens/login/view/login_screen.dart';
import 'package:meet_well/screens/profile_details_screen/view/profile_details_screen_view.dart';
import 'package:meet_well/screens/splash/view/splash_screen.dart';
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
        debugShowCheckedModeBanner: StringConstant.boolFalse,
        theme: ThemeData(
          fontFamily: StringConstant.textFontFamilyPoppins,
          useMaterial3: StringConstant.boolTrue,
          primarySwatch: Colors.blue,
        ),

        initialRoute: routes.splash,

        ///Routes
        routes: {
          routes.dashboard: (context) => const DashboardScreen(),
          routes.profileScreen: (context) => const ProfileDetailsScreen(),
          routes.homeScreen: (context) => const HomeScreen(),
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
        home: const SplashScreen(),
      ),
    );
  }
}