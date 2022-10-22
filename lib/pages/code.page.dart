import 'package:flutter/material.dart';

import '../model/question.model.dart';

class CodePage extends StatelessWidget {
  const CodePage({super.key, required this.questionData});

  final List<Question> questionData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(); // PageView
  }
}
