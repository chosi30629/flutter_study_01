import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Navigation test',
    home: FirstScreen(),
  ));
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Scaffold firstScreen = Scaffold(
      appBar: AppBar(
        title: Text('First screen'),
      ),
      body: RaisedButton(
          child: Text('Go to second'),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SecondScreen()));
          }
      ),
    );

    return firstScreen;
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second screen'),
      ),
      body: RaisedButton(
          child: Text('Return to first'),
          onPressed: () {
            Navigator.pop(context);
          }
      ),
    );
  }
}