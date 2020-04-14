import 'package:flutter/material.dart';
import 'questionMadel.dart';
import 'QuestionsBrain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuestionsBrain Qb = QuestionsBrain();

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Basic Quiz",
      theme: ThemeData.dark(),
      home: MyHomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomeScreen extends StatefulWidget {
  MyHomeScreen({Key key}) : super(key: key);

  @override
  _MyHomeScreenState createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  List<Icon> ShowResult = [];
  int state = 0;
  int Score = 0;
  int Total = Qb.getLength() + 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Basic Quiz"),
        centerTitle: true,
      ),
      body: Container(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Flexible(
            flex: 8,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  Qb.giveQuestion(),
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 26.0),
                ),
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
                    onPressed: () => validate(true),
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
                    onPressed: () => validate(false),
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

  void validate(bool pressed) {
    if (Qb.state() == 1) {
      setState(() {
        showAlert();
      });
    } else if (Qb.state() == 0) {
      setState(
        () {
          if (Qb.giveAnswer() == pressed) {
            setState(() {
              Score++;
              ShowResult.add(
                Icon(
                  Icons.check,
                  color: Colors.green,
                ),
              );
            });
          } else {
            setState(() {
              ShowResult.add(
                Icon(
                  Icons.close,
                  color: Colors.red,
                ),
              );
            });
          }
          Qb.updateQuestionNumber();
        },
      );
    }
  }

  showAlert() {
    return Alert(
      context: context,
      type: AlertType.warning,
      title: "Quiz is Over ",
      desc: "No of Correct Ansers ${(Score / Total * 100).toStringAsFixed(1)}.",
      buttons: [
        DialogButton(
          child: Text(
            "Play Again",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () {
            Qb.reset();
            Navigator.pop(context);
            setState(() {
              ShowResult = [];
              Score = 0;
            });
          },
          color: Colors.green,
        ),
        DialogButton(
          child: Text(
            "Cancel",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          color: Colors.red,
        )
      ],
    ).show();
  }
}
