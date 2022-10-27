import 'package:flutter/material.dart';

class ResultAnswer extends StatelessWidget {
  const ResultAnswer({
    super.key,
    required this.totalQuestion,
    required this.timeTaken,
    required this.correctAnswer,
    required this.totalScore,
  });

  final int totalQuestion;
  final int timeTaken;
  final int correctAnswer;
  final int totalScore;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Total question : $totalQuestion'),
            Text('Time taken : $timeTaken sec'),
            Text('Correct Answer : $correctAnswer'),
            Text('Total Score : $totalScore'),
            Text(correctAnswer < 10 ? 'TRY AGAIN!' : 'CONGRATULATIONS!'),
          ],
        ),
      ),
    );
  }
}
