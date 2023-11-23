import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:my_app/constants.dart';
import 'package:my_app/controllers/gamecontroller.dart';
import 'package:my_app/models/levels/testlevel.dart';
import 'package:my_app/views/gamecontext.dart';
import 'package:my_app/views/home.dart';
import 'package:my_app/views/utils/aboutinfo.dart';
import 'package:my_app/views/utils/buttonpositions.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
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
  late Size size;
  bool shiftPressed = false;
  int _duration = 0;
  bool _rightTapDown = false;
  bool _leftTapDown = false;
  bool _menuPressed = false;
  bool pause = false;
  late ButtonsPositions _buttonsPositions;

  String mapAsString = "";

  @override
  void initState() {
    super.initState();
    size = MediaQueryData.fromWindow(WidgetsBinding.instance.window).size;
    _level = widget.level;
    _gameController = GameController(offsetY: 40, screenSize: size, level: _level);
    mapAsString = _gameController.level.mapTemplate.join("\n");
    _buttonsPositions = ButtonsPositions(_gameController.offsetY + (_gameController.cellHeight * 17), _gameController.offsetX, (_gameController.viewMapWidth + 1) * _gameController.cellWidth, size);
    _startTimer();
  }

  @override
  void dispose() {
    _stopTimer();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(milliseconds: 25), (timer) {
      if(pause){
        return;
      }
      if(!_gameController.gameOver){
        setState(() {
          if(_gameController.gameStarted){
            _duration++;
          }
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

  void fire(){
    // _gameController.gameMap.player.fireTrigger = true;
    _gameController.keyPressed.add("fire_trigger");
  }

  void jump(){
    // _gameController.gameMap.player.jumpPressed = true;
    _gameController.keyPressed.add("jump_pressed");
    _gameController.keyPressed.add("jump_clicked");
  }

  void jumpReleased(){
    // _gameController.gameMap.player.jumpPressed = false;
    _gameController.keyPressed.remove("jump_pressed");
  }

  void moveRight(){
    // _gameController.gameMap.player.rightTrigger = true;
    _gameController.keyPressed.add("right_clicked");
    // _gameController.gameMap.player.rightPressed = true;
    _gameController.keyPressed.add("right_pressed");
  }

  void moveRightReleased(){
    // _gameController.gameMap.player.rightPressed = false;
    _gameController.keyPressed.remove("right_pressed");
  }

  void moveLeft(){
    // _gameController.gameMap.player.leftTrigger = true;
    _gameController.keyPressed.add("left_clicked");
    // _gameController.gameMap.player.leftPressed = true;
    _gameController.keyPressed.add("left_pressed");
  }

  void moveLeftReleased(){
    // _gameController.gameMap.player.leftPressed = false;
    _gameController.keyPressed.remove("left_pressed");
  }

  void sprintMode(){
    // _gameController.movingSpeed = 2;
    _gameController.keyPressed.add("sprint_mode");
  }

  void walkingMode(){
    // _gameController.movingSpeed = 1;
    _gameController.keyPressed.remove("sprint_mode");
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

  void restartGame({bool startGame = false}){
    setState(() {
      _duration = 0;
      _gameController.reset();
      _gameOver = false;
      _level.finished = false;
      if(startGame){
        _gameController.gameStarted = true;
      }
      // _gameController.gameStarted = true;
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
        body: GestureDetector(
          onHorizontalDragEnd: (details) {
            if (details.velocity.pixelsPerSecond.dx > 0) {
              // Positive velocity indicates a swipe to the right
              // You can perform your desired action here
              print('Swiped to the right');
            }
          },
          child: Stack(
            children: [
              keyboardEvents(),
              Stack(
                children: ViewUtils.getMapScreen(_gameController.gameMap.map, _gameController.cellWidth, _gameController.cellHeight, _gameController.offsetX, _gameController.offsetY, _gameController.viewMapLeft, _gameController.viewMapRight, numCellsToDisplay: _gameController.numCellsToDisplay),
              ),
              infoButton(),
              topBar(),
              jumpButton(),
              fireButton(),
              leftWalkButton(),
              leftSprintButton(),
              rightWalkButton(),
              rightSprintButton(),
              // mapBuilder1(),
              // mapBuilder2(),
              endGameAlert(),
              menuAlert(),
              welcomeAlert(),
              aboutGameAlert(),
            ],
          ),
        ),
      );
    },
  );
}
  Focus keyboardEvents(){
    return Focus(
      autofocus: true,
      onKey: (node, event) {
        if (event is RawKeyUpEvent) {
          if (event.logicalKey == LogicalKeyboardKey.space) {
            jumpReleased();
          }else if (event.logicalKey == LogicalKeyboardKey.arrowLeft) {
            moveLeftReleased();
          } else if (event.logicalKey == LogicalKeyboardKey.arrowRight) {
            moveRightReleased();
          } else if (event.logicalKey == LogicalKeyboardKey.shiftLeft || event.logicalKey == LogicalKeyboardKey.shiftRight) {
            walkingMode();
          }
        }
        if (event is RawKeyDownEvent) {
          if (event.logicalKey == LogicalKeyboardKey.space) {
            jump();
          } else if (event.logicalKey == LogicalKeyboardKey.keyS) {
            fire();
          }else if (event.logicalKey == LogicalKeyboardKey.arrowLeft) {
              moveLeft();
          }else if (event.logicalKey == LogicalKeyboardKey.arrowRight) {
              moveRight();
          }else if (event.logicalKey == LogicalKeyboardKey.shiftLeft || event.logicalKey == LogicalKeyboardKey.shiftRight) {
            sprintMode();
          }
        }
        return KeyEventResult.ignored;
      },
      child: Container()
    );
  }

  Positioned infoButton(){
    return Positioned(
      top: 0,
      right: 0,
      child: MaterialButton(
        highlightColor: Colors.transparent,
        child: const Icon(Icons.info_outline, color: Colors.white), 
        onPressed: () { 
          setState(() {
          _showAboutGame = true;
          });
        }, 
      )
    );
  }

  Positioned topBar(){
    return Positioned(
      top: size.height * 1 / 12,
      width: _gameController.screenSize.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(onPressed: () {setState(() {
            _gameController.gameStarted = false;
            _menuPressed = true;
          });}, child: const Icon(Icons.menu)),
          Text("Distance: ${_gameController.distanceTraveled.toString()}", style: TextStyle(decoration: TextDecoration.none, color: Colors.white, fontSize: _gameController.cellHeight / 2),),
          Text("\tTime: ${(_duration / 20).toStringAsFixed(2)}", style: TextStyle(decoration: TextDecoration.none, color: Colors.white, fontSize: _gameController.cellHeight / 2),),
          
        ]
      ),
    );
  }

  Positioned jumpButton(){
    return Positioned(
      top:  _buttonsPositions.positions["jump"]!.top,
      left: _buttonsPositions.positions["jump"]!.left,
      width: _buttonsPositions.positions["jump"]!.width,
      height: _buttonsPositions.positions["jump"]!.height,
      child: MaterialButton(
        onPressed: (){},
        onHighlightChanged: (isHighlighted) {
            if (isHighlighted) {
              jump();
            }else{
              jumpReleased();
            }
          },
          child: Icon(
            size: _buttonsPositions.positions["jump"]!.iconSize,
            Icons.arrow_upward_outlined
          ),
        ),
    );
  }

  Positioned fireButton(){
    return Positioned(
      top:  _buttonsPositions.positions["fire"]!.top,
      left: _buttonsPositions.positions["fire"]!.left,
      width: _buttonsPositions.positions["fire"]!.width,
      height: _buttonsPositions.positions["fire"]!.height,
      child: Visibility(
        visible: _gameController.gameMap.player.isPlayerInFireState(),
        child: MaterialButton(
          onPressed: (){},
          onHighlightChanged: (isHighlighted) {
            if (isHighlighted) {
              fire();
            }
          },
          child: Stack(
            alignment: Alignment.center,
            children: [
              Icon(
                size: _buttonsPositions.positions["fire"]!.iconSize,
                Icons.circle
              ),
              Text( _gameController.gameMap.player.value_1.toString(), style: TextStyle(color: Colors.white, fontSize: _buttonsPositions.positions["fire"]!.iconSize * 3 / 4),),
            ],
          ),
        ),
      )
    );
  }

  Positioned leftWalkButton(){
    return Positioned(
      top:  _buttonsPositions.positions["left_walk"]!.top,
      left: _buttonsPositions.positions["left_walk"]!.left,
      width: _buttonsPositions.positions["left_walk"]!.width,
      height: _buttonsPositions.positions["left_walk"]!.height,
      child: MaterialButton(
        onPressed: (){}, 
        onHighlightChanged: (isHighlighted) {
          if (!isHighlighted) {
            moveLeftReleased();
            _leftTapDown = false;
            if(_rightTapDown){
              walkingMode();
              moveRight();
            }
          }else{
            moveRightReleased();
            walkingMode();
            moveLeft();
            _leftTapDown = true;
          }
        },
        child: Icon(
          size: _buttonsPositions.positions["left_walk"]!.iconSize,
          Icons.arrow_back
        ),
      ),
    );
  }

  Positioned leftSprintButton(){
    return Positioned(
      top:  _buttonsPositions.positions["left_sprint"]!.top,
      left: _buttonsPositions.positions["left_sprint"]!.left,
      width: _buttonsPositions.positions["left_sprint"]!.width,
      height: _buttonsPositions.positions["left_sprint"]!.height,
      child: MaterialButton(
        onPressed: (){}, 
        onHighlightChanged: (isHighlighted) {
          if (!isHighlighted) {
            moveLeftReleased();
            _leftTapDown = false;
            if(_rightTapDown){
              walkingMode();
              moveRight();
            }
          }else{
            moveRightReleased();
            sprintMode();
            moveLeft();
            _leftTapDown = true;
          }
        },
        child: Icon(
          size: _buttonsPositions.positions["left_sprint"]!.iconSize,
          Icons.keyboard_double_arrow_left
        ),
      ),
    );
  }

  Positioned rightWalkButton(){
    return Positioned(
      top:  _buttonsPositions.positions["right_walk"]!.top,
      left: _buttonsPositions.positions["right_walk"]!.left,
      width: _buttonsPositions.positions["right_walk"]!.width,
      height: _buttonsPositions.positions["right_walk"]!.height,
      child: MaterialButton(
        onPressed: (){}, 
        onHighlightChanged: (isHighlighted) {
          if (!isHighlighted) {
            moveRightReleased();
            _rightTapDown = false;
            if(_leftTapDown){
              walkingMode();
              moveLeft();
            }
          }else{
            moveLeftReleased();
            walkingMode();
            moveRight();
            _rightTapDown = true;
          }
        },
        child: Icon(
          size: _buttonsPositions.positions["right_walk"]!.iconSize,
          Icons.arrow_forward
        ),
      ),
    );
  }

  Positioned rightSprintButton(){
    return Positioned(
      top:  _buttonsPositions.positions["right_sprint"]!.top,
      left: _buttonsPositions.positions["right_sprint"]!.left,
      width: _buttonsPositions.positions["right_sprint"]!.width,
      height: _buttonsPositions.positions["right_sprint"]!.height,
      child: MaterialButton(
        onPressed: (){}, 
        onHighlightChanged: (isHighlighted) {
          if (!isHighlighted) {
            moveRightReleased();
            _rightTapDown = false;
            if(_leftTapDown){
              moveLeftReleased();
              walkingMode();
              moveLeft();
            }
          }else{
            sprintMode();
            moveRight();
            _rightTapDown = true;
          }
        },
        child: Icon(
          size: _buttonsPositions.positions["right_sprint"]!.iconSize,
          Icons.keyboard_double_arrow_right
        ),
      ),
    );
  }

  Positioned mapBuilder1(){
    return Positioned(
      top: 0,
      width: 300,
      left: 0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          onChanged:(value) {
            mapAsString = value;
          },
          controller: TextEditingController(text:  mapAsString),
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Enter text',
          ),
          maxLines: null,
        ),
      ),
    );
  }

  Positioned mapBuilder2(){
    return Positioned(
      top: 0,
      right: 0,
      child: 
        Column(
          children: [
            ElevatedButton(
              onPressed: (){
                setState(() {
                pause = !pause;
                });
              },
              child: Text("pause/play"),
            ),
            ElevatedButton(
              onPressed: (){
                Level level = TestLevel();
                level.mapTemplate = mapAsString.split('\n');
                _gameController.level = level;
                restartGame();
              },
              child: Text("apply changes"),
            ),
          ],
        ), 
    );
  }

  Visibility endGameAlert(){
    return Visibility (
      visible: _gameOver,
      child:Center(
        child: AlertDialog(
          title: Stack(
            children: [
              Text("Game Over\n"),
              Positioned(
                top: 0,
                right: 1,
                child: ElevatedButton(
                  onPressed: () {

                    String text = kSiteName;
                    if(_gameController.level.isUsingDailyLevel()){
                      DateTime now = DateTime.now();
                      String formattedDate = DateFormat('yyyy-MM-dd').format(now);
                      text += " ${formattedDate}";
                    }
                    text += "\ndistance: ${_gameController.distanceTraveled}\ntime: ${(_duration / 20).toStringAsFixed(2)}";
                    text += "\n\n🟦🟦🟦🟦🟦\n🟦🟦🟦⬜🟦\n🟥🟦🟨🟦🟦\n🟩🟩🟦⚫🟦\n🟩🟩🟩🟩🟩";
                    text += "\n${kWebUrl}";
                    Share.share(text);

                    // Copy the text to the clipboard
                    Clipboard.setData(ClipboardData(text: text));

                    // Show a toast notification
                    // Fluttertoast.showToast(
                    //   msg: 'copied to clipboard',
                    //   toastLength: Toast.LENGTH_SHORT,
                    //   gravity: ToastGravity.BOTTOM,
                    //   backgroundColor: Colors.black.withOpacity(0.8),
                    //   textColor: Colors.white,
                    // );

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('copied to clipboard')),
                    );
                  },
                    child: Icon(Icons.share),
                  // child: Icon(Icons.share, size: size.height < size.width ? 20 : size.width / 30,),
                ),
              ),
            ],
          ),
          content: Stack(
            children: [

              Text("${_level.finished ? "${_level.endingText} \nDistance Travelled: ${_gameController.distanceTraveled}\nTime: ${(_duration / 20).toStringAsFixed(2)}" : "${_gameController.gameOverText} \nDistance Travelled: ${_gameController.distanceTraveled}"}\n\nClick the share button at the top to share your results!"),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                
                restartGame(startGame: true);
              },
              child: Text("Restart"), //, style: TextStyle(fontSize: size.height < size.width ? 20 : size.width / 20),),
            ),
            TextButton(
              onPressed: (){
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePage(title: "Monster Maze", initialOpen: false,)),
                );
              },
              child: Text("Main Menu"), //, style: TextStyle(fontSize: size.height < size.width ? 20 : size.width / 20),)
            ),
            
          ],
        )
      ),
    );
  }

  Visibility menuAlert(){
    return Visibility (
      visible: _menuPressed,
      child:Center(
        child: AlertDialog(
          title: const Text("Menu"),
          content: IntrinsicHeight(
            child:Column(
              children: [

                TextButton(
                  onPressed: () {
                    restartGame();
                  },
                  child: const Text("Restart Game"),
                ),
                TextButton(
                  onPressed: (){
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const MyHomePage(title: "Monster Maze", initialOpen: false,)),
                    );
                  },
                  child: const Text("Return to main menu"),
                ),
              ],             
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _menuPressed = false;
                  _gameController.gameStarted = true;
                });
              },
              child: const Text("Ok"),
            ),
          ],
        )
      ),
    );
  }

  Visibility welcomeAlert(){
    return Visibility (
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
                  _gameController.gameStarted = true;
                });
              },
              child: const Text("Lets Play!"),
            ),
          ],
        )
      ),
    );
  }

  Visibility aboutGameAlert(){
    return 
      Visibility (
        visible: _showAboutGame,
        child: Center(
          child: AlertDialog(
            title: const Text("About"),
            content: RichText(
            text: getAboutInfo(),
          ),
            actions: [
              ElevatedButton(
                onPressed: 
                () {
                  setState(() {
                    _showAboutGame = false;
                  });
                },
                child: const Text("Ok"),
              ),
            ],
          )
        ),
      );
  }
}