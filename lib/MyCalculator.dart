// ignore_for_file: dead_code, deprecated_member_use, file_names

import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class MyCalculator extends StatefulWidget {
  const MyCalculator({Key? key}) : super(key: key);

  @override
  State<MyCalculator> createState() => _MyCalculatorState();
}

class _MyCalculatorState extends State<MyCalculator> {
  String equation = "0";
  String expression = "0";
  String result = "0";
  double equationtext = 38.0;
  double resulttext = 48.0;

  buttonpressed(String buttonText) {
    setState(
      () {
        if (buttonText == "C") {
          equation = "0";
          result = "0";
          equationtext = 38.0;
          resulttext = 48.0;
        } else if (buttonText == "x") {
          equationtext = 48.0;
          resulttext = 38.0;
          equation = equation.substring(0, equation.length - 1);
          if (equation == "") {
            equation = "0";
          }
        } else if (buttonText == "=") {
          equationtext = 38.0;
          resulttext = 48.0;
          expression = equation;
          expression = expression.replaceAll('x', '*');
          try {
            Parser p = Parser();
            Expression exp = p.parse(expression);
            ContextModel cm = ContextModel();
            String answer = '${exp.evaluate(EvaluationType.REAL, cm)}';
            if (answer.length >= 3 &&
                (answer
                        .substring(answer.length - 2, answer.length)
                        .compareTo(".0")) ==
                    0) {
              result = answer.substring(0, answer.length - 2);
            } else {
              result = answer;
            }
          } catch (e) {
            result = "ERROR";
          }
        } else {
          equationtext = 48.0;
          resulttext = 38.0;
          if (equation == "0" &&
              (buttonText == "0" ||
                  buttonText == "00" ||
                  buttonText == "*" ||
                  buttonText == "/" ||
                  buttonText == "%" ||
                  buttonText == "+" ||
                  buttonText == "-")) {
            equation = "0";
          } else if (equation == "0") {
            equation = buttonText;
          } else {
            equation += buttonText;
          }
        }
      },
    );
  }

  Widget buildbutton(String buttonText, Color buttoncolor) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      color: buttoncolor,
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7),
          side: const BorderSide(
              color: Colors.white, width: 1, style: BorderStyle.solid),
        ),
        //padding: const EdgeInsets.all(0),
        onPressed: () => buttonpressed(buttonText),
        child: Text(
          buttonText,
          style: const TextStyle(fontSize: 32, color: Colors.white),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculator"),
      ),
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
            //color: Colors.red,
            child: Text(
              equation,
              style: TextStyle(
                fontSize: equationtext,
              ),
            ),
          ),
          Container(
            //height: double.infinity,
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.fromLTRB(10, 30, 10, 0),
            //color: Colors.blue,
            child: Text(
              result,
              style: TextStyle(
                fontSize: resulttext,
              ),
            ),
          ),
          const Expanded(
            child: Divider(),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: MediaQuery.of(context).size.width * 1,
                //width: double.infinity,
                child: Table(
                  children: [
                    TableRow(
                      children: [
                        buildbutton("C", Colors.blueAccent),
                        buildbutton("x", Colors.blueAccent),
                        buildbutton("/", Colors.blueAccent),
                        buildbutton("*", Colors.blueAccent),
                      ],
                    ),
                    TableRow(
                      children: [
                        buildbutton("7", Colors.blueAccent),
                        buildbutton("8", Colors.blueAccent),
                        buildbutton("9", Colors.blueAccent),
                        buildbutton("+", Colors.blueAccent),
                      ],
                    ),
                    TableRow(
                      children: [
                        buildbutton("4", Colors.blueAccent),
                        buildbutton("5", Colors.blueAccent),
                        buildbutton("6", Colors.blueAccent),
                        buildbutton("-", Colors.blueAccent),
                      ],
                    ),
                    TableRow(
                      children: [
                        buildbutton("1", Colors.blueAccent),
                        buildbutton("2", Colors.blueAccent),
                        buildbutton("3", Colors.blueAccent),
                        buildbutton("%", Colors.blueAccent),
                      ],
                    ),
                    TableRow(
                      children: [
                        buildbutton(".", Colors.blueAccent),
                        buildbutton("0", Colors.blueAccent),
                        buildbutton("00", Colors.blueAccent),
                        buildbutton("=", Colors.blueAccent),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
