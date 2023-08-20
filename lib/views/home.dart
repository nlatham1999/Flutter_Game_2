import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:my_app/constants.dart';
import 'package:my_app/models/level.dart';
import 'package:my_app/models/level1.dart';
import 'package:my_app/models/level2.dart';
import 'package:my_app/models/leveldynamic.dart';
import 'package:my_app/models/testlevel.dart';
import 'package:my_app/views/gamecontext.dart';
import 'package:my_app/views/gamescreen.dart';
import 'package:my_app/views/utils/viewutils.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';
import 'package:intl/intl.dart';


import '../constants.dart';
import '../models/basicmap.dart';
import '../models/level3.dart';
import '../models/level4.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title, required this.initialOpen});

  final String title;
  final bool initialOpen;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {
  
  bool _showAboutGame = false;
  bool _showStats = false;
  bool _initialLoad = true;
  Level sampleLevel = Level();
  late BasicMap sampleMap;
  int _dateNum = 0;
  
  @override
  void initState() {
    
    super.initState();
    sampleMap = BasicMap(mapTemplate: sampleLevel.mapTemplate);
   
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd').format(now);
    _dateNum =  int.parse(formattedDate.replaceAll('-', ''));
  }

  int getLevel(){
    var gamecontext = context.read<GameContext>();
    return gamecontext.level;
  }

  @override
  Widget build(BuildContext context) {
     
    Size size = MediaQueryData.fromWindow(WidgetsBinding.instance.window).size;
    int numSampleCells = size.width ~/ 32;

    return Scaffold(
      backgroundColor: Colors.blue,
      body: Stack(
          
          children: [
            Stack(
              children: ViewUtils.getMapScreen(sampleMap.map, 32, 32, 0, size.height - (512), 0, numSampleCells * kCellSize, numCellsToDisplay: numSampleCells),
            ),
            Stack(
              children: [
                
                Positioned(
                  top: size.height / 15,
                  right: size.width / 20 * 2,
                  width: size.width / 8,
                  child: MaterialButton(
                    highlightColor: Colors.transparent,
                    child: const Icon(Icons.info_outline, color: Colors.white), 
                    onPressed: () { setState(() {
                      _showAboutGame = true;
                    });},
                  ),
                ),
                // Positioned(
                //   top: size.height / 15,
                //   right: size.width / 20 * 5,
                //   width: size.width / 8,
                //   child: MaterialButton(
                //     focusColor: Colors.transparent,
                //     highlightColor: Colors.transparent,
                //     hoverColor: Colors.transparent,
                //     child: const Icon(Icons.bar_chart, color: Colors.white), 
                //     onPressed: () { setState(() {
                //       _showStats = true;
                //     });},
                //   ),
                // ),
                Positioned(
                  top: size.height * 2 / 10,
                  left: size.width / 6,
                  child: ElevatedButton(
                    onPressed: getLevel() >= 0 ? () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => GameScreen(level: LevelDynamic(useSeed: true, seed: _dateNum),)),
                      );
                    } : null,
                    child: const Text("Play Daily Challenge", style: TextStyle(color: Colors.white, fontSize: 20),),
                  )
                ),

                Positioned(
                  top: size.height * 3 / 10,
                  left: size.width / 6,
                  child: ElevatedButton(
                    onPressed: getLevel() >= 0 ? () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => GameScreen(level: LevelDynamic(useSeed: false, seed: 0),)),
                      );
                    } : null,
                    child: const Text("Play Random Game", style: TextStyle(color: Colors.white, fontSize: 20),),
                  )
                ),
                // Positioned(
                //   top: size.height * 3 / 10,
                //   left: size.width / 5,
                //   child: ElevatedButton(
                //     onPressed: getLevel() >= 0 ? () {
                //       Navigator.pushReplacement(
                //         context,
                //         MaterialPageRoute(builder: (context) => GameScreen(level: RandomLevel(),)),
                //       );
                //     } : null,
                //     child: const Text("Random Test", style: TextStyle(color: Colors.white, fontSize: 24),),
                //   )
                // ),
                Positioned(
                  top: size.height * 4 / 10,
                  left: size.width / 6,
                  child: ElevatedButton(
                    onPressed: () { 
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => GameScreen(level: TestLevel(),)),
                      );
                    },
                    child: const Text("Test Level", style: TextStyle(color: Colors.white, fontSize: 20),),
                  )
                ),
              ],
            ),
            Visibility (
              visible: widget.initialOpen && _initialLoad,
              child:Center(
                child: AlertDialog(
                  title: const Text("Welcome"),
                  content: Text("version 1.0.5\nWelcome to cube world. In this game you are a small red cube and your goal is to make it to the end of the map.\n \nFor controls you have buttons to go left, right, sprint, and to jump. \n\nOn a keyboard these are the left/right arrow keys, the space bar to jump, and holding down shift + arrow key to sprint \n\nYou will encounter different dangerous elements in your journey.\n value 1: ${{MediaQuery.of(context).size.height}}\n value 2: ${{size.height}}",),
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
            
        //     Visibility (
        //       visible: _showStats,
        //       child:Center(
        //         child: AlertDialog(
        //           title: const Text("Stats"),
        //           content: getStats(),
        //           actions: [
        //             ElevatedButton(
        //               onPressed: () {
        //                 setState(() {
        //                   _showStats = false;
        //                 });
        //               },
        //               child: const Text("Ok"),
        //             ),
        //           ],
        //         )
        //       ),
        //     ),
          ],
        ),
    );
  }
}