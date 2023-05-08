import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_app/controllers/gamecontroller.dart';
import 'package:provider/provider.dart';

import 'utils/viewutils.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}


class _GameScreenState extends State<GameScreen> {
  late Timer _timer;
  bool _gameOver = false;
  bool _initialLoad = true;
  GameController _gameController = GameController(offsetY: 10, screenSize: MediaQueryData.fromWindow(WidgetsBinding.instance!.window).size);

  @override
  void initState() {
    super.initState();
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
      return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.lightBlue[200],
        child: Stack(
          children: [
            Stack(
              children: ViewUtils.getMapScreen(_gameController.gameMap.map, _gameController.cellWidth, _gameController.cellHeight, _gameController.offsetX, _gameController.offsetY, _gameController.viewMapLeft, _gameController.viewMapRight),
            ),
            Positioned(
              top: _gameController.offsetY + (_gameController.cellHeight / 2),
              width: _gameController.screenSize.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Distance: ${_gameController.distanceTraveled}", style: TextStyle(decoration: TextDecoration.none, color: Colors.white, fontSize: _gameController.cellHeight / 2),),
                ]
              ),
            ),
            Positioned(
              top: _gameController.offsetY + (_gameController.cellHeight * 15),
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
                  content: Text(" ${_gameController.gameOverText} \n Distance Travelled: ${_gameController.distanceTraveled}"),
                  actions: [
                    ElevatedButton(
                      onPressed: () {
                        restartGame();
                      },
                      child: const Text("Restart Game"),
                    ),
                  ],
                )
              ),
            ),
            Visibility (
              visible: _initialLoad,
              child:Center(
                child: AlertDialog(
                  title: Text("Welcome"),
                  content: Text("Welcome to cube world. In this game you are a small red cube and your goal is to make it to the end of the map. Now, you may be asking: why am I a cube? Why am I red? How did I become a red cube? Why must I go to the end of the map? That is not important. You are a red cube and your goal is to make it to the end of the map.\n \nFor controls you have buttons to go left, right, and to jump.\n\nYou will encounter different dangerous elements in your journey. Elements that you will have to discover yourself.",),
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
          ],
        ),
      );
    },
  );
}
}