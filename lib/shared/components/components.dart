import 'package:flutter/material.dart';

Widget defaultBotom({
  String text = "",
  Color background = const Color.fromRGBO(28, 28, 28, 100),
  Color fontcolor = Colors.white,
  // ignore: avoid_print
  required VoidCallback function,
}) {
  return Row(mainAxisSize: MainAxisSize.max, children: [
    MaterialButton(
      height: 74,

      shape: const CircleBorder(), // <-- Radius

      color: background,

      onPressed: function,

      child: Text(
        text,
        style:
            TextStyle(color: fontcolor, fontFamily: 'Segoe UI', fontSize: 37),
      ),
    ),
  ]);
}

Widget defaultZeroBotom({
  String text = "0",
  required VoidCallback function,
  Color background = const Color.fromRGBO(28, 28, 28, 100),
}) =>
    Row(mainAxisSize: MainAxisSize.max, children: [
      MaterialButton(
        minWidth: 150,

        height: 71,
        //borderRadius: new BorderRadius.circular(10.0),
        // ignore: prefer_const_constructors
        shape: RoundedRectangleBorder(
            borderRadius:
                const BorderRadius.all(Radius.circular(37))), // <-- Radius

        color: background,

        onPressed: function,
        child: Text(
          text.toUpperCase(),
          style: const TextStyle(
              color: Colors.white, fontFamily: 'Segoe UI', fontSize: 37),
        ),
      ),
    ]);
