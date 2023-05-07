import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';

class SecondRoute extends StatefulWidget {
  const SecondRoute({super.key});
  
  @override
  State<StatefulWidget> createState() => _MemoryGame();
}

class _MemoryCard {
  String face;
  bool isFaceUp;
  int x;
  int y;
  bool isMatched = false;

  _MemoryCard({
    required this.face, 
    required this.isFaceUp,
    required this.x,
    required this.y
  });
}

class _Coordinates {
  int x;
  int y;

  _Coordinates({
    required this.x,
    required this.y
  });
}

class _MemoryGame extends State<SecondRoute> {

  int columns = 4;
  int rows = 5;
  String scoreMessage = "score: ";
  String messageToDisplay = "";
  List buttonArray = [];
  int turn = 0;
  int matches = 0;
  int score = 0;

  _Coordinates first = _Coordinates(x: 0, y: 0);
  _Coordinates second = _Coordinates(x: 0, y: 0);

  @override
  void initState() {
    super.initState();
    buttonArray = buildButtonArray(columns, rows);
  }

  void onCardCLick(_MemoryCard card){
    setState(() {
      if(card.isFaceUp){
        messageToDisplay = "You already selected this card";
        return;
      }

      if(card.isMatched){
        messageToDisplay = "This card is already matched";
        return;
      }

      card.isFaceUp = true;
      buttonArray[card.y][card.x] = card;

      turn++;
      switch(turn){
        case 1:
          first = _Coordinates(x: card.x, y: card.y);
          break;
        case 2:
          second = _Coordinates(x: card.x, y: card.y);
          break;
      }
    });

    if(turn == 2){
      Future.delayed(Duration(milliseconds: 500), () {
        setState(() {
          turn = 0;
          score++;
          scoreMessage = "Score: " + score.toString();
          _MemoryCard firstCard = buttonArray[first.y][first.x];
          _MemoryCard secondCard = buttonArray[second.y][second.x];
          if(firstCard.face == secondCard.face){
            firstCard.isMatched = true;
            secondCard.isMatched = true;
            matches += 2;
            if(matches >= columns * rows){
              messageToDisplay = "GAME OVER";
            }
          }
          firstCard.isFaceUp = false;
          secondCard.isFaceUp = false;
          buttonArray[first.y][first.x] = firstCard;
          buttonArray[second.y][second.x] = secondCard;
        });
      });
    }
  }

  List buildButtonArray(int numColumns, int numRows){

    int numPairs = (numColumns * numRows / 2).toInt();
    List emojis = ["🐵","🐶","🐺","🐱","🦁","🐯","🦒","🦊","🦝","🐮","🐷","🐗","🐭","🐹","🐰","🐻","🐨","🐼","🐸","🦓","🐴","🦄","🐔","🐲","🐅","🐆","🐎","🦌","🦏","🦛","🐂","🐃","🐄","🐖","🐏","🐐","🐀","🦔","🐇","🐿","🦎","🐢","🐍","🐊","🦖","🦦"];
    emojis = emojis.sublist(0, numPairs);
    for(int i = 0; i < numPairs; i++){
      emojis.add(emojis[i]);
    }
    
    List buttonArray = [];

    for(int i = 0; i < numRows; i++){
      List row = [];
      for(int j = 0; j < numColumns; j++){
        int randomInt = Random().nextInt(emojis.length);
        String emoji = emojis[randomInt];
        emojis[randomInt] = emojis[emojis.length-1];
        emojis = emojis.sublist(0, emojis.length-1);
        row.add(_MemoryCard(
          face: emoji,
          isFaceUp: false,
          y: i,
          x: j
        ));
      }
      buttonArray.add(row);
    }
    
    return buttonArray;
  }

  Column buildColumns() {

    return Column(
      children: [
        for(List list in buttonArray)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for(_MemoryCard b in list)
                Container(
                  margin: const EdgeInsets.only(left: 5, right: 5),
                  child: ElevatedButton(
                    onPressed: (){
                      onCardCLick(b);
                    }, 
                    child: Text( 
                      b.isMatched ? "✅" : (b.isFaceUp ? b.face : ""),
                      style: const TextStyle(
                        fontSize: 24.0, // Change the font size to 24.0
                      ),
                    )
                  )
                )
                
            ],
          ),
      ],
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Memory'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(scoreMessage, 
              style: const TextStyle(
                fontSize: 24.0, // Change the font size to 24.0
              ),
            ),
            Text(messageToDisplay,
              style: const TextStyle(
                fontSize: 24.0, // Change the font size to 24.0
              ),
            ),
            buildColumns(),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Go back!'),
            ),

          ],
        )
      ),
    );
  }
}