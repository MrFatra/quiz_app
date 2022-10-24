import '../model/correct_answer.model.dart';

String searchCorrectAnswer(CorrectAnswers correctAnswers) {
  if (correctAnswers.answerACorrect == true) {
    return 'answer_a';
  } else if (correctAnswers.answerBCorrect == true) {
    return 'answer_b';
  } else if (correctAnswers.answerCCorrect == true) {
    return 'answer_c';
  } else if (correctAnswers.answerDCorrect == true) {
    return 'answer_d';
  } else if (correctAnswers.answerECorrect == true) {
    return 'answer_e';
  } else if (correctAnswers.answerFCorrect == true) {
    return 'answer_f';
  } else {
    return '-';
  }
}
