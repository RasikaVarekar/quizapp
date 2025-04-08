import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    //currentQuestionIndex = currentQuestionIndex + 1;
    //currentQuestionIndex += 1;
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 245, 223, 180),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ...currentQuestion.getShuffleAnswer().map((answer1) {
              return Padding(
                padding: const EdgeInsets.all(10),
                child: AnswerButton(
                  answerText: answer1,
                  onTap: () {
                    answerQuestion(answer1);
                  },
                ),
              );
            }),
            // AnswerButton(
            //   answerText: currentQuestion.answer[0],
            //   onTap: () {},
            // ),
            // const SizedBox(height: 20),
            // AnswerButton(
            //   answerText: currentQuestion.answer[1],
            //   onTap: () {},
            // ),
            // const SizedBox(height: 20),
            // AnswerButton(
            //   answerText: currentQuestion.answer[2],
            //   onTap: () {},
            // ),
            // const SizedBox(height: 20),
            // AnswerButton(
            //   answerText: currentQuestion.answer[3],
            //   onTap: () {},
            // ),
          ],
        ),
      ),
    );
  }
}
