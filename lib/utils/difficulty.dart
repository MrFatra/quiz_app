import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../constant.dart';

Future<String> chooseDifficulty(
  BuildContext context,
) async {
  String difficulty = '';
  await showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text('Pilih tingkat kesulitan : '),
            SizedBox(height: 40),
            Container(
              margin: EdgeInsets.only(bottom: 30),
              width: 100.w,
              child: ElevatedButton(
                onPressed: () {
                  difficulty = 'easy';
                  Get.back();
                },
                child: Text('EZ'),
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                    padding: EdgeInsets.all(17),
                    backgroundColor: kSecondaryColor),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 30),
              width: 100.w,
              child: ElevatedButton(
                onPressed: () {
                  difficulty = 'medium';
                  Get.back();
                },
                child: Text('MEDIUM'),
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                    padding: EdgeInsets.all(17),
                    backgroundColor: kSecondaryColor),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              width: 100.w,
              child: ElevatedButton(
                onPressed: () {
                  difficulty = 'hard';
                  Get.back();
                },
                child: Text('HARD'),
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                    padding: EdgeInsets.all(17),
                    backgroundColor: kSecondaryColor),
              ),
            ),
          ],
        ),
      );
    },
  );
  return difficulty;
}
