import 'package:flutter/material.dart';
import 'package:tictactoe/wear.dart';
import 'package:google_fonts/google_fonts.dart';

class GameScreen extends StatelessWidget {
  final screenHeight;
  final screenWidth;
  GameScreen(this.screenHeight, this.screenWidth);

  @override
  Widget build(BuildContext context) {
    return AmbientMode(
        builder: (context, mode) => Game(screenHeight, screenWidth));
  }
}

class Game extends StatefulWidget {
  final screenHeight;
  final screenWidth;
  Game(this.screenHeight, this.screenWidth);

  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  List<String> displayXO = ['', '', '', '', '', '', '', '', ''];
  bool turn = false;
  int oScore = 0;
  int xScore = 0;
  int dScore = 0;
  int c = 0;

  void _tapped(int index) {
    setState(
      () {
        if (displayXO[index] == '') {
          if (turn) {
            displayXO[index] = 'O';
            c += 1;
          } else {
            displayXO[index] = 'X';
            c += 1;
          }
        }
        turn = !turn;
        _checkWinner(index);
      },
    );
  }

  void _checkWinner(int index) {
    if (displayXO[0] == displayXO[1] &&
        displayXO[0] == displayXO[2] &&
        displayXO[0] != '') {
      setState(
        () {
          c = 0;
        },
      );
      _showDialog(displayXO[index].toString());
    } else if (displayXO[0] == displayXO[4] &&
        displayXO[0] == displayXO[8] &&
        displayXO[0] != '') {
      setState(
        () {
          c = 0;
        },
      );
      _showDialog(displayXO[index].toString());
    } else if (displayXO[0] == displayXO[3] &&
        displayXO[0] == displayXO[6] &&
        displayXO[0] != '') {
      setState(
        () {
          c = 0;
        },
      );
      _showDialog(displayXO[index].toString());
    } else if (displayXO[3] == displayXO[4] &&
        displayXO[3] == displayXO[5] &&
        displayXO[3] != '') {
      setState(
        () {
          c = 0;
        },
      );
      _showDialog(displayXO[index].toString());
    } else if (displayXO[6] == displayXO[7] &&
        displayXO[6] == displayXO[8] &&
        displayXO[6] != '') {
      setState(
        () {
          c = 0;
        },
      );
      _showDialog(displayXO[index].toString());
    } else if (displayXO[0] == displayXO[4] &&
        displayXO[0] == displayXO[8] &&
        displayXO[0] != '') {
      setState(
        () {
          c = 0;
        },
      );
      _showDialog(displayXO[index].toString());
    } else if (displayXO[2] == displayXO[4] &&
        displayXO[2] == displayXO[6] &&
        displayXO[2] != '') {
      setState(
        () {
          c = 0;
        },
      );
      _showDialog(displayXO[index].toString());
    } else if (displayXO[1] == displayXO[4] &&
        displayXO[1] == displayXO[7] &&
        displayXO[1] != '') {
      setState(
        () {
          c = 0;
        },
      );
      _showDialog(displayXO[index].toString());
    } else if (displayXO[2] == displayXO[5] &&
        displayXO[2] == displayXO[8] &&
        displayXO[2] != '') {
      setState(
        () {
          c = 0;
        },
      );
      _showDialog(displayXO[index].toString());
    } else if (c == 9) {
      _drawAlert();
      //print(c);
      setState(
        () {
          c = 0;
          dScore += 1;
        },
      );
    }
  }

  void _showDialog(String winner) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            title: Text(
              "Winner: " + winner,
              style: TextStyle(fontSize: 15),
            ),
            actions: <Widget>[
              FlatButton(
                  color: Colors.grey[700],
                  onPressed: () {
                    _clearBoard();
                    Navigator.of(context).pop();
                  },
                  child:
                      Text('Play Again', style: TextStyle(color: Colors.white)))
            ]);
      },
    );
    setState(() {
      if (winner == 'O')
        oScore += 1;
      else if (winner == 'X')
        xScore += 1;
      else
        dScore += 1;
    });
  }

  void _clearBoard() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        displayXO[i] = '';
      }
    });
  }

  void _drawAlert() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Draw'),
          actions: <Widget>[
            FlatButton(
                onPressed: () {
                  _clearBoard();
                  Navigator.of(context).pop();
                },
                child: Text('Play Again'))
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          color: Colors.black,
          height: widget.screenHeight,
          width: widget.screenWidth,
          child: Stack(
            children: [
              GridView.builder(
                itemCount: 9,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      _tapped(index);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                      ),
                      child: Center(
                        child: Text(
                          displayXO[index],
                          style: GoogleFonts.nunito(
                              color: Colors.white, fontSize: 40),
                        ),
                      ),
                    ),
                  );
                },
              ),
              Container(
                child: CustomPaint(
                  painter: OpenPainter(
                      dimension: widget.screenWidth, offsetY: 150, offsetX: 0),
                ),
              ),
              Container(
                child: CustomPaint(
                  painter: OpenPainter(
                      dimension: widget.screenHeight,
                      offsetY: -150,
                      offsetX: 0),
                ),
              ),
              Container(
                child: CustomPaint(
                  painter: OpenPainter(
                      dimension: widget.screenHeight, offsetY: 0, offsetX: 150),
                ),
              ),
              Container(
                child: CustomPaint(
                  painter: OpenPainter(
                      dimension: widget.screenHeight,
                      offsetY: 0,
                      offsetX: -150),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OpenPainter extends CustomPainter {
  double dimension;
  double offsetX = 0;
  double offsetY = 0;
  OpenPainter({this.dimension, this.offsetX, this.offsetY});
  @override
  void paint(Canvas canvas, Size size) {
    var paint1 = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;
    //a rectangle
    canvas.drawRect(
        Offset(offsetX, offsetY) & Size(550.0 - 2, 550.0 - 2), paint1);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
