import 'package:flutter/material.dart';
import 'widgets/calc_button.dart';

void main() {
  runApp(const CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mini Calculator',
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
  String _display = '0';
  double _num1 = 0;
  double _num2 = 0;
  String _operand = '';
  bool _shouldResetDisplay =
      false; // Flag to clear the screen for the next fresh number input

  // Core Calculator Logic Engine
  void _buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == 'C') {
        _display = '0';
        _num1 = 0;
        _num2 = 0;
        _operand = '';
        _shouldResetDisplay = false;
      } else if (buttonText == '+' ||
          buttonText == '-' ||
          buttonText == '×' ||
          buttonText == '÷') {
        _num1 = double.parse(_display);
        _operand = buttonText;
        _display = buttonText;
        _shouldResetDisplay = true;
      } else if (buttonText == '=') {
        if (_display == '+' ||
            _display == '-' ||
            _display == '×' ||
            _display == '÷') {
          _num2 = _num1;
        } else {
          _num2 = double.parse(_display);
        }

        switch (_operand) {
          case '+':
            _display = (_num1 + _num2).toString();
            break;
          case '-':
            _display = (_num1 - _num2).toString();
            break;
          case '×':
            _display = (_num1 * _num2).toString();
            break;
          case '÷':
            _display = _num2 != 0 ? (_num1 / _num2).toString() : 'Error';
            break;
        }
        _operand = '';
        _shouldResetDisplay =
            true; // Allows typing a completely fresh number after the result
      } else {
        // Handling standard number inputs
        if (_display == '0' || _display == 'Error' || _shouldResetDisplay) {
          _display = buttonText;
          _shouldResetDisplay = false;
        } else {
          _display += buttonText;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('MiniCalculator')),
      body: Column(
        children: [
          // 1. Display Screen Area
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              padding: const EdgeInsets.all(24),
              child: Text(
                _display,
                style: const TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          // 2. Keypad Area
          Column(
            children: [
              Row(
                children: [
                  CalcButton(
                    text: '7',
                    color: const Color.fromARGB(255, 158, 158, 158)!,
                    onPressed: () => _buttonPressed('7'),
                  ),
                  CalcButton(
                    text: '8',
                    color: Colors.grey!,
                    onPressed: () => _buttonPressed('8'),
                  ),
                  CalcButton(
                    text: '9',
                    color: Colors.grey!,
                    onPressed: () => _buttonPressed('9'),
                  ),
                  CalcButton(
                    text: '÷',
                    color: Colors.orange,
                    onPressed: () => _buttonPressed('÷'),
                  ),
                ],
              ),
              Row(
                children: [
                  CalcButton(
                    text: '4',
                    color: Colors.grey!,
                    onPressed: () => _buttonPressed('4'),
                  ),
                  CalcButton(
                    text: '5',
                    color: Colors.grey!,
                    onPressed: () => _buttonPressed('5'),
                  ),
                  CalcButton(
                    text: '6',
                    color: Colors.grey!,
                    onPressed: () => _buttonPressed('6'),
                  ),
                  CalcButton(
                    text: '×',
                    color: Colors.orange,
                    onPressed: () => _buttonPressed('×'),
                  ),
                ],
              ),
              Row(
                children: [
                  CalcButton(
                    text: '1',
                    color: Colors.grey!,
                    onPressed: () => _buttonPressed('1'),
                  ),
                  CalcButton(
                    text: '2',
                    color: Colors.grey!,
                    onPressed: () => _buttonPressed('2'),
                  ),
                  CalcButton(
                    text: '3',
                    color: Colors.grey!,
                    onPressed: () => _buttonPressed('3'),
                  ),
                  CalcButton(
                    text: '-',
                    color: Colors.orange,
                    onPressed: () => _buttonPressed('-'),
                  ),
                ],
              ),
              Row(
                children: [
                  CalcButton(
                    text: 'C',
                    color: Colors.redAccent,
                    onPressed: () => _buttonPressed('C'),
                  ),
                  CalcButton(
                    text: '0',
                    color: Colors.grey!,
                    onPressed: () => _buttonPressed('0'),
                  ),
                  CalcButton(
                    text: '=',
                    color: Colors.green,
                    onPressed: () => _buttonPressed('='),
                  ),
                  CalcButton(
                    text: '+',
                    color: Colors.orange,
                    onPressed: () => _buttonPressed('+'),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
