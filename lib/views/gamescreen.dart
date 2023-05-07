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
  GameController _gameController = GameController(cellHeight: 12, cellWidth: 12, offsetX: 20, offsetY: 100);

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
    setState(() {
      _gameController.jumpTrigger = true;
    });
  }

  void moveRight(){
    setState(() {
      _gameController.rightTrigger = true;
      _gameController.rightPressed = true;
    });
  }

  void moveRightReleased(){
    setState(() {
      _gameController.rightPressed = false;
    });
  }

  void moveLeft(){
    setState(() {
      _gameController.leftTrigger = true;
      _gameController.leftPressed = true;
    });
  }

  void moveLeftReleased(){
    setState(() {
      _gameController.leftPressed = false;
    });
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
          Stack(
            children: ViewUtils.getMapScreen(_gameController.gameMap.map, _gameController.cellWidth, _gameController.cellHeight, _gameController.offsetX, _gameController.offsetY, _gameController.viewMapLeft, _gameController.viewMapRight),
          ),
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