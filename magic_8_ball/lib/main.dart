import 'package:flutter/material.dart';
import 'dart:math';

// void main() {
//   return runApp(
//     MaterialApp(
//       home: Scaffold(
//         backgroundColor: Colors.blue,
//         appBar: AppBar(
//           title: Text('Ask Me Anything'),
//           backgroundColor: Colors.blue[700],
//         ),
//         body: Magic8Ball(),
//       ),
//     ),
//   );
// }

void main() => runApp(
      MaterialApp(
        home: BallPage(),
      ),
    );

class BallPage extends StatelessWidget {
  const BallPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Ask Me Anything'),
      ),
      //body: Container(),
      body: Ball(),
      backgroundColor: Colors.blue,
    );
  }
}

class Ball extends StatefulWidget {
  const Ball({Key? key}) : super(key: key);

  @override
  _BallState createState() => _BallState();
}

class _BallState extends State<Ball> {
  int ballNumber = 1;

  void changeBall() {
    setState(() {
      ballNumber = Random().nextInt(5) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        child: Image.asset('images/ball$ballNumber.png'),
        onPressed: () {
          changeBall();
        },
      ),
    );
  }
}

// class Magic8Ball extends StatefulWidget {
//   const Magic8Ball({Key? key}) : super(key: key);
//
//   @override
//   _Magic8BallState createState() => _Magic8BallState();
// }
//
// class _Magic8BallState extends State<Magic8Ball> {
//   int imageBall = 1;
//
//   void changeBall() {
//     setState(() {
//       imageBall = Random().nextInt(5) + 1;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         // ElevatedButton(
//         //   onPressed: () {
//         //     changeBall();
//         //   },
//         //   child: Image.asset('images/ball$imageBall.png'),
//         // ),
//         TextButton(
//           onPressed: () {
//             changeBall();
//             print(imageBall);
//           },
//           child: Image.asset('images/ball$imageBall.png'),
//         )
//       ],
//     );
//   }
// }
