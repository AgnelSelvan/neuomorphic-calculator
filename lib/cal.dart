import 'package:calculator/constants/constants.dart';
import 'package:calculator/widgets/custom_button.dart';
import 'package:calculator/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class Calculator extends StatefulWidget {
  Calculator({Key key}) : super(key: key);

  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  bool isPressed = false;
  String output = "0";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFe8ecf0),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 100,
                margin: EdgeInsets.only(bottom: 30),
                child: ListView(
                  reverse: true,
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 18.0),
                      child: CustomText(
                        text: output,
                        fontWeight: FontWeight.w300,
                        fontSize: 80,
                      ),
                    ),
                  ],
                ),
              ),
              buildButtons()
            ],
          ),
        ),
      ),
    );
  }

  bool isNumeric(String no) {
    try {
      double.parse(no);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  double a = 0;
  double b = 0;
  String operand = "";

  String _result = "0";
  handleCalculation(String val) {
    setState(() {
      if (val == "AC") {
        setState(() {
          output = "0";
          val = "";
          operand = "";
          a = 0;
          b = 0;
          _result = "0";
          print(_result);
        });
      }
      if (val == "+" || val == "X" || val == "÷" || val == '-') {
        setState(() {
          a = double.parse(_result);
          _result = "0";
          output = "0";
          operand = val;
        });
      } else if(val == "C"){
        _result = _result.substring(0, _result.length-1);
        output = _result;
      } else if (val == ".") {
        if (_result.contains("."))
          return;
        else
          setState(() {
            _result = _result + val;
            output = _result;
          });
        print(_result);
      } else if (val == "=") {
        b = double.parse(_result);
        if (operand == "+")
          setState(() {
            output = (a + b).toString();
          });
        else if (operand == "-")
          setState(() {
            output = (a - b).toString();
          });
        else if (operand == "X")
          setState(() {
            output = (a * b).toString();
          });
        else if (operand == "÷")
          setState(() {
            output = (a / b).toString();
          });
      } else {
        setState(() {
          _result = _result + val;
          output = _result;
        });
      }
    });
  }

  Column buildButtons() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            NeuCalButton(
              text: "AC",
              isDouble: false,
              onTap: () {
                handleCalculation("AC");
              },
            ),
            NeuCalButton(
              text: "X",
              isDouble: false,
              textColor: Constants.orangeColor,
              textSize: 28,
              onTap: () {
                handleCalculation("X");
              },
            ),
            NeuCalButton(
                text: "÷",
                isDouble: false,
                textColor: Constants.orangeColor,
                onTap: () {
                  handleCalculation("÷");
                }),
            NeuCalButton(
                text: "C",
                textSize: 28,
                isDouble: false,
                onTap: () {
                  handleCalculation("C");
                }),
          ],
        ),
        SizedBox(height: 7),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            NeuCalButton(
                text: "9",
                isDouble: false,
                onTap: () {
                  handleCalculation("9");
                }),
            NeuCalButton(
                text: "8",
                isDouble: false,
                onTap: () {
                  handleCalculation("8");
                }),
            NeuCalButton(
                text: "7",
                isDouble: false,
                onTap: () {
                  handleCalculation("7");
                }),
            NeuCalButton(
              text: "-",
              textColor: Constants.orangeColor,
              onTap: () {
                handleCalculation("-");
              },
              textSize: 24,
              isDouble: false,
            ),
          ],
        ),
        SizedBox(height: 7),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            NeuCalButton(
              text: "6",
              isDouble: false,
              onTap: () {
                handleCalculation("6");
              },
            ),
            NeuCalButton(
              text: "5",
              isDouble: false,
              onTap: () {
                handleCalculation("5");
              },
            ),
            NeuCalButton(
              text: "4",
              isDouble: false,
              onTap: () {
                handleCalculation("4");
              },
            ),
            NeuCalButton(
              text: "+",
              textColor: Constants.orangeColor,
              textSize: 45,
              isDouble: false,
              onTap: () {
                handleCalculation("+");
              },
            ),
          ],
        ),
        SizedBox(height: 7),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            NeuCalButton(
              text: "1",
              isDouble: false,
              onTap: () {
                handleCalculation("1");
              },
            ),
            NeuCalButton(
              text: "2",
              isDouble: false,
              onTap: () {
                handleCalculation("2");
              },
            ),
            NeuCalButton(
              text: "3",
              isDouble: false,
              onTap: () {
                handleCalculation("3");
              },
            ),
            NeuCalButton(
              text: ".",
              isDouble: false,
              onTap: () {
                handleCalculation(".");
              },
            ),
          ],
        ),
        SizedBox(height: 7),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            NeuCalButton(
              text: "0",
              isDouble: true,
              onTap: () {
                handleCalculation("0");
              },
            ),
            NeuCalButton(
              text: "=",
              textColor: Constants.orangeColor,
              textSize: 45,
              isDouble: true,
              onTap: () {
                handleCalculation("=");
              },
            ),
          ],
        ),
      ],
    );
  }
}
