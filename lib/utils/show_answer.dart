import 'package:quiz_app/model/answer.model.dart';
import 'package:quiz_app/model/correct_answer.model.dart';

String checkLastAnswer(Answers answers) {
  if (answers.answerA == '') {
    return 'A';
  } else if (answers.answerB == '') {
    return 'B';
  } else if (answers.answerC == '') {
    return 'C';
  } else if (answers.answerD == '') {
    return 'D';
  } else if (answers.answerE == '') {
    return 'E';
  } else if (answers.answerF == '') {
    return 'F';
  } else {
    return 'G';
  }
}
