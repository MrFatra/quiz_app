import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../constant.dart';
import '../pages/menu.dart';
import '../utils/transparent_scroll.util.dart';

class MainMaterial extends StatelessWidget {
  const MainMaterial({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) => GetMaterialApp(
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
          appBarTheme: const AppBarTheme(
              toolbarTextStyle: TextStyle(color: kPrimaryTextColor),
              iconTheme: IconThemeData(color: kPrimaryTextColor)),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
                foregroundColor: kPrimaryColor,
                textStyle: const TextStyle(fontWeight: FontWeight.w600)),
          ),
        ),
        debugShowCheckedModeBanner: false,
        home: const MenuPage(),
      ),
    );
  }
}
