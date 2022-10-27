import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/pages/question.page.dart';

import '../model/question.model.dart';

class DetailQuestionPage extends StatelessWidget {
  const DetailQuestionPage({
    super.key,
    required this.questionData,
    required this.category,
    required this.timePerQuestion,
    required this.totalQuestion,
  });

  final List<Question> questionData;
  final String category;
  final String timePerQuestion;
  final String totalQuestion;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Question Category : $category'),
            Text('Question Total : $totalQuestion'),
            Text('Time per-Question : $timePerQuestion seconds'),
            TextButton(
                onPressed: () => Get.to(
                      () => QuestionPage(
                        questionData: questionData,
                        timePerQuestion: int.parse(timePerQuestion),
                      ),
                    ),
                child: Text('Next')),
          ],
        ),
      ),
    );
  }
}
