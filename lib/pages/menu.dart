import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:quiz_app/api/questions.dart';
import 'package:quiz_app/constant.dart';

// third-party package
import 'package:sizer/sizer.dart';

import 'question.page.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(
          Icons.person,
          color: Colors.green,
        ),
      ),
      backgroundColor: kScaffoldBgColor,
      body: ListView(
        padding: const EdgeInsets.all(17),
        children: [
          Text(
            'Halo User,\nApa subjek yang ingin kamu raih hari ini?',
            style: title,
          ),
          SizedBox(height: 20),
          GridView.count(
            shrinkWrap: true,
            crossAxisSpacing: 15.0,
            mainAxisSpacing: 15.0,
            crossAxisCount: 2,
            scrollDirection: Axis.vertical,
            children: [
              InkWell(
                onTap: () async {
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
                                        borderRadius:
                                            BorderRadius.circular(25)),
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
                                        borderRadius:
                                            BorderRadius.circular(25)),
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
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                    padding: EdgeInsets.all(17),
                                    backgroundColor: kSecondaryColor),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                  final res = await QuestionAPI()
                      .getQuestion(
                          category: 'Code',
                          difficulty: difficulty,
                          limit: '20',
                          tags: '')
                      .then((foldValue) =>
                          foldValue.fold((l) => debugPrint(l), (r) {
                            Get.to(() => QuestionPage(questionData: r));
                          }));
                },
                child: Card(
                  elevation: 7,
                  shadowColor: const Color(0xff47B5FF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Lottie.asset(
                        'assets/anim/delivery.json',
                        fit: BoxFit.cover,
                        height: 15.h,
                      ),
                      Text(
                        'Programming',
                        style: subtitle,
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                elevation: 7,
                shadowColor: const Color(0xff47B5FF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Lottie.asset(
                      'assets/anim/artist.json',
                      fit: BoxFit.cover,
                      height: 15.h,
                    ),
                    Text(
                      'Seni',
                      style: subtitle,
                    ),
                  ],
                ),
              ),
              Card(
                elevation: 7,
                shadowColor: const Color(0xff47B5FF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Lottie.asset(
                      'assets/anim/mathematics.json',
                      fit: BoxFit.cover,
                      height: 15.h,
                    ),
                    Text(
                      'Matematika',
                      style: subtitle,
                    ),
                  ],
                ),
              ),
              Card(
                elevation: 7,
                shadowColor: const Color(0xff47B5FF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Lottie.asset(
                      'assets/anim/boy-science.json',
                      fit: BoxFit.cover,
                      height: 15.h,
                    ),
                    Text(
                      'Sains',
                      style: subtitle,
                    ),
                  ],
                ),
              ),
              Card(
                elevation: 7,
                shadowColor: const Color(0xff47B5FF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Lottie.asset(
                      'assets/anim/book-search.json',
                      fit: BoxFit.cover,
                      height: 15.h,
                    ),
                    Text(
                      'Sejarah',
                      style: subtitle,
                    ),
                  ],
                ),
              ),
              Card(
                elevation: 7,
                shadowColor: const Color(0xff47B5FF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                borderOnForeground: true,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Lottie.asset(
                      'assets/anim/playing-music.json',
                      fit: BoxFit.cover,
                      height: 15.h,
                    ),
                    Text(
                      'Musik',
                      style: subtitle,
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
