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
        title: Text("Dice Roll"),
        backgroundColor: Colors.amber,
      ),
      body: Row(
          children: <Widget>[
          TextButton(
          onPressed: (){
            setState(() {
            diceNumber1 = Random().nextInt(6) + 1;
            });
            },
          child: Image.asset("images/dice-$diceNumber1.png"),
        ),
        TextButton(
            onPressed: (){
            setState(() {
            diceNumber2 = Random().nextInt(6) + 1;
            });
            },
          child: Image.asset("images/dice-$diceNumber2.png"),
        ),
        Text("$diceNumber1 + $diceNumber2 = ${diceNumber1 + diceNumber2}", style: TextStyle(fontSize: 20),)
        ],
      ),  
    );
  }
}