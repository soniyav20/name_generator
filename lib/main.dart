import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Home(),
    ),
  );
}

class Home extends StatelessWidget {
  //the widget which doesn't change after running once in run time
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          'Random Name Generator',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 30.0,
              fontFamily: 'PatrickHand'),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'CLICK HERE TO GENERATE A UNIQUE NAME',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15.0,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Random(), //calling the stful class widget
          ],
        ),
      ),
    );
  }
}

class Random extends StatefulWidget {
  //using this stful widget coz the names have to increase in runtime and also should store the previously showed name in memory incase we scroll back
  const Random({Key? key}) : super(key: key);

  @override
  _RandomState createState() => _RandomState();
}

class _RandomState extends State<Random> {
  @override
  Widget build(BuildContext context) {
    final wordPair = WordPair
        .random(); //exact name wordpair should be used coz it is already declared in the imported file
//this declaration is inside build method coz it has to be updated each time
    createAlertDialogue(BuildContext context) {
      return showDialog(
          context: context,
          builder: (context) {
            return Dialog(
                elevation: 8.0,
                backgroundColor: Colors.white,
                child: Container(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        wordPair.asPascalCase,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                          color: Colors.red,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        'THIS IS YOUR RANDOM NAME',
                        style: TextStyle(fontSize: 15.0, color: Colors.black),
                      ),
                      SizedBox(height: 10.0),
                      new MaterialButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        color: Colors.red,
                        child: Text(
                          'OK',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                          ),
                        ),
                      ),
                      /*SizedBox(
                      height: 10.0,
                    ),
                    new MaterialButton(
                      onPressed: () {
                        setState(() {
                          final wordPair = WordPair.random();
                        });
                        createAlertDialogue(context);
                      },
                      color: Colors.red,
                      child: Text(
                        'GENERATE NEW NAME',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                        ),
                      ),
                    ),*/
                    ],
                  ),
                ));
          });
    }

    return MaterialButton(
      onPressed: () {
        setState(() {
          final wordPair = WordPair.random();
        });
        createAlertDialogue(context);
      },
      elevation: 20.0,
      padding: EdgeInsets.all(10.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      color: Colors.red,
      child: Text(
        'GENERATE',
        style: TextStyle(
          fontSize: 30.0,
          color: Colors.white,
        ),
      ),
    );
  }
}
