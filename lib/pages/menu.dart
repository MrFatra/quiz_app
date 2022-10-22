import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:quiz_app/api/programing.dart';
import 'package:quiz_app/constant.dart';

// third-party package
import 'package:sizer/sizer.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

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
                  final questionRequest = await QuestionAPI()
                      .getQuestion(
                        category: 'Code',
                        difficulty: 'easy',
                        limit: '20',
                        tags: '',
                      )
                      .then(
                        (result) => result.fold(
                          (l) => debugPrint(l),
                          (r) => debugPrint(
                            r.toString(),
                          ),
                        ),
                      );
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
