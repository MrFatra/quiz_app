import 'answer.model.dart';
import 'correct_answer.model.dart';
import 'tags.model.dart';

class Question {
  final int id;
  final String question;
  final String description;
  final Answers answers;
  final bool multipleCorrectAnswers;
  final CorrectAnswers correctAnswers;
  final String correctAnswer;
  final String explanation;
  final String tip;
  final List<Tag> tags;
  final String category;
  final String difficulty;

  Question({
    required this.id,
    required this.question,
    required this.description,
    required this.answers,
    required this.multipleCorrectAnswers,
    required this.correctAnswers,
    required this.correctAnswer,
    required this.explanation,
    required this.tip,
    required this.tags,
    required this.category,
    required this.difficulty,
  });

  factory Question.fromJson(Map<String, dynamic> json) => Question(
        id: json["id"],
        question: json["question"],
        description: json["description"] ?? '-',
        answers: Answers.fromJson(json["answers"]),
        multipleCorrectAnswers:
            json["multiple_correct_answers"] == 'true' ? true : false,
        correctAnswers: CorrectAnswers.fromJson(json["correct_answers"]),
        correctAnswer: json['correct_answer'] ?? '-',
        explanation: json["explanation"] ?? '-',
        tip: json["tip"] ?? '-',
        tags: List<Tag>.from(json["tags"].map((x) => Tag.fromJson(x))),
        category: json["category"] ?? '-',
        difficulty: json["difficulty"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "question": question,
        "description": description,
        "answers": answers.toJson(),
        "multiple_correct_answers": multipleCorrectAnswers,
        "correct_answers": correctAnswers.toJson(),
        "correct_answer": correctAnswer,
        "explanation": explanation,
        "tip": tip,
        "tags": List<dynamic>.from(tags.map((x) => x.toJson())),
        "category": category,
        "difficulty": difficulty,
      };

  static List<Question> questionFromSnapshot(List snapshot) {
    return snapshot.map((data) => Question.fromJson(data)).toList();
  }
}
