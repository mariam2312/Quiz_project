// ignore_for_file: deprecated_member_use
//@dart=2.9
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'quiz.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: QuizPage(),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => TestState();
}

class TestState extends State<QuizPage> {
  List<Widget> score = [];
  Quiz quiz1 = Quiz();
  int correctAnswer = 0;
  void checking(bool correct) {
    bool check = quiz1.getAnswer();

    setState(() {
      if (quiz1.finish() == false) {
        if (check == correct) {
          correctAnswer++;
          // ignore: avoid_print
          print(correctAnswer);
          score.add(const Icon(
            Icons.check,
            color: Colors.green,
          ));
        } else if (check != correct) {
          score.add(
            const Icon(
              Icons.close,
              color: Colors.red,
            ),
          );
        }
      }
      quiz1.nextQuestion();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 5,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                //quiz1.questions[k].question,
                quiz1.getQuestion(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                ),
              ),
            ),
          ),
        ),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.all(10),
          child: FlatButton(
            onPressed: () {
              /*setState(
                      () {
                        bool check = quiz1.getAnswer();
                        if (check == true ) {
                          score.add(const Icon(
                            Icons.check,
                            color: Colors.green,
                          ));
                          correct++;
                        } else {
                          score.add(
                            const Icon(
                              Icons.close,
                              color: Colors.red,
                            ),
                          );
                        }
                        quiz1.nextQuestion();
                      },*/
              checking(true);
            },
            child: const Text(
              'true',
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
            color: Colors.green,
          ),
        )),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.all(10),
          child: FlatButton(
            onPressed: () {
              /*setState(
                      () {
                        bool check = quiz1.getAnswer();
                        if (check == false) {
                          score.add(
                            const Icon(
                              Icons.check,
                              color: Colors.green,
                            ),
                          );
                          correct++;
                        } else {
                          score.add(const Icon(
                            Icons.close,
                            color: Colors.red,
                          ));
                        }
                        );
                        },
                        quiz1.nextQuestion();*/
              checking(false);
            },
            child: const Text(
              'false',
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
            color: Colors.red,
          ),
        )),
        Row(
          children: score,
        ),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FlatButton(
            onPressed: () {
              setState(() {
                if (quiz1.finish() == true) {
                  // ignore: avoid_print
                  // alert appear when finish quiz .
                  Alert(
                    context: context,
                    title: 'Finished!',
                    desc: 'Your score $correctAnswer',
                  ).show();
                  correctAnswer = 0;
                  quiz1.reset();
                  score = [];
                }
              });
            },
            child: const Text(
              'finish',
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
            color: Colors.blue,
          ),
        )),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'My Score = $correctAnswer',
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}
