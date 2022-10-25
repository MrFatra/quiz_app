// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:quiz_app/api/questions.dart';
import 'package:quiz_app/auth/question.auth.dart';
import 'package:quiz_app/constant.dart';
import 'package:quiz_app/utils/difficulty.dart';
import 'package:quiz_app/widgets/loading_dialog.dart';

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
              // ! Programming Category
              InkWell(
                onTap: () async {
                  final difficulty = await chooseDifficulty(context);

                  if (difficulty != '') {
                    getQuestionData(context,
                        difficulty: difficulty, category: 'Code');
                  }
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

              // ! Linux Category
              InkWell(
                onTap: () async {
                  final difficulty = await chooseDifficulty(context);

                  if (difficulty != '') {
                    getQuestionData(context,
                        difficulty: difficulty, category: 'Linux');
                  }
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
                        'assets/anim/artist.json',
                        fit: BoxFit.cover,
                        height: 15.h,
                      ),
                      Text(
                        'Linux',
                        style: subtitle,
                      ),
                    ],
                  ),
                ),
              ),

              // ! CMS Category
              InkWell(
                onTap: () async {
                  final difficulty = await chooseDifficulty(context);

                  if (difficulty != '') {
                    getQuestionData(context,
                        difficulty: difficulty, category: 'CMS');
                  }
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
                        'assets/anim/mathematics.json',
                        fit: BoxFit.cover,
                        height: 15.h,
                      ),
                      Text(
                        'CMS',
                        style: subtitle,
                      ),
                    ],
                  ),
                ),
              ),

              // ! Docker Category
              InkWell(
                onTap: () async {
                  final difficulty = await chooseDifficulty(context);

                  if (difficulty != '') {
                    getQuestionData(context,
                        difficulty: difficulty, category: 'Docker');
                  }
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
                        'assets/anim/boy-science.json',
                        fit: BoxFit.cover,
                        height: 15.h,
                      ),
                      Text(
                        'Docker',
                        style: subtitle,
                      ),
                    ],
                  ),
                ),
              ),

              // ! SQL Category
              InkWell(
                onTap: () async {
                  final difficulty = await chooseDifficulty(context);

                  if (difficulty != '') {
                    getQuestionData(context,
                        difficulty: difficulty, category: 'SQL');
                  }
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
                        'assets/anim/book-search.json',
                        fit: BoxFit.cover,
                        height: 15.h,
                      ),
                      Text(
                        'SQL',
                        style: subtitle,
                      ),
                    ],
                  ),
                ),
              ),

              // ! DevOps Category
              InkWell(
                onTap: () async {
                  final difficulty = await chooseDifficulty(context);

                  if (difficulty != '') {
                    getQuestionData(context,
                        difficulty: difficulty, category: 'DevOps');
                  }
                },
                child: Card(
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
                        'DevOps',
                        style: subtitle,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
