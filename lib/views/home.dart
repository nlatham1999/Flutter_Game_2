import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:my_app/models/level.dart';
import 'package:my_app/models/level1.dart';
import 'package:my_app/views/gamecontext.dart';
import 'package:my_app/views/gamescreen.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';


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
  Size size = MediaQueryData.fromWindow(WidgetsBinding.instance.window).size;

  int getLevel(){
    var gamecontext = context.read<GameContext>();
    return gamecontext.level;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
          actions: [
            MaterialButton(
              highlightColor: Colors.transparent,
              child: const Icon(Icons.info_outline, color: Colors.white), 
              onPressed: () { setState(() {
                _showAboutGame = true;
              });},
            ),
          ],
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Visibility(
              visible: getLevel() >= 0,
              child: TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => GameScreen(level: Level1(),)),
                  );
                },
                child: const Text("Level 1"),
              )
            ),
            Visibility(
              visible: getLevel() >= 1,
              child: TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => GameScreen(level: Level1())),
                  );
                },
                child: const Text("Level 2"),
              )
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
      ),
    );
  }
}