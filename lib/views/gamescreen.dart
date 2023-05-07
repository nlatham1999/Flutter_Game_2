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
    _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      var gameController= context.read<GameController>();
      if(!gameController.gameOver){
        gameController.setNextState();
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
    var gameController= context.read<GameController>();
    gameController.jumpTrigger = true;
  }

  void moveRight(){
    var gameController= context.read<GameController>();
    gameController.rightTrigger = true;
    gameController.rightPressed = true;
  }

  void moveRightReleased(){
    var gameController= context.read<GameController>();
    gameController.rightPressed = false;
  }

  void moveLeft(){
    var gameController= context.read<GameController>();
    gameController.leftTrigger = true;
    gameController.leftPressed = true;
  }

  void moveLeftReleased(){
    var gameController= context.read<GameController>();
    gameController.leftPressed = false;
  }

  void restartGame(){
    var gameController = context.read<GameController>();
    gameController.reset();
    setState(() {
      _gameOver = false;
    });
  }

  bool isGameOver(){
    print(_gameOver);
    return true;
  }

  @override
  Widget build(BuildContext context) {
  return Builder(
    builder: (BuildContext context) {
      return Stack(
        children: [
          Row(
            children: [
              Flexible(
                child: MaterialButton(
                  onPressed: (){jump();},
                  child: const Text("Jump"),
                ),
              ),
              Flexible(
                child: MaterialButton(
                  onPressed: (){}, 
                  onHighlightChanged: (isHighlighted) {
                    if (!isHighlighted) {
                      moveLeftReleased();
                    }else{
                      moveLeft();
                    }
                  },
                  child: const Text("Move Left"),
                ),
              ),
              Flexible(
                child: MaterialButton(
                  onPressed: (){}, 
                  onHighlightChanged: (isHighlighted) {
                    if (!isHighlighted) {
                      moveRightReleased();
                    }else{
                      moveRight();
                    }
                  },
                  child: const Text("Move Right"),
                ),
              ),
            ],
          ),
          Consumer<GameController>(builder: (context, gameController, child){
            return (
              Stack(
                children: ViewUtils.getMapScreen(gameController.gameMap.map, gameController.cellWidth, gameController.cellHeight, gameController.offsetX, gameController.offsetY, gameController.viewMapLeft, gameController.viewMapRight),
              )
            );
          }),
          Visibility (
            visible: _gameOver,
            child:Center(
              child: AlertDialog(
                content: Text("test"),
                actions: [
                  TextButton(
                    onPressed: () {
                      restartGame();
                    },
                    child: const Text("Restart Game"),
                  ),
                ],
              )
            ),
          ),
        ],
      );
    },
  );
}
}