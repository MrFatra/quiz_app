import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../api/question.api.dart';
import '../pages/question.page.dart';
import '../widgets/loading_dialog.dart';

getQuestionData(BuildContext context,
    {required String difficulty, required String category}) {
  loadingData(context,
          future: QuestionAPI().getQuestion(
              category: category,
              difficulty: difficulty,
              limit: '20',
              tags: ''),
          title: 'Loading')
      .then(
    (resultData) => resultData.fold(
      (l) => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Kesalahan'),
              Divider(),
            ],
          ),
          content: Text('Mohon coba lagi.'),
          actions: [TextButton(onPressed: () => Get.back(), child: Text('OK'))],
        ),
      ),
      (r) => Get.to(
        () => QuestionPage(questionData: r),
      ),
    ),
  );
}
