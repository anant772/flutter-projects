import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  void playsound(int a) {
    final player = AudioCache();
    player.play('note$a.wav');
  }
  Expanded buildkey({Color color,int a}){
    return Expanded(
                child: FlatButton(
                  color: color,
                  onPressed: () {
                    playsound(a);
                  },
                  child: null,
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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildkey(color: Colors.red,a :1),
              buildkey(color: Colors.orange,a :2),
              buildkey(color: Colors.yellow,a :3),
              buildkey(color: Colors.green,a :4),
              buildkey(color: Colors.teal,a :5),
              buildkey(color: Colors.blue,a :6),
              buildkey(color: Colors.purple,a :7),
            ],
          ),
        ),
      ),
    );
  }
}
