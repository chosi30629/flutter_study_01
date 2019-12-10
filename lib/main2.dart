import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Navigation test',
//    home: FirstScreen(),
    initialRoute: '/',
    routes: {
      '/': (context) => FirstScreen(),
      '/second': (context) => SecondScreen(),
    },
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

            MyArguments params = MyArguments('My title', 'My message');

            Navigator.pushNamed(context, '/second', arguments: params);
//            Navigator.push(context, MaterialPageRoute(builder: (context) => SecondScreen()));
          }
      ),
    );

    return firstScreen;
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    // TODO extract params
    MyArguments extractedParams = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('Second screen'),
      ),
      body: Column(
        children: <Widget> [
          Text(extractedParams.title + ' ' + extractedParams.message),
          RaisedButton(
            child: Text('Return to first'),
            onPressed: () {
              Navigator.pop(context);
          }),
        ],
      ),
    );
  }
}

class MyArguments {
  final String title;
  final String message;

  MyArguments(this.title, this.message);
}