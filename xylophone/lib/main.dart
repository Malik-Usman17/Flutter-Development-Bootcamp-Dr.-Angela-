import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  const XylophoneApp({Key? key}) : super(key: key);

  void playSound(int number) {
    final player = AudioCache();
    player.play('note$number.wav');
  }

  Expanded buildKey({required Color color, required int soundNumber}) {
    return Expanded(
      child: TextButton(
        child: Text('Click Me'),
        onPressed: () {
          playSound(soundNumber);
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(color),
        ),
      ),
    );
  }

  Expanded myButton({required Color color, required int soundNumber}) {
    return Expanded(
      child: ElevatedButton(
        child: Container(),
        onPressed: () {
          playSound(soundNumber);
        },
        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(color)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.max,
            children: [
              myButton(color: Colors.red, soundNumber: 1),
              myButton(color: Colors.yellow, soundNumber: 2),
              myButton(color: Colors.orange, soundNumber: 3),
              myButton(color: Colors.green, soundNumber: 4),
              myButton(color: Colors.teal, soundNumber: 5),
              myButton(color: Colors.blue, soundNumber: 6),
              myButton(color: Colors.purple, soundNumber: 7)

              // Expanded(
              //   child: ElevatedButton(
              //     onPressed: () {
              //       playSound(4);
              //     },
              //     style: ButtonStyle(
              //         backgroundColor: MaterialStateProperty.all(Colors.teal),
              //         padding: MaterialStateProperty.all(0.0)),
              //     child: Container(
              //         //color: Colors.amber,
              //         //padding: EdgeInsetsGeometry.,
              //         ),
              //   ),
              // ),

              // Expanded(
              //   child: TextButton(
              //     style: ButtonStyle(
              //       backgroundColor: MaterialStateProperty.all(Colors.red),
              //     ),
              //     onPressed: () {
              //       playSound(1);
              //     },
              //     child: Text('Click Me'),
              //   ),
              // ),

              // buildKey(color: Colors.red, soundNumber: 1),
            ],
          ),
        ),
      ),
    );
  }
}
