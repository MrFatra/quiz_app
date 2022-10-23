class Answers {
  Answers({
    required this.answerA,
    required this.answerB,
    required this.answerC,
    required this.answerD,
    required this.answerE,
    required this.answerF,
  });

  final String answerA;
  final String answerB;
  String answerC;
  String answerD;
  String answerE;
  String answerF;

  factory Answers.fromJson(Map<String, dynamic> json) => Answers(
        answerA: json["answer_a"] ?? '',
        answerB: json["answer_b"] ?? '',
        answerC: json["answer_c"] ?? '',
        answerD: json["answer_d"] ?? '',
        answerE: json["answer_e"] ?? '',
        answerF: json["answer_f"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "answer_a": answerA,
        "answer_b": answerB,
        "answer_c": answerC,
        "answer_d": answerD,
        "answer_e": answerE,
        "answer_f": answerF,
      };
}
