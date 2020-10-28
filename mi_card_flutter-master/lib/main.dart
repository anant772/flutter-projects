import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Colors.teal,
      body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
              radius: 50, backgroundImage: AssetImage('images/anant.png')),
          Text(
            "Anant Agarwal",
            style: TextStyle(
                fontSize: 40,
                color: Colors.white,
                fontFamily: 'Pacifico',
                fontWeight: FontWeight.bold),
          ),
          Text(
            "FLUTTER DEVELOPER",
            style: TextStyle(
                color: Colors.teal[100],
                fontFamily: 'SourceSansPro',
                fontSize: 20,
                letterSpacing: 2.5,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20,
          width: 150,
          child: Divider(
            
            color: Colors.teal[100],),),
          Card(
            margin: EdgeInsets.symmetric(vertical: 10,horizontal: 25),
            child: ListTile(
              leading: Icon(
                Icons.phone,
                    color: Colors.teal,
              ),
              title:  Text ("+91 831 0704 7943",
                  style: TextStyle(
                    color: Colors.teal[800],
                    fontSize: 20,
                    fontFamily: "SourceSansPro"
                   ),),)
          ),
          Card(
            margin: EdgeInsets.symmetric(vertical: 10,horizontal: 25),
            child: ListTile(
              leading: Icon(
                Icons.email,
                    color: Colors.teal,
              ),
              title:  Text ("anantagarwal772@gmail.com",
                  style: TextStyle(
                    color: Colors.teal[800],
                    fontSize: 18,
                    fontFamily: "SourceSansPro"
                   ),),)
          )
        ],
      )),
    ));
  }
}
