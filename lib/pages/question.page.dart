import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/constant.dart';
import 'package:quiz_app/pages/menu.dart';
import 'package:sizer/sizer.dart';

import '../model/correct_answer.model.dart';
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
        leading: InkWell(
          borderRadius: BorderRadius.circular(50),
          onTap: () => Get.off(() => MenuPage()),
          child: Container(
            margin: const EdgeInsets.all(5),
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            decoration: BoxDecoration(
              color: const Color(0x09000000),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Icon(
                  Icons.arrow_back_rounded,
                ),
                Text(
                  'Back',
                ),
              ],
            ),
          ),
        ),
      ),
      body: PageView.builder(
          itemCount: questionData.length,
          physics: const NeverScrollableScrollPhysics(),
          controller: pageController,
          itemBuilder: (context, index) {
            debugPrint(
                'Jawaban dari pageview: ${questionData[index].correctAnswer}');
            if (questionData[index].correctAnswer == '-') {
              debugPrint('correct answer = -');
            } else {
              debugPrint('correct answer terisi');
            }
            debugPrint(
                '\nA: ${questionData[index].correctAnswers.answerACorrect}');
            debugPrint(
                'B: ${questionData[index].correctAnswers.answerBCorrect}');
            debugPrint(
                'C: ${questionData[index].correctAnswers.answerCCorrect}');
            debugPrint(
                'D: ${questionData[index].correctAnswers.answerDCorrect}');
            debugPrint(
                'E: ${questionData[index].correctAnswers.answerECorrect}');
            debugPrint(
                'F: ${questionData[index].correctAnswers.answerFCorrect}');
            return Container(
              padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LinearProgressIndicator(
                      backgroundColor: Colors.grey,
                      valueColor:
                          const AlwaysStoppedAnimation<Color>(kPrimaryColor),
                      value: (index + 1) / questionData.length),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Question ${index + 1}',
                        style:
                            regularMediumStyle.copyWith(color: Colors.black38),
                      ),
                      Text(
                        'Jawaban :  ${questionData[index].correctAnswer}',
                        style:
                            regularMediumStyle.copyWith(color: Colors.black38),
                      ),
                      Text(questionData[index].difficulty == 'Easy'
                          ? 'Difficulty level: Ez'
                          : 'Difficulty level: ${questionData[index].difficulty}'),
                      Text('Category: ${questionData[index].category}'),
                      Text(questionData[index].question),
                    ],
                  ),
                  const SizedBox(height: 40),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 100.w,
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              side: const BorderSide(
                                  color: kPrimaryColor, width: 1),
                              foregroundColor: kSecondaryColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50))),
                          onPressed: () {
                            pageController.nextPage(
                                duration: const Duration(milliseconds: 700),
                                curve: Curves.fastLinearToSlowEaseIn);
                          },
                          child: Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(right: 15),
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Colors.black12),
                                  color: const Color(0x0F000000),
                                ),
                                child: const Text(
                                  'A',
                                  style: TextStyle(color: kPrimaryColor),
                                ),
                              ),
                              Flexible(
                                child: Text(
                                  questionData[index].answers.answerA,
                                  textAlign: TextAlign.left,
                                  style:
                                      const TextStyle(color: kPrimaryTextColor),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 100.w,
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              side: const BorderSide(
                                  color: kPrimaryColor, width: 1),
                              foregroundColor: kSecondaryColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50))),
                          onPressed: () {
                            pageController.nextPage(
                                duration: const Duration(milliseconds: 700),
                                curve: Curves.fastLinearToSlowEaseIn);
                          },
                          child: Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(right: 15),
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Colors.black12),
                                  color: const Color(0x0F000000),
                                ),
                                child: const Text(
                                  'B',
                                  style: TextStyle(color: kPrimaryColor),
                                ),
                              ),
                              Flexible(
                                child: Text(
                                  questionData[index].answers.answerB,
                                  textAlign: TextAlign.left,
                                  style:
                                      const TextStyle(color: kPrimaryTextColor),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      questionData[index].answers.answerC != ''
                          ? SizedBox(
                              width: 100.w,
                              child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 10),
                                    side: const BorderSide(
                                        color: kPrimaryColor, width: 1),
                                    foregroundColor: kSecondaryColor,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(50))),
                                onPressed: () {
                                  pageController.nextPage(
                                      duration:
                                          const Duration(milliseconds: 700),
                                      curve: Curves.fastLinearToSlowEaseIn);
                                },
                                child: Row(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(right: 15),
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border:
                                            Border.all(color: Colors.black12),
                                        color: const Color(0x0F000000),
                                      ),
                                      child: const Text(
                                        'C',
                                        style: TextStyle(color: kPrimaryColor),
                                      ),
                                    ),
                                    Flexible(
                                      child: Text(
                                        questionData[index].answers.answerC,
                                        textAlign: TextAlign.left,
                                        style: const TextStyle(
                                            color: kPrimaryColor),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : Container(),
                      questionData[index].answers.answerD != ''
                          ? SizedBox(
                              width: 100.w,
                              child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 10),
                                    side: const BorderSide(
                                        color: kPrimaryColor, width: 1),
                                    foregroundColor: kSecondaryColor,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(50))),
                                onPressed: () {
                                  pageController.nextPage(
                                      duration:
                                          const Duration(milliseconds: 700),
                                      curve: Curves.fastLinearToSlowEaseIn);
                                },
                                child: Row(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(right: 15),
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border:
                                            Border.all(color: Colors.black12),
                                        color: const Color(0x0F000000),
                                      ),
                                      child: const Text(
                                        'D',
                                        style: TextStyle(color: kPrimaryColor),
                                      ),
                                    ),
                                    Flexible(
                                      child: Text(
                                        questionData[index].answers.answerD,
                                        textAlign: TextAlign.left,
                                        style: const TextStyle(
                                            color: kPrimaryColor),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : Container(),
                      questionData[index].answers.answerE != ''
                          ? SizedBox(
                              width: 100.w,
                              child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 10),
                                    side: const BorderSide(
                                        color: kPrimaryColor, width: 1),
                                    foregroundColor: kSecondaryColor,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(50))),
                                onPressed: () {
                                  pageController.nextPage(
                                      duration:
                                          const Duration(milliseconds: 700),
                                      curve: Curves.fastLinearToSlowEaseIn);
                                },
                                child: Row(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(right: 15),
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border:
                                            Border.all(color: Colors.black12),
                                        color: const Color(0x0F000000),
                                      ),
                                      child: const Text(
                                        'E',
                                        style: TextStyle(color: kPrimaryColor),
                                      ),
                                    ),
                                    Flexible(
                                      child: Text(
                                        questionData[index].answers.answerE,
                                        textAlign: TextAlign.left,
                                        style: const TextStyle(
                                            color: kPrimaryColor),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : Container(),
                      questionData[index].answers.answerF != ''
                          ? SizedBox(
                              width: 100.w,
                              child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 10),
                                    side: const BorderSide(
                                        color: kPrimaryColor, width: 1),
                                    foregroundColor: kSecondaryColor,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(50))),
                                onPressed: () {
                                  pageController.nextPage(
                                      duration:
                                          const Duration(milliseconds: 700),
                                      curve: Curves.fastLinearToSlowEaseIn);
                                },
                                child: Row(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(right: 15),
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border:
                                            Border.all(color: Colors.black12),
                                        color: const Color(0x0F000000),
                                      ),
                                      child: const Text(
                                        'F',
                                        style: TextStyle(color: kPrimaryColor),
                                      ),
                                    ),
                                    Flexible(
                                      child: Text(
                                        questionData[index].answers.answerF,
                                        textAlign: TextAlign.left,
                                        style: const TextStyle(
                                            color: kPrimaryColor),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : Container(),
                    ],
                  ),
                ],
              ),
            );
          }),
    );
  }
}
