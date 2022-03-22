import 'package:flutter/material.dart';
import 'question.dart';
import 'quiz_brain.dart';

QuizBrain quizBrain = QuizBrain();

void main() => runApp(const QuizApp());

class QuizApp extends StatelessWidget {
  const QuizApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];

  void checkAnswer(bool userPickAnswer) {
    bool correctAnswer = quizBrain.getCorrectAnswer();

    setState(() {
      if (userPickAnswer == correctAnswer) {
        scoreKeeper.add(Icon(
          Icons.check,
          color: Colors.green,
        ));
      } else {
        scoreKeeper.add(Icon(
          Icons.close,
          color: Colors.red,
        ));
      }
      quizBrain.nextQuestion();
    });

    // setState(() {
    //   quizBrain.nextQuestion();
    // });
  }

  // List<String> questions = [
  //   'You can lead a cow down stairs but not up stairs.',
  //   'Approximately one quarter of human bones are in the feet.',
  //   'A slug\'s blood is green.'
  // ];

  List<bool> answers = [false, true, true];

  // Question q1 = Question(
  //     q: 'You can lead a cow down stairs but not up stairs.', a: false);

  // List<Question> questionBank = [
  //   Question(q: 'You can lead a cow down stairs but not up stairs.', a: false),
  //   Question(
  //       q: 'Approximately one quarter of human bones are in the feet.',
  //       a: false),
  //   Question(q: 'A slug\'s blood is green.', a: true)
  // ];

  //int questionNumber = 0;

  // List<Icon> scoreKeeper = [
  //   const Icon(
  //     Icons.check,
  //     color: Colors.green,
  //   ),
  //   const Icon(
  //     Icons.close,
  //     color: Colors.red,
  //   ),
  //   const Icon(
  //     Icons.close,
  //     color: Colors.red,
  //   ),
  //   const Icon(
  //     Icons.close,
  //     color: Colors.red,
  //   ),
  //   const Icon(
  //     Icons.close,
  //     color: Colors.red,
  //   )
  // ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                //quizBrain.questionBank[questionNumber].questionText!,
                quizBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25.0, color: Colors.white),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              child: const Text(
                'True',
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green),
              ),
              onPressed: () {
                checkAnswer(true);
                //bool correctAnswer = answers[questionNumber];
                //bool correctAnswer = quizBrain.questionBank[questionNumber].questionAnswer!;

                // bool correctAnswer = quizBrain.getCorrectAnswer();
                //
                // if (correctAnswer == true) {
                //   print('user got it right.');
                // } else {
                //   print('user got it wrong.');
                // }
                // setState(() {
                //   quizBrain.nextQuestion();
                //   //questionNumber++;
                // });

                // setState(
                //   () {
                //     scoreKeeper.add(
                //       Icon(
                //         Icons.check,
                //         color: Colors.green,
                //       ),
                //     );
                //   },
                // );
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              child: const Text(
                'False',
                style: const TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red),
              ),
              onPressed: () {
                //now we cannot use questionBank beacuse we make this member private
                //quizBrain.questionBank[questionNumber].questionAnswer = true;

                // bool correctAnswer = quizBrain.getCorrectAnswer();
                //
                // if (correctAnswer == false) {
                //   print('user got it right.');
                // } else {
                //   print('user got it wrong.');
                // }
                //
                // setState(() {
                //   quizBrain.nextQuestion();
                // });

                checkAnswer(false);
              },
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        )
        // Row(
        //   //children: scoreKeeper,
        //   children: [
        //     Icon(
        //       Icons.check,
        //       color: Colors.green,
        //     ),
        //     Icon(
        //       Icons.close,
        //       color: Colors.red,
        //     ),
        //     Icon(
        //       Icons.close,
        //       color: Colors.red,
        //     ),
        //     Icon(
        //       Icons.close,
        //       color: Colors.red,
        //     ),
        //     Icon(
        //       Icons.close,
        //       color: Colors.red,
        //     ),
        //   ],
        // )
      ],
    );
  }
}
