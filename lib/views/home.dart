import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:monster_maze/constants.dart';
import 'package:monster_maze/models/level.dart';
import 'package:monster_maze/models/levels/level1.dart';
import 'package:monster_maze/models/levels/level2.dart';
import 'package:monster_maze/models/leveldynamic.dart';
import 'package:monster_maze/models/levels/monstermadness.dart';
import 'package:monster_maze/models/levels/skyjump.dart';
import 'package:monster_maze/models/levels/spookycave.dart';
import 'package:monster_maze/models/levels/testlevel.dart';
import 'package:monster_maze/views/gamecontext.dart';
import 'package:monster_maze/views/gamescreen.dart';
import 'package:monster_maze/views/utils/aboutinfo.dart';
import 'package:monster_maze/views/utils/homescreenbuttonpositions.dart';
import 'package:monster_maze/views/utils/viewutils.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';
import 'package:intl/intl.dart';


import '../constants.dart';
import '../models/basicmap.dart';
import '../models/levels/level3.dart';
import '../models/levels/level4.dart';


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

    HomeScreenButtonPositions buttonpos = HomeScreenButtonPositions(size);

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
                  top: buttonpos.positions["button_1"]!.top,
                  left: buttonpos.positions["button_1"]!.left,
                  width: buttonpos.positions["button_1"]!.width,
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
                  top: buttonpos.positions["button_2"]!.top,
                  left: buttonpos.positions["button_2"]!.left,
                  width: buttonpos.positions["button_2"]!.width,
                  child: ElevatedButton(
                    onPressed: getLevel() >= 0 ? () {
                      Navigator.push(
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
                  top: buttonpos.positions["button_3"]!.top,
                  left: buttonpos.positions["button_3"]!.left,
                  width: buttonpos.positions["button_3"]!.width,
                  child: ElevatedButton(
                    onPressed: () { 
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => GameScreen(level: SkyJump(),)),
                      );
                    },
                    child: const Text("Sky Jump", style: TextStyle(color: Colors.white, fontSize: 20),),
                  )
                ),
                
                Positioned(
                  top: buttonpos.positions["button_4"]!.top,
                  left: buttonpos.positions["button_4"]!.left,
                  width: buttonpos.positions["button_4"]!.width,
                  child: ElevatedButton(
                    onPressed: () { 
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => GameScreen(level: SpookyCave(),)),
                      );
                    },
                    child: const Text("The Spooooky Cave", style: TextStyle(color: Colors.white, fontSize: 20),),
                  )
                ),
                
                Positioned(
                  top: buttonpos.positions["button_5"]!.top,
                  left: buttonpos.positions["button_5"]!.left,
                  width: buttonpos.positions["button_5"]!.width,
                  child: ElevatedButton(
                    onPressed: () { 
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => GameScreen(level: MonsterMadness(),)),
                      );
                    },
                    child: const Text("Monster Madness", style: TextStyle(color: Colors.white, fontSize: 20),),
                  )
                ),
              ],
            ),
            Visibility (
              visible: widget.initialOpen && _initialLoad,
              child:Center(
                child: AlertDialog(
                  title: const Text("Welcome"),
                  content: const Text(kStartText,),
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