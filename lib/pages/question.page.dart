import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/constant.dart';
import 'package:quiz_app/pages/menu.dart';
import 'package:sizer/sizer.dart';
import 'package:timer_builder/timer_builder.dart';

import '../model/question.model.dart';
import '../utils/show_answer.dart';

// ignore: must_be_immutable
class QuestionPage extends StatelessWidget {
  QuestionPage(
      {super.key, required this.questionData, required this.timePerQuestion});

  final List<Question> questionData;
  int timePerQuestion;

  @override
  Widget build(BuildContext context) {
    //* VAR DECLARATION
    PageController pageController = PageController();
    RxInt score = 0.obs;
    RxString answer = ''.obs;
    RxBool visibleAnswer = false.obs;
    RxBool answered = false.obs;

    return Scaffold(
      body: PageView.builder(
          itemCount: questionData.length,
          physics: const NeverScrollableScrollPhysics(),
          controller: pageController,
          itemBuilder: (context, index) {
            return Obx(
              () => Container(
                padding: const EdgeInsets.only(
                    bottom: 20, left: 20, right: 20, top: 15),
                child: SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Align(
                            alignment: const Alignment(-1, 1),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(50),
                              onTap: () => Get.off(() => const MenuPage()),
                              child: Container(
                                width: 30.w,
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: const Color(0x09000000),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
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
                          Align(
                            alignment: const Alignment(1, -1),
                            child: Container(
                              margin: const EdgeInsets.only(bottom: 15),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: kPrimaryColor, width: 2),
                                  shape: BoxShape.circle),
                              child: CircleAvatar(
                                backgroundColor: Colors.transparent,
                                child: TimerBuilder.periodic(
                                  const Duration(seconds: 1),
                                  builder: (context) {
                                    timePerQuestion -= 1;
                                    if (timePerQuestion < 0) {
                                      timePerQuestion = 15;
                                      pageController.nextPage(
                                        duration: const Duration(seconds: 1),
                                        curve: Curves.fastLinearToSlowEaseIn,
                                      );
                                    }
                                    return Text(timePerQuestion.toString());
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: LinearProgressIndicator(
                            backgroundColor: Colors.grey,
                            valueColor: const AlwaysStoppedAnimation<Color>(
                                kPrimaryColor),
                            value: (index + 1) / questionData.length),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Question ${index + 1}',
                                style: regularMediumStyle.copyWith(
                                    color: Colors.black38),
                              ),
                              Text('Your score: $score'),
                            ],
                          ),
                          Text(
                            'Jawaban :  ${questionData[index].correctAnswer}',
                            style: regularMediumStyle.copyWith(
                                color: Colors.black38),
                          ),
                          Text(questionData[index].difficulty == 'Easy'
                              ? 'Difficulty level: Ez'
                              : 'Difficulty level: ${questionData[index].difficulty}'),
                          Text('Category: ${questionData[index].category}'),
                          Text(questionData[index].question),
                        ],
                      ),
                      Flexible(
                        child: Column(
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
                                        borderRadius:
                                            BorderRadius.circular(50))),
                                onPressed: answered.value
                                    ? null
                                    : () {
                                        answer.value = 'answer_a';
                                        if (answer.value ==
                                                questionData[index]
                                                    .correctAnswer &&
                                            questionData[index]
                                                    .correctAnswers
                                                    .answerACorrect ==
                                                true) {
                                          score += 10;
                                        }
                                        visibleAnswer.value = true;
                                        answered.value = true;
                                      },
                                child: Row(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(right: 15),
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: visibleAnswer.value
                                              ? questionData[index]
                                                      .correctAnswers
                                                      .answerACorrect
                                                  ? Colors.green
                                                  : Colors.red
                                              : Colors.black12,
                                        ),
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
                                        style: const TextStyle(
                                            color: kPrimaryTextColor),
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
                                        borderRadius:
                                            BorderRadius.circular(50))),
                                onPressed: answered.value
                                    ? null
                                    : () {
                                        answer.value = 'answer_b';
                                        if (answer.value ==
                                                questionData[index]
                                                    .correctAnswer &&
                                            questionData[index]
                                                .correctAnswers
                                                .answerBCorrect) {
                                          score += 10;
                                        }
                                        visibleAnswer.value = true;
                                        answered.value = true;
                                      },
                                child: Row(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(right: 15),
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: visibleAnswer.value
                                              ? questionData[index]
                                                      .correctAnswers
                                                      .answerBCorrect
                                                  ? Colors.green
                                                  : Colors.red
                                              : Colors.black12,
                                        ),
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
                                        style: const TextStyle(
                                            color: kPrimaryTextColor),
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
                                      onPressed: answered.value
                                          ? null
                                          : () {
                                              answer.value = 'answer_c';
                                              if (answer.value ==
                                                      questionData[index]
                                                          .correctAnswer &&
                                                  questionData[index]
                                                      .correctAnswers
                                                      .answerCCorrect) {
                                                score += 10;
                                              }
                                              visibleAnswer.value = true;
                                              answered.value = true;
                                            },
                                      child: Row(
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.only(
                                                right: 15),
                                            padding: const EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                color: visibleAnswer.value
                                                    ? questionData[index]
                                                            .correctAnswers
                                                            .answerCCorrect
                                                        ? Colors.green
                                                        : Colors.red
                                                    : Colors.black12,
                                              ),
                                              color: const Color(0x0F000000),
                                            ),
                                            child: const Text(
                                              'C',
                                              style: TextStyle(
                                                  color: kPrimaryColor),
                                            ),
                                          ),
                                          Flexible(
                                            child: Text(
                                              questionData[index]
                                                  .answers
                                                  .answerC,
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
                                      onPressed: answered.value
                                          ? null
                                          : () {
                                              answer.value = 'answer_d';
                                              if (answer.value ==
                                                      questionData[index]
                                                          .correctAnswer &&
                                                  questionData[index]
                                                      .correctAnswers
                                                      .answerDCorrect) {
                                                score += 10;
                                              }
                                              visibleAnswer.value = true;
                                              answered.value = true;
                                            },
                                      child: Row(
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.only(
                                                right: 15),
                                            padding: const EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                color: visibleAnswer.value
                                                    ? questionData[index]
                                                            .correctAnswers
                                                            .answerDCorrect
                                                        ? Colors.green
                                                        : Colors.red
                                                    : Colors.black12,
                                              ),
                                              color: const Color(0x0F000000),
                                            ),
                                            child: const Text(
                                              'D',
                                              style: TextStyle(
                                                  color: kPrimaryColor),
                                            ),
                                          ),
                                          Flexible(
                                            child: Text(
                                              questionData[index]
                                                  .answers
                                                  .answerD,
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
                                      onPressed: answered.value
                                          ? null
                                          : () {
                                              answer.value = 'answer_e';
                                              if (answer.value ==
                                                      questionData[index]
                                                          .correctAnswer &&
                                                  questionData[index]
                                                          .correctAnswers
                                                          .answerECorrect ==
                                                      true) {
                                                score += 10;
                                              }
                                              visibleAnswer.value = true;
                                              answered.value = true;
                                            },
                                      child: Row(
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.only(
                                                right: 15),
                                            padding: const EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                color: visibleAnswer.value
                                                    ? questionData[index]
                                                            .correctAnswers
                                                            .answerECorrect
                                                        ? Colors.green
                                                        : Colors.red
                                                    : Colors.black12,
                                              ),
                                              color: const Color(0x0F000000),
                                            ),
                                            child: const Text(
                                              'E',
                                              style: TextStyle(
                                                  color: kPrimaryColor),
                                            ),
                                          ),
                                          Flexible(
                                            child: Text(
                                              questionData[index]
                                                  .answers
                                                  .answerE,
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
                                      onPressed: answered.value
                                          ? null
                                          : () {
                                              answer.value = 'answer_f';
                                              if (answer.value ==
                                                      questionData[index]
                                                          .correctAnswer &&
                                                  questionData[index]
                                                      .correctAnswers
                                                      .answerFCorrect) {
                                                score += 10;
                                              }
                                              visibleAnswer.value = true;
                                              answered.value = true;
                                            },
                                      child: Row(
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.only(
                                                right: 15),
                                            padding: const EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                color: visibleAnswer.value
                                                    ? questionData[index]
                                                            .correctAnswers
                                                            .answerFCorrect
                                                        ? Colors.green
                                                        : Colors.red
                                                    : Colors.black12,
                                              ),
                                              color: const Color(0x0F000000),
                                            ),
                                            child: const Text(
                                              'F',
                                              style: TextStyle(
                                                  color: kPrimaryColor),
                                            ),
                                          ),
                                          Flexible(
                                            child: Text(
                                              questionData[index]
                                                  .answers
                                                  .answerF,
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

                            // ! CHECK IF NONE CORRECT ANSWER (USER CAN SKIP QUESTION!)
                            questionData[index].correctAnswer == '-'
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
                                      onPressed: answered.value
                                          ? null
                                          : () {
                                              score += 10;
                                              visibleAnswer.value = true;
                                              answered.value = true;
                                            },
                                      child: Row(
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.only(
                                                right: 15),
                                            padding: const EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                color: visibleAnswer.value
                                                    ? Colors.green
                                                    : Colors.black12,
                                              ),
                                              color: const Color(0x0F000000),
                                            ),
                                            child: Text(
                                              checkLastAnswer(
                                                  questionData[index].answers),
                                              style: const TextStyle(
                                                  color: kPrimaryColor),
                                            ),
                                          ),
                                          const Flexible(
                                            child: Text(
                                              'None Of The Above.',
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  color: kPrimaryTextColor),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                : Container(),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment(-1, 1),
                        child: answered.value
                            ? TextButton(
                                onPressed: () {
                                  visibleAnswer.value = false;
                                  answered.value = false;
                                  pageController.nextPage(
                                      duration: const Duration(seconds: 1),
                                      curve: Curves.fastLinearToSlowEaseIn);
                                },
                                child: Text('Next'))
                            : null,
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
