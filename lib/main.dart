import 'package:flutter/material.dart';
import 'package:meet_well/main/provider/main_provider.dart';
import 'package:meet_well/screens/dashboard/dashboard_screen.dart';
import 'package:meet_well/screens/registration/controller/registration_controller.dart';
import 'package:meet_well/screens/registration/view/registration_screen.dart';
import 'package:meet_well/screens/login/controller/login_controller.dart';
import 'package:meet_well/screens/login/view/login_screen.dart';
import 'package:meet_well/screens/splash/view/splash_screen.dart';
import 'package:meet_well/utils/constants/string_constants.dart';
import 'package:meet_well/utils/route/route.dart' as routes;
import 'package:meet_well/utils/route/route.dart';
import 'package:provider/provider.dart';

import 'screens/splash/controller/splash_screen_controller.dart';

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
        ChangeNotifierProvider<LoginController>(
          create: (context) => LoginController(),
        ),
    ChangeNotifierProvider(
    create: (context) => RegistrationController(),
    ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: StringConstant.boolFalse,
        initialRoute: routes.splash,
        theme: ThemeData(
          fontFamily: 'poppins',
          useMaterial3: true,
          primarySwatch: Colors.blue,
        ),


        ///Routes
        routes: <String, WidgetBuilder>{
          login: (BuildContext context) => LoginScreen(),
          dashboard: (BuildContext context) => DashboardScreen(),
          registration : (BuildContext context) => RegistrationScreen()
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
       // home: RegistrationScreen(),
      ),
    );
  }
}
