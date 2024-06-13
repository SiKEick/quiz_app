import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:quiz_app/quiz_brain.dart';

QuizBrain quizBrain = QuizBrain();
void main() {
  runApp(const QuizApp());
}

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.grey.shade900,
          body: SafeArea(child: QuizPage()),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Widget> IconList = [];
  void IconDisplay(bool value) {
    setState(() {
      if (quizBrain.getQuesAns() == value) {
        IconList.add(Icon(
          Icons.check,
          color: Colors.green,
        ));
      } else {
        IconList.add(Icon(
          Icons.close,
          color: Colors.red,
        ));
      }

      quizBrain.nextQues();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, 10, 20, 20),
            child: Container(
              child: Center(
                child: Text(
                  quizBrain.getQuesText(),
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 25.0),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(20, 10, 20, 20),
          child: Container(
            height: 100.0,
            color: Colors.green,
            child: TextButton(
              onPressed: () {
                if (quizBrain.isFinished()) {
                  Alert(
                    context: context,
                    type: AlertType.error,
                    title: 'Quiz Completed',
                    buttons: [
                      DialogButton(
                          child: Text('Okay',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20)),
                          onPressed: () {
                            setState(() {
                              quizBrain.resetNum();
                              IconList.removeRange(0, IconList.length);
                              Navigator.pop(context);
                            });
                          }),
                    ],
                  ).show();
                } else {
                  IconDisplay(true);
                }
              },
              child: Text(
                'True',
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(20, 10, 20, 20),
          child: Container(
            height: 100.0,
            color: Colors.red,
            child: TextButton(
              onPressed: () {
                if (quizBrain.isFinished()) {
                  Alert(
                    context: context,
                    type: AlertType.error,
                    title: 'Quiz Completed',
                    buttons: [
                      DialogButton(
                          child: Text('Okay',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20)),
                          onPressed: () {
                            setState(() {
                              quizBrain.resetNum();
                              IconList.removeRange(0, IconList.length);
                              Navigator.pop(context);
                            });
                          }),
                    ],
                  ).show();
                } else {
                  IconDisplay(false);
                }
              },
              child: Text(
                'False',
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              ),
            ),
          ),
        ),
        Row(
          children: IconList,
        )
      ],
    );
  }
}
