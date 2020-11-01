import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int n1, n2;
  var sum;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator"),
        backgroundColor: Colors.blueGrey[900],
      ),
      body: Container(
        color: Colors.blueGrey[400],
        padding: EdgeInsets.all(40.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Output : $sum",
                style: TextStyle(
                  color: Colors.blueGrey[900],
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextField(
                onChanged: (value) {
                  n1 = int.parse(value);
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Enter a Number",
                  hintStyle:
                      TextStyle(color: Colors.blueGrey[900], fontSize: 18),
                ),
              ),
              TextField(
                onChanged: (value) {
                  n2 = int.parse(value);
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: "Enter a Number",
                    hintStyle:
                        TextStyle(color: Colors.blueGrey[900], fontSize: 18)),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Button("+", () {
                      setState(() {
                        sum = n1 + n2;
                      });
                    }),
                    Button("-", () {
                      setState(() {
                        sum = n1 - n2;
                      });
                    }),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Button("*", () {
                      setState(() {
                        sum = n1 * n2;
                      });
                    }),
                    Button("/", () {
                      setState(() {
                        sum = n1 / n2;
                      });
                    }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Button extends StatelessWidget {
  final String text;
  final Function onpress;
  Button(this.text, this.onpress);
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      child: Text(
        text,
        style: TextStyle(color: Colors.white),
      ),
      color: Colors.blueGrey[900],
      onPressed: onpress,
    );
  }
}
