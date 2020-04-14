import 'package:flutter/material.dart';
import 'questionMadel.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Quiz",
      theme: ThemeData.dark(),
      home: MyHomeScreen(),
    );
  }
}

class MyHomeScreen extends StatefulWidget {
  MyHomeScreen({Key key}) : super(key: key);

  @override
  _MyHomeScreenState createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  List<Question> myQuestion = [
    Question(
        "1. Approximately one quarter of human bones are in the feet,", false),
    Question(
        "2.Approximately one quarter of human bones are in the feet,", true),
    Question(
        "3.Approximately one quarter of human bones are in the feet,", true),
    Question(
        "4.Approximately one quarter of human bones are in the feet,", false),
  ];

  int QuestionNumber = 0;
  List<Icon> ShowResult = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quiz App"),
      ),
      body: Container(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Flexible(
            flex: 8,
            child: Center(
              child: Text(
                myQuestion[QuestionNumber].question,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 26.0),
              ),
            ),
          ),
          Flexible(
            flex: 4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  color: Colors.green,
                  margin: EdgeInsets.fromLTRB(20, 0, 20, 10),
                  width: double.infinity,
                  height: 85.0,
                  child: FlatButton(
                    onPressed: () {
                      setState(() {
                        if (myQuestion[QuestionNumber].answer == true) {
                          ShowResult.add(
                            Icon(
                              Icons.check,
                              color: Colors.green,
                            ),
                          );
                        } else {
                          ShowResult.add(
                            Icon(
                              Icons.close,
                              color: Colors.red,
                            ),
                          );
                        }
                        QuestionNumber++;
                      });
                    },
                    child: Text(
                      "True",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                      ),
                    ),
                  ),
                ),
                Container(
                  color: Colors.red,
                  margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  width: double.infinity,
                  height: 85.0,
                  child: FlatButton(
                    onPressed: () {
                      setState(() {
                        if (myQuestion[QuestionNumber].answer == false) {
                          ShowResult.add(
                            Icon(
                              Icons.check,
                              color: Colors.green,
                            ),
                          );
                        } else {
                          ShowResult.add(
                            Icon(
                              Icons.close,
                              color: Colors.red,
                            ),
                          );
                        }
                        QuestionNumber++;
                      });
                    },
                    child: Text(
                      "False",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(children: ShowResult),
          ),
        ],
      )),
    );
  }
}
