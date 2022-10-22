import 'package:flutter/material.dart';
import 'package:quiz_app/constant.dart';
import 'package:quiz_app/pages/menu.dart';
import 'package:quiz_app/utils/transparent_scroll.util.dart';

// third-party package
import 'package:sizer/sizer.dart';

class MainMaterial extends StatelessWidget {
  const MainMaterial({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) => MaterialApp(
        builder: (context, child) => ScrollConfiguration(
          behavior: TransparentScrollBehavior(),
          child: child!,
        ),
        theme: ThemeData(
          textTheme: Theme.of(context).textTheme.apply(
                bodyColor: kPrimaryTextColor,
                displayColor: kPrimaryTextColor,
                fontFamily: 'Raleway',
              ),
        ),
        debugShowCheckedModeBanner: false,
        home: const Menu(),
      ),
    );
  }
}
