import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meet_well/screens/splash/controller/splash_screen_controller.dart';
import 'package:meet_well/screens/splash/model/default_group_response.dart';
import 'package:meet_well/utils/constants/number_constants.dart';
import 'package:meet_well/utils/constants/string_constants.dart';
import 'package:meet_well/utils/route/route.dart' as routes;
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  Animation<double>? _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(seconds: NumberConstant.intTen),
      vsync: this,
    );
    _animation = Tween<double>(begin: NumberConstant.doubleZero, end: NumberConstant.doubleOne).animate(
      CurvedAnimation(
        parent: _animationController!,
        curve: Curves.fastLinearToSlowEaseIn,
      ),
    );
    _animationController?.repeat(reverse: StringConstant.boolFalse);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DefaultGroupResponse>(
      future: Provider.of<SplashScreenController>(context, listen: StringConstant.boolFalse)
          .makeApiCall(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            body: Center(
              child: AnimatedBuilder(
                animation: _animationController!,
                builder: (context, child) {
                  return Transform.scale(
                    scale: _animation?.value,
                    child: SvgPicture.asset(
                      StringConstant.icMeetWellLogo,
                      height: NumberConstant.doubleTwoHundred,
                      width: NumberConstant.doubleTwoHundred,
                    ),
                  );
                },
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return Scaffold(
            body: Center(
              child: Text('${StringConstant.textError}${StringConstant.textColon} ${snapshot.error}'),
            ),
          );
        } else {
          DefaultGroupResponse? defaultGroupResponse = snapshot.data;
          if (defaultGroupResponse?.data?.defaultGroup == null) {
            Future.delayed(Duration.zero, () {
              Navigator.pushNamed(context, routes.login);
            });
          } else {
            Future.delayed(Duration.zero, () {
              Navigator.pushNamed(context, routes.dashboard
              );
            });
          }
          return Scaffold(
            body: Container(),
          );
        }
      },
    );
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }
}
