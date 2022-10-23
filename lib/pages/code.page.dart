import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/constant.dart';
import 'package:quiz_app/pages/menu.dart';
import 'package:sizer/sizer.dart';

import '../model/question.model.dart';

class QuestionPage extends StatelessWidget {
  const QuestionPage({super.key, required this.questionData});

  final List<Question> questionData;

  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 50.w,
        leading: Container(
          margin: EdgeInsets.all(5),
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          decoration: BoxDecoration(
            color: Color.fromARGB(10, 0, 0, 0),
            borderRadius: BorderRadius.circular(50),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                Icons.arrow_back_rounded,
                color: kPrimaryTextColor,
              ),
              Text(
                'Back',
                style: TextStyle(color: kPrimaryTextColor),
              ),
            ],
          ),
        ),
      ),
      body: PageView.builder(
          itemCount: questionData.length,
          physics: const NeverScrollableScrollPhysics(),
          controller: pageController,
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LinearProgressIndicator(
                      backgroundColor: Colors.grey,
                      valueColor: AlwaysStoppedAnimation<Color>(kPrimaryColor),
                      value: (index + 1) / questionData.length),
                  Text('Question ${index + 1}'),
                  Text(questionData[index].difficulty == 'Easy'
                      ? 'Difficulty level: Ez'
                      : 'Difficulty level: ${questionData[index].difficulty}'),
                  Text('Category: ${questionData[index].category}'),
                  Text(questionData[index].question),
                  const SizedBox(height: 40),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 100.w,
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              side: BorderSide(color: kPrimaryColor, width: 1),
                              foregroundColor: kSecondaryColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50))),
                          onPressed: () {
                            pageController.nextPage(
                                duration: const Duration(milliseconds: 700),
                                curve: Curves.fastLinearToSlowEaseIn);
                          },
                          child: Text(
                            questionData[index].answers.answerA,
                            textAlign: TextAlign.center,
                            style: TextStyle(color: kPrimaryColor),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 100.w,
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              side: BorderSide(color: kPrimaryColor, width: 1),
                              foregroundColor: kSecondaryColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50))),
                          onPressed: () {
                            pageController.nextPage(
                                duration: const Duration(milliseconds: 700),
                                curve: Curves.fastLinearToSlowEaseIn);
                          },
                          child: Text(
                            questionData[index].answers.answerB,
                            textAlign: TextAlign.center,
                            style: TextStyle(color: kPrimaryColor),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 100.w,
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              side: BorderSide(color: kPrimaryColor, width: 1),
                              foregroundColor: kSecondaryColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50))),
                          onPressed: () {
                            pageController.nextPage(
                                duration: const Duration(milliseconds: 700),
                                curve: Curves.fastLinearToSlowEaseIn);
                          },
                          child: Text(
                            questionData[index].answers.answerC,
                            textAlign: TextAlign.center,
                            style: TextStyle(color: kPrimaryColor),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 100.w,
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              side: BorderSide(color: kPrimaryColor, width: 1),
                              foregroundColor: kSecondaryColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50))),
                          onPressed: () {
                            pageController.nextPage(
                                duration: const Duration(milliseconds: 700),
                                curve: Curves.fastLinearToSlowEaseIn);
                          },
                          child: Text(
                            questionData[index].answers.answerD,
                            textAlign: TextAlign.center,
                            style: TextStyle(color: kPrimaryColor),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 100.w,
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              side: BorderSide(color: kPrimaryColor, width: 1),
                              foregroundColor: kSecondaryColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50))),
                          onPressed: () {
                            pageController.nextPage(
                                duration: const Duration(milliseconds: 700),
                                curve: Curves.fastLinearToSlowEaseIn);
                          },
                          child: Text(
                            questionData[index].answers.answerE,
                            textAlign: TextAlign.center,
                            style: TextStyle(color: kPrimaryColor),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 100.w,
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              side: BorderSide(color: kPrimaryColor, width: 1),
                              foregroundColor: kSecondaryColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50))),
                          onPressed: () {
                            pageController.nextPage(
                                duration: const Duration(milliseconds: 700),
                                curve: Curves.fastLinearToSlowEaseIn);
                          },
                          child: Text(
                            questionData[index].answers.answerF,
                            textAlign: TextAlign.center,
                            style: TextStyle(color: kPrimaryColor),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }),
    );
  }
}
