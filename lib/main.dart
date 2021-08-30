import 'package:flutter/material.dart';
import 'package:tictactoe/screens/homeScreen.dart';
import 'package:tictactoe/wear.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Tic Tac Toe',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: WatchScreen(),
        debugShowCheckedModeBanner: false,
      );
}

class WatchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => WatchShape(
        builder: (context, shape) => InheritedShape(
          shape: shape,
          child: AmbientMode(builder: (context, mode) => HomeScreen()),
        ),
      );
}
