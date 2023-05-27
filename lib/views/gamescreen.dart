import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_app/controllers/gamecontroller.dart';
import 'package:my_app/views/gamecontext.dart';
import 'package:my_app/views/home.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart'; 

import '../models/level.dart';
import 'utils/viewutils.dart';

class GameScreen extends StatefulWidget {
  GameScreen({super.key, required this.level});
  Level level;

  @override
  State<GameScreen> createState() => _GameScreenState();
}


class _GameScreenState extends State<GameScreen> {
  late Level _level;
  late Timer _timer;
  bool _gameOver = false;
  bool _initialLoad = true;
  bool _showAboutGame = false;
  late GameController _gameController;
  Size size = MediaQueryData.fromWindow(WidgetsBinding.instance.window).size;

  @override
  void initState() {
    super.initState();
    _level = widget.level;
    _gameController = GameController(offsetY: 10, screenSize: size, level: _level);
    _startTimer();
  }

  @override
  void dispose() {
    _stopTimer();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(milliseconds: 50), (timer) {
      if(!_gameController.gameOver){
        setState(() {
          _gameController.setNextState();
        });
      }else{
        if(!_gameOver){
          checkForGameEnd();
          setState(() {
            _gameOver = true;
          });
        }
      }
    });
  }

  void _stopTimer() {
    if (_timer != null) {
      _timer.cancel();
    }
  }

  void jump(){
    _gameController.jumpTrigger = true;
  }

  void moveRight(){
    _gameController.rightTrigger = true;
    _gameController.rightPressed = true;
  }

  void moveRightReleased(){
    _gameController.rightPressed = false;
  }

  void moveLeft(){
    _gameController.leftTrigger = true;
    _gameController.leftPressed = true;
  }

  void moveLeftReleased(){
    _gameController.leftPressed = false;
  }

  void checkForGameEnd(){
      if(!_level.finished){
        return;
      }
      var gamecontext = context.read<GameContext>();
      if(gamecontext.level < _level.level){
        gamecontext.setLevel(_level.level);
      }
  }

  void restartGame(){
    setState(() {
      _gameController.reset();
      _gameOver = false;
    });
  }

  bool isGameOver(){
    return true;
  }

  @override
  Widget build(BuildContext context) {
  return Builder(
    builder: (BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.blue,
        body: Stack(
          children: [
            Focus(
              autofocus: true,
              onKey: (node, event) {
                if (event is RawKeyUpEvent) {
                  if (event.logicalKey == LogicalKeyboardKey.arrowLeft) {
                    moveLeftReleased();
                  } else if (event.logicalKey == LogicalKeyboardKey.arrowRight) {
                    moveRightReleased();
                  }
                }
                if (event is RawKeyDownEvent) {
                  if (event.logicalKey == LogicalKeyboardKey.space) {
                    jump();
                  }else if (event.logicalKey == LogicalKeyboardKey.arrowLeft) {
                    moveLeft();
                  }else if (event.logicalKey == LogicalKeyboardKey.arrowRight) {
                    moveRight();
                  }
                }
                return KeyEventResult.ignored;
              },
              child: Container()
            ),
            Stack(
              children: ViewUtils.getMapScreen(_gameController.gameMap.map, _gameController.cellWidth, _gameController.cellHeight, _gameController.offsetX, _gameController.offsetY, _gameController.viewMapLeft, _gameController.viewMapRight),
            ),
            Positioned(
              top: size.height / 12,
              right: size.height / 12,
              child: MaterialButton(
                highlightColor: Colors.transparent,
                child: const Icon(Icons.info_outline, color: Colors.white), 
                onPressed: () { setState(() {
                  _showAboutGame = true;
                });},
              ),
            ),
            Positioned(
              top: size.height / 12,
              width: _gameController.screenSize.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Distance: ${_gameController.distanceTraveled}", style: TextStyle(decoration: TextDecoration.none, color: Colors.white, fontSize: _gameController.cellHeight / 2),),
                ]
              ),
            ),
            Positioned(
              top: _gameController.offsetY + (_gameController.cellHeight * 16),
              width: _gameController.screenSize.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MaterialButton(
                    onPressed: (){}, 
                    onHighlightChanged: (isHighlighted) {
                      if (!isHighlighted) {
                        moveLeftReleased();
                      }else{
                        moveLeft();
                      }
                    },
                    child: const Icon(Icons.arrow_back),
                  ), 
                  MaterialButton(
                  onPressed: (){jump();},
                    child: const Icon(Icons.arrow_upward_outlined),
                  ),
                  MaterialButton(
                    onPressed: (){}, 
                    onHighlightChanged: (isHighlighted) {
                      if (!isHighlighted) {
                        moveRightReleased();
                      }else{
                        moveRight();
                      }
                    },
                    child: const Icon(Icons.arrow_forward),
                  ),
                ],
              )
            ),
            Visibility (
              visible: _gameOver,
              child:Center(
                child: AlertDialog(
                  title: const Text("Game Over"),
                  content: Text(_level.finished ? "${_level.endingText} \n Distance Travelled: ${_gameController.distanceTraveled}" : " ${_gameController.gameOverText} \n Distance Travelled: ${_gameController.distanceTraveled}"),
                  actions: [
                    ElevatedButton(
                      onPressed: () {

                        restartGame();
                      },
                      child: const Text("Restart Game"),
                    ),
                    ElevatedButton(
                      onPressed: (){
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => MyHomePage(title: "Cube World", initialOpen: false,)),
                        );
                      },
                      child: const Text("Return to main menu")),
                  ],
                )
              ),
            ),
            Visibility (
              visible: _initialLoad,
              child:Center(
                child: AlertDialog(
                  title: const Text("Welcome"),
                  content: Text(_level.startingText,),
                  actions: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _initialLoad = false;
                        });
                      },
                      child: const Text("Lets Play!"),
                    ),
                  ],
                )
              ),
            ),
            Visibility (
              visible: _showAboutGame,
              child:Center(
                child: AlertDialog(
                  title: const Text("About"),
                  content: RichText(
                  text: TextSpan(
                    children: [
                      const TextSpan(
                        text: "Made by ",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                      TextSpan(
                        text: "Nick Latham",
                        style: const TextStyle(
                          color: Colors.blue,
                          fontSize: 16,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            launchUrl(Uri.parse('https://nicholaslatham.com'));
                          },
                      ),
                      const TextSpan(
                        text: "\n\nBuilt with flutter and hosted on netlify",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                  actions: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _showAboutGame = false;
                        });
                      },
                      child: const Text("Ok"),
                    ),
                  ],
                )
              ),
            ),
          ],
        ),
      );
    },
  );
}
}