import 'package:flutter/material.dart';
import 'package:meet_well/main/provider/main_provider.dart';
import 'package:meet_well/screens/splash/view/splash_screen.dart';
import 'package:meet_well/utils/route/route.dart' as routes;
import 'package:provider/provider.dart';

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
        )
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: routes.splash,

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
        home: SplashScreen(),
      ),
    );
  }
}
