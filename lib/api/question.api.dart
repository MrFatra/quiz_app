import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../auth/key.dart';
import '../model/question.model.dart';
import '../utils/validate_answer.dart';

class QuestionAPI extends GetConnect {
  Future<Either<String, List<Question>>> getQuestion(
      {required String category,
      required String difficulty,
      required String limit,
      required String tags}) async {
    const endpoint = 'https://quizapi.io/api/v1/questions';
    final res = await get(endpoint, contentType: 'aplication/json', query: {
      'apiKey': API_KEY,
      'limit': limit,
      'difficulty': difficulty,
      'category': category,
      'tags': tags,
    }).timeout(const Duration(seconds: 10));

    if (res.isOk) {
      List<Question> tempData = Question.questionFromSnapshot(res.body);
      List<Question> resData = List.from(tempData);

      debugPrint('foreach tempData length: ${tempData.length} (Before)');
      debugPrint('foreach resData length: ${resData.length} (Before)');

      // for checking resData
      for (var mapData in tempData) {
        // validate answer
        mapData.correctAnswer = searchCorrectAnswer(mapData.correctAnswers);
      }

      debugPrint('foreach tempData length: ${tempData.length} (After)');
      debugPrint('foreach resData length: ${resData.length} (After)');

      //!   BUG!
      // request the question if length < 20
      // if (resData.length < 20) {
      //   int restQuestion = 20 - resData.length;
      //   debugPrint('masuk if');
      //   await get(endpoint, contentType: 'aplication/json', query: {
      //     'apiKey': API_KEY,
      //     'limit': restQuestion.toString(),
      //     'difficulty': difficulty,
      //     'category': category,
      //     'tags': tags,
      //   }).timeout(const Duration(seconds: 10)).then((response) {
      //     List<Question> listResponse =
      //         Question.questionFromSnapshot(response.body);
      //     for (var element in listResponse) {
      //       resData.add(element);
      //       if (element.multipleCorrectAnswers == true) {
      //         debugPrint('ada soal yang jawabannya double (last)!');
      //       }
      //     }
      //     debugPrint(resData.length.toString());
      //   });
      // }

      return right(resData);
    } else if (res.body == null) {
      debugPrint('Tidak ada data');
      return left('Tidak ada data');
    } else {
      debugPrint(res.body.toString());
      return left(res.body.toString());
    }
  }
}
