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
  }

  void moveLeft(){
    var gameController= context.read<GameController>();
    gameController.leftTrigger = true;
  }

  void restartGame(){
    var gameController = context.read<GameController>();
    gameController.reset();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onHorizontalDragUpdate: (details) {
          if (details.delta.dx > 0) {
            setState(() {
              // _xPosition += details.delta.dx;
            });
          }
        },
        child: Stack(
          children: [
            Row(
              children: [
                Flexible(
                  child: MaterialButton(onPressed: (){jump();}, child: const Text("Jump")),
                ),
                Flexible(
                  child: MaterialButton(onPressed: (){moveLeft();}, child: const Text("Move Left")),
                ),
                Flexible(
                  child: MaterialButton(onPressed: (){moveRight();}, child: const Text("Move Right")),
                ),
                Flexible(
                  child: MaterialButton(onPressed: (){restartGame();}, child: const Text("Restart Game")),
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
          ],
        ),
      ),
    );
  }
}