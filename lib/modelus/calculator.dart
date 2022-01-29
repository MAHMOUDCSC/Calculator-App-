import 'package:flutter/material.dart';
import 'package:flutter_application_1/shared/components/components.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _Calculator();
}

// ignore: camel_case_types
class _Calculator extends State<Calculator> {
  final String title = ' Calculator';
  // ignore: non_constant_identifier_names
  String Number = "";
  String Number2 = "";
  String Operator = "";
  String result = "0";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
          backgroundColor: const Color.fromRGBO(255, 153, 0, 50),
          title: Center(
            child: Text(title),
          )),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(
              height: 21,
            ),
            Container(
              height: 130,

              alignment: AlignmentDirectional.bottomEnd,
              padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
              // margin: const EdgeInsets.fromLTRB(325, 1RS50, 0, 0),
              child: Text(
                result.toString(),
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 42),
              ),
            ),
            const Divider(
              height: 15,
              color: Colors.white,
            ),
            Row(children: [
              defaultBotom(
                function: () => presAC(),
                text: 'AC',
                background: const Color.fromRGBO(160, 162, 162, 50),
                fontcolor: Colors.black,
              ),
              defaultBotom(
                function: () => {},
                text: '+/-',
                background: const Color.fromRGBO(160, 162, 162, 50),
                fontcolor: Colors.black,
              ),
              defaultBotom(
                function: () => {},
                text: '%',
                background: const Color.fromRGBO(160, 162, 162, 70),
                fontcolor: Colors.black,
              ),
              defaultBotom(
                function: () => presOperator("/"),
                text: '/',
                background: const Color.fromRGBO(255, 153, 0, 50),
              ),
            ]),
            const SizedBox(
              height: 21,
            ),
            Row(children: [
              defaultBotom(
                function: () => presBouton("7"),
                text: '7',
              ),
              defaultBotom(
                // ignore: avoid_print
                function: () => {presBouton("8")},

                text: '8',
              ),
              defaultBotom(
                function: () => {presBouton("9")},
                text: '9',
              ),
              defaultBotom(
                function: () => presOperator("x"),
                text: 'x',
                background: const Color.fromRGBO(255, 153, 0, 50),
              ),
            ]),
            const SizedBox(
              height: 21,
            ),
            Row(children: [
              defaultBotom(
                function: () => {presBouton("4")},
                text: '4',
              ),
              defaultBotom(
                function: () => {presBouton("5")},
                text: '5',
              ),
              defaultBotom(
                function: () => {presBouton("6")},
                text: '6',
              ),
              defaultBotom(
                function: () => presOperator("-"),
                text: '-',
                background: const Color.fromRGBO(255, 153, 0, 70),
              ),
            ]),
            const SizedBox(
              height: 21,
            ),
            Row(children: [
              defaultBotom(
                function: () => {presBouton("1")},
                text: '1',
              ),
              defaultBotom(
                function: () => {presBouton("2")},
                text: '2',
              ),
              defaultBotom(
                function: () => {presBouton("3")},
                text: '3',
              ),
              defaultBotom(
                function: () => presOperator("+"),
                text: '+',
                background: const Color.fromRGBO(255, 153, 0, 70),
              ),
            ]),
            const SizedBox(
              height: 21,
            ),
            Row(children: [
              const SizedBox(
                width: 10,
              ),
              defaultZeroBotom(
                function: () => {presBouton("0")},
              ),
              const SizedBox(
                width: 16,
              ),
              defaultBotom(
                function: () => presDot(),
                text: '.',
              ),
              defaultBotom(
                function: () => presEqlue(),
                text: '=',
                background: const Color.fromRGBO(255, 153, 0, 70),
              ),
            ]),
          ],
        ),
      ),
    );
  }

  void presBouton(String number) {
    setState(() {
      //if()
      if (Operator.isEmpty) {
        if (result == "0" || Number.isEmpty) result = "";
        Number += number;

        result += number;
      } else {
        Number2 += number;
        result += number;
      }
    });
  }

  // ignore: Op parameter of function  presOperator Receive the Operator + - X /
  void presOperator(String Op) {
    setState(() {
      if (Number.isNotEmpty) {
        Operator = Op;
        result = Number + Operator;
        Number2 = "";
      } else if (result.isNotEmpty) {
        Operator = Op;
        Number = result;
        result += Operator;
      } else {
        Operator = "";
        result = "0";
      }

      // print(result);
    });
  }

  void presDot() {
    setState(() {
      {
        if (Operator.isEmpty &&
            !Number.contains(".", 0) &&
            !result.contains(".", 0)) {
          Number += ".";
          result += ".";
          // print(double.parse(Number2));
        }
        if (Operator.isNotEmpty && !Number2.contains(".", 0)) {
          Number2 += ".";
          result += ".";
          //print(double.parse(Number2));
        }
      }
    });
  }

  void presEqlue() {
    setState(() {
      if (Operator == "+" && Number.isNotEmpty && Number2.isNotEmpty) {
        result = (double.parse(Number) + double.parse(Number2)).toString();
      } else if (Operator == "-" && Number.isNotEmpty && Number2.isNotEmpty) {
        result = (double.parse(Number) - double.parse(Number2)).toString();
      } else if (Operator == "x" && Number.isNotEmpty && Number2.isNotEmpty) {
        result = (double.parse(Number) * double.parse(Number2)).toString();
      } else if (Operator == "/" && Number.isNotEmpty && Number2.isNotEmpty) {
        result = (double.parse(Number) / double.parse(Number2)).toString();
      }
    });
    Number = "";
    Number2 = "";
    Operator = "";
  }

  void presAC() {
    setState(() {
      Number = "";
      Number2 = "";
      Operator = "";
      result = "0";
    });
  }
}
