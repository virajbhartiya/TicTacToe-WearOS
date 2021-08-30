import 'package:flutter/material.dart';
import 'package:tictactoe/screens/gameScreen.dart';
import 'package:tictactoe/utils.dart';
import 'package:tictactoe/wear.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: WatchShape(
        builder: (context, shape) {
          var screenSize = MediaQuery.of(context).size;
          final shape = InheritedShape.of(context).shape;
          if (shape == Shape.round) {
            screenSize = Size(boxInsetLength(screenSize.width / 2),
                boxInsetLength(screenSize.height / 2));
          }
          var screenHeight = screenSize.height;
          var screenWidth = screenSize.width;

          return Center(
              child: RaisedButton(
            highlightColor: Colors.blue[900],
            elevation: 6.0,
            child: Text(
              'START',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            color: Colors.blue[400],
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) {
                  return GameScreen(screenHeight, screenWidth);
                }),
              );
            },
          ));
        },
      ),
    );
  }
}
