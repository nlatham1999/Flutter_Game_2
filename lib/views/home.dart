import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:my_app/models/level.dart';
import 'package:my_app/models/level1.dart';
import 'package:my_app/views/gamecontext.dart';
import 'package:my_app/views/gamescreen.dart';
import 'package:my_app/views/utils/viewutils.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/basicmap.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title, required this.initialOpen});

  final String title;
  final bool initialOpen;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {
  
  bool _showAboutGame = false;
  bool _initialLoad = true;
  Level sampleLevel = Level();
  late BasicMap sampleMap;
  Size size = MediaQueryData.fromWindow(WidgetsBinding.instance.window).size;
  late int numSampleCells;
  
  @override
  void initState() {
    super.initState();
    sampleMap = BasicMap(mapTemplate: sampleLevel.mapTemplate);
    numSampleCells = size.width ~/ 32;
  }

  int getLevel(){
    var gamecontext = context.read<GameContext>();
    return gamecontext.level;
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Stack(
          
          children: [
            Stack(
              children: ViewUtils.getMapScreen(sampleMap.map, 32, 32, 0, size.height - (512), 0, numSampleCells * 4, numCellsToDisplay: numSampleCells),
            ),
            Stack(
              children: [
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
                  top: size.height / 8,
                  left: size.width / 4,
                  child: Visibility(
                    visible: getLevel() >= 0,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => GameScreen(level: Level1(),)),
                        );
                      },
                      child: const Text("Level 1", style: TextStyle(color: Colors.white),),
                    )
                  ),
                ),
                Positioned(
                  top: size.height * 2 / 8,
                  left: size.width / 4,
                  child: Visibility(
                    visible: getLevel() >= 1,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => GameScreen(level: Level1(),)),
                        );
                      },
                      child: const Text("Level 2", style: TextStyle(color: Colors.white),),
                    )
                  ),
                ),
              ],
            ),
            Visibility (
              visible: widget.initialOpen && _initialLoad,
              child:Center(
                child: AlertDialog(
                  title: const Text("Welcome"),
                  content: const Text("Welcome to cube world. In this game you are a small red cube and your goal is to make it to the end of the map.\n \nFor controls you have buttons to go left, right, and to jump.\n\nYou will encounter different dangerous elements in your journey.",),
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
  }
}