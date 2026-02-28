import 'package:flutter/material.dart';

void main() {
  runApp(const CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _output = "0";
  String _currentInput = "";
  double num1 = 0;
  double num2 = 0;
  String operand = "";

  // Logic to handle button presses
  void buttonPressed(String buttonText) {
    if (buttonText == "CLEAR") {
      _currentInput = "";
      num1 = 0;
      num2 = 0;
      operand = "";
      _output = "0";
    } else if (buttonText == "+" || buttonText == "-" || buttonText == "/" || buttonText == "X") {
      num1 = double.parse(_output);
      operand = buttonText;
      _currentInput = "";
    } else if (buttonText == ".") {
      if (_currentInput.contains(".")) {
        return; 
      } else {
        _currentInput = _currentInput + buttonText;
      }
    } else if (buttonText == "=") {
      num2 = double.parse(_output);

      if (operand == "+") {
        _currentInput = (num1 + num2).toString();
      }
      if (operand == "-") {
        _currentInput = (num1 - num2).toString();
      }
      if (operand == "X") {
        _currentInput = (num1 * num2).toString();
      }
      if (operand == "/") {
        _currentInput = (num1 / num2).toString();
      }

      num1 = 0;
      num2 = 0;
      operand = "";
    } else {
      _currentInput = _currentInput + buttonText;
    }

    // Update the UI
    setState(() {
      // Remove trailing decimals for whole numbers
      if (buttonText == "=") {
         _output = double.parse(_currentInput).toStringAsFixed(2).replaceAll(RegExp(r"([.]*0)(?!.*\d)"), "");
      } else {
         _output = _currentInput.isEmpty ? "0" : _currentInput;
      }
    });
  }

  // A helper method to create standard calculator buttons
  Widget buildButton(String buttonText) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(24.0),
            backgroundColor: Colors.grey[850],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            )
          ),
          onPressed: () => buttonPressed(buttonText),
          child: Text(
            buttonText,
            style: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator'),
      ),
      body: Column(
        children: <Widget>[
          // Display Area
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
            child: Text(
              _output,
              style: const TextStyle(
                fontSize: 48.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Expanded(
            child: Divider(),
          ),
          // Keypad Area
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
                  buildButton("="),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}