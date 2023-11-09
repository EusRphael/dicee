import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: const Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body:  const DicePage(),
      ),
    ),
  );
}
class DicePage extends StatefulWidget {
  const DicePage({super.key});

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int left = 1 , right = 1;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.red,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextButton(
                          onPressed: (){
                            setState((){
                              ChangeValue();
                            });
                          },
                          child: Image.asset('Images/dice$left.png')),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextButton(
                          onPressed: (){
                            setState((){
                              ChangeValue();
                            });
                          },
                          child: Image.asset('Images/dice$right.png')),
                    ),
                  ),
                ]),
            Text(
                style: const TextStyle(
                  fontSize: 20,
                  height: 2.0,
                  color: Colors.black,
                ),
                left > right
                    ? 'Left Dice rolls higher'
                    :left < right
                    ? 'Right Dice rolls higher'
                    :left == right
                    ? 'Dice roll are equal': 'Dice roll are equal'),
            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: Text(('The total roll is ${left+right}'),
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );

  }

  void ChangeValue(){
    right = 1 + Random().nextInt(6);
    left = 1 + Random().nextInt(6);
  }
}

