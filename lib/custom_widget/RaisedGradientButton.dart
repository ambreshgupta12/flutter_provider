import 'package:flutter/material.dart';

class RaisedGradientButton extends StatelessWidget {

  final double width;
  final double height;
  final String text;

  RaisedGradientButton({this.height, this.width, @required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(121),
        gradient: LinearGradient(
            colors: [Color(0xffff4e00), Color(0xffe60023)], stops: [0, 1]),
        boxShadow: [BoxShadow(
            color: Color(0x52e60023),
            offset: Offset(0, 4),
            blurRadius: 12,
            spreadRadius: 0)
        ],
      ),
      child: new Text(text,
          style: TextStyle(
            fontFamily: 'CircularStdBold',
            color: Colors.white,
            fontSize: 17,

          )),
    );
  }
}
