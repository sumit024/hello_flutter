import 'package:flutter/material.dart';
import 'questions.dart';

void main() {
  //prompts flutter to draw on screen
  runApp( MyApp());
}

//https://medium.com/flutter-community/the-flutter-const-keyword-demystified-c8d2a2609a80
//Two types of widgets:
//1- Visible (buttons,text,card etc)
//2- Invisible (layout, control..)

// always remember widget is not something that is always visible on the screen
// for example column is invisible widget

//Whilst you can add (and also change) properties in a StatelessWidget,
// there's no way of telling Flutter that it should re-run build() upon such changes.

class MyApp extends StatefulWidget {
   const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    //second part of connection
    return _MyAppState();
  }

 
}

// State is a generic type. State<MyApp> tells flutter that this state belongs
// to MyApp. This is first part of connection.

// to make anything private we add _ in front
class _MyAppState extends State<MyApp>{
  var _idx=0;
  void _answerQuestion() {
    //Calling setState notifies the framework that the internal state of this
    // object has changed in a way that might impact the user interface in this
    // subtree, which causes the framework to schedule a build for this State
    // object.
    // If you just change the state directly without calling setState,
    // the framework might not schedule a build and the user interface for this
    // subtree might not be updated to reflect the new state.

    //In simple words...

    // This call to setState tells the Flutter framework that something has
    // changed in this State, which causes it to rerun the build method below
    // so that the display can reflect the updated values. If we changed
    // idx without calling setState(), then the build method would not be
    // called again, and so nothing would appear to happen.

    setState(() {
      _idx+=1;
    });
    print("answer chosen");
  }

  //returns a widget
  @override
  Widget build(BuildContext context) {
    /*MaterialApp is the starting point of your app, it tells Flutter that you
     are going to use Material components and follow material design in your app.
     Scaffold is used under MaterialApp, it gives you many basic functionalities,
     like AppBar, BottomNavigationBar, Drawer, FloatingActionButton etc.*/

    var questions = [
      "What's your favourite color?",
      "What's your favourite animal?"
    ];
    return MaterialApp(
      //home: Text("Hello",),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("My first app"),
        ),
        body: Column(children: <Widget>[
          Question(questions[_idx]),

          // 3 buttons
          RaisedButton(
            child: const Text("Button 1"),
            onPressed: _answerQuestion,
          ),
          RaisedButton(
            child: const Text("Button 2"),
            onPressed: () => print("button 2 pressed"),
          ),
          RaisedButton(
            child: const Text("Button 3"),
            onPressed: _answerQuestion,
          ),
        ]),
      ),
    );
  }
}
