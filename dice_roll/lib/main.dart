import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const DiceRollMain());
}
// MaterialApp Widget
class DiceRollMain extends StatelessWidget {
  const DiceRollMain({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: DiceRoll(),
    );
  }
}
// End MaterialApp
class DiceRoll extends StatefulWidget {
  const DiceRoll({super.key});

  @override
  State<DiceRoll> createState() => _DiceRollState();
}


class _DiceRollState extends State<DiceRoll> {
  int diceNumber1 = 1;
  int diceNumber2 = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Dice Roll",
        style: TextStyle(
          color: Colors.white,
          fontSize: 30,
          fontWeight: FontWeight.bold,
          ),
      ),
        backgroundColor: Colors.amber,
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
          TextButton(
          onPressed: (){
            setState(() {
            diceNumber1 = Random().nextInt(6) + 1;
            });
            },
          child: Image.asset("images/dice-$diceNumber1.png", width: 100,),
        ),
        TextButton(
            onPressed: (){
            setState(() {
            diceNumber2 = Random().nextInt(6) + 1;
            });
            },
          child: Image.asset("images/dice-$diceNumber2.png", width: 100),
        ),
        Text("${diceNumber1 + diceNumber2}", style: TextStyle(fontSize: 20),)
        ],
      ),  
    );
  }
}