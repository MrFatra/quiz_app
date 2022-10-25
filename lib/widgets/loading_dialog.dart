import 'dart:ui';

import 'package:flutter/material.dart';

import '../constant.dart';

Future<T> loadingData<T>(BuildContext context,
    {required Future<T> future, required String title}) async {
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: AlertDialog(
            content: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const CircularProgressIndicator(color: kPrimaryColor),
                Text(title),
              ],
            ),
          ),
        );
      });

// the future
  var res = await future;

// close the dialog automatically
  // ignore: use_build_context_synchronously
  Navigator.of(context).pop();
  return res;
}
