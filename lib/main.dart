import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _output = "0";
  String output = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";

  void clear() {
    setState(() {
      _output = "0";
    });
    num1 = 0.0;
    num2 = 0.0;
    operand = "";
  }

  void _buttonPressed(String buttonText) {
    if (buttonText == "CLEAR") {
      clear();
    } else if (buttonText == "X" ||
        buttonText == "/" ||
        buttonText == "+" ||
        buttonText == "-") {
      num1 = double.parse(_output);
      operand = buttonText;
      _output = "0";
    } else if (buttonText == ".") {
      if (_output.contains('.')) {
        Scaffold.of(context).showSnackBar(
          SnackBar(
            content: Text("Already contain decimal"),
          ),
        );
      } else {
        _output += ".";
      }
    } else if (buttonText == "=") {
      num2 = double.parse(_output);
      print(num1);
      print(operand);
      print(num2);
      if (operand == "+") {
        _output = (num1 + num2).toString();
      } else if (operand == "-") {
        _output = (num1 - num2).toString();
      } else if (operand == "X") {
        _output = (num1 * num2).toString();
      } else if (operand == "/") {
        _output = (num1 / num2).toString();
      }

      num1 = 0;
      num2 = 0;
      operand = "";
    } else {
      if (_output == "0") {
        _output = buttonText;
      } else {
        _output = _output + buttonText;
      }
    }
    setState(() {
      output = _output;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(
                vertical: 24,
                horizontal: 12,
              ),
              child: new Text(
                output,
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: Divider(),
            ),
            Column(
              children: <Widget>[
                new Row(children: [
                  buildButton("7"),
                  buildButton("8"),
                  buildButton("9"),
                  buildButton("/")
                ]),
                new Row(children: [
                  buildButton("4"),
                  buildButton("5"),
                  buildButton("6"),
                  buildButton("X")
                ]),
                new Row(children: [
                  buildButton("1"),
                  buildButton("2"),
                  buildButton("3"),
                  buildButton("-")
                ]),
                new Row(children: [
                  buildButton("."),
                  buildButton("0"),
                  buildButton("00"),
                  buildButton("+")
                ]),
                new Row(children: [
                  buildButton("CLEAR"),
                  buildButton("="),
                ]),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buildButton(String buttonText) {
    return new Expanded(
      child: new OutlineButton(
        padding: new EdgeInsets.all(24.0),
        child: new Text(
          buttonText,
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        onPressed: () => _buttonPressed(buttonText),
        // buttonPressed(buttonText)
      ),
    );
  }
}
