class CorrectAnswers {
  CorrectAnswers({
    required this.answerACorrect,
    required this.answerBCorrect,
    required this.answerCCorrect,
    required this.answerDCorrect,
    required this.answerECorrect,
    required this.answerFCorrect,
  });

  final bool answerACorrect;
  final bool answerBCorrect;
  final bool answerCCorrect;
  final bool answerDCorrect;
  final bool answerECorrect;
  final bool answerFCorrect;

  factory CorrectAnswers.fromJson(Map<String, dynamic> json) => CorrectAnswers(
        answerACorrect: json["answer_a_correct"] == 'true' ? true : false,
        answerBCorrect: json["answer_b_correct"] == 'true' ? true : false,
        answerCCorrect: json["answer_c_correct"] == 'true' ? true : false,
        answerDCorrect: json["answer_d_correct"] == 'true' ? true : false,
        answerECorrect: json["answer_e_correct"] == 'true' ? true : false,
        answerFCorrect: json["answer_f_correct"] == 'true' ? true : false,
      );

  Map<String, dynamic> toJson() => {
        "answer_a_correct": answerACorrect,
        "answer_b_correct": answerBCorrect,
        "answer_c_correct": answerCCorrect,
        "answer_d_correct": answerDCorrect,
        "answer_e_correct": answerECorrect,
        "answer_f_correct": answerFCorrect,
      };

  static String correctAnswerFromSnapshot(CorrectAnswers correctAnswers) {
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
}
