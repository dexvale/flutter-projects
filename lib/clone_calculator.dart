import 'package:flutter/material.dart';

void main(){
runApp(const CalculatorApp());
}


class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: CalculatorScreen(),

    );
  }
}


class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {

  String _outPut = "0.0";
  String _currentInput = "";
  double num1 = 0;
  double num2 = 0;
  String operand = "";

  void buttonPressed(String buttonText){
    switch(buttonText){
      case "CLEAR":
        _currentInput = "";
        num1 = 0;
        num2 = 0;
        operand = "";
        _outPut = "0.0";

        case "+" : 
        case "-":
        case "X":
        case "/":
        num1 = double.parse(_outPut);
        operand = buttonText;
        _currentInput = "";

        case ".":
        if(!_currentInput.contains(".")){
          _currentInput = _currentInput + buttonText;

        }

        case "=":
        num2 = double.parse(_outPut);
        
        switch(operand){
          case "+":  
          _currentInput = (num1 + num2).toString();
          case "-":  
          _currentInput = (num1 - num2).toString();
          case "X":  
          _currentInput = (num1 * num2).toString();
          case "/":  
          _currentInput = (num1 / num2).toString();

        }

        num1 = 0;
        num2 = 0;
        operand = "";

        default:
        _currentInput = _currentInput + buttonText;


    }

    setState(() {
      if (buttonText == "=") {
         _outPut = double.parse(_currentInput).toStringAsFixed(2).replaceAll(RegExp(r"([.]*0)(?!.*\d)"), "");
      } else {
         _outPut = _currentInput.isEmpty ? "0" : _currentInput;
      }
    });

  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator'),  
      ),
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
            child: Text(
              _outPut,
              style: TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          const Expanded(
            child: Divider(),
          ),
          Column(
            children: [
              Row(
                children: [
                  buildButton("7"),
                  buildButton("8"),
                  buildButton("9"),
                  buildButton("/"),
                ],
              ),
               Row(
                children: [
                  buildButton("4"),
                  buildButton("5"),
                  buildButton("6"),
                  buildButton("X"),
                ],
              ),
              Row(
                children: [
                  buildButton("1"),
                  buildButton("2"),
                  buildButton("3"),
                  buildButton("-"),
                ],
              ),
              Row(
                children: [
                  buildButton("."),
                  buildButton("0"),
                  buildButton("CLEAR"),
                  buildButton("+"),
                ],
              ),
              Row(
                children: [
                  buildButton("=")
                ],
              )
            ],
          )
        ],
      ),
    );
  }


Widget buildButton(String buttontext){
return Expanded(
child: Padding(
  padding: EdgeInsets.all(2.0),
  child: ElevatedButton(
    style: ElevatedButton.styleFrom(
      padding: const EdgeInsets.all(24.0),
      backgroundColor: Colors.grey[850],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0)
      )
    ),
    child: Text(
      buttontext,
      style: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
    ),
    onPressed: () {
      buttonPressed(buttontext);
    },
  ),
),
);
}

}


