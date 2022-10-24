import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:quiz_app/auth/key.dart';
import 'package:quiz_app/model/correct_answer.model.dart';

import '../model/question.model.dart';
import '../utils/validate_answer.dart';

class QuestionAPI extends GetConnect {
  Future<Either<String, List<Question>>> getQuestion(
      {required String category,
      required String difficulty,
      required String limit,
      required String tags}) async {
    final res = await get('https://quizapi.io/api/v1/questions',
        contentType: 'aplication/json',
        query: {
          'apiKey': API_KEY,
          'limit': limit,
          'difficulty': difficulty,
          'category': category,
          'tags': tags,
        });

    if (res.isOk) {
      final data = Question.questionFromSnapshot(res.body);

      // validate answer
      for (var mapData in data) {
        mapData.correctAnswer = searchCorrectAnswer(mapData.correctAnswers);
      }

      return right(data);
    } else if (res.body == null) {
      debugPrint('Tidak ada data');
      return left('Tidak ada data');
    } else {
      debugPrint(res.body.toString());
      return left(res.body.toString());
    }
  }
}
