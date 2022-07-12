import 'package:flutter/material.dart';

class ButtonGreen extends StatefulWidget {
  final String text;
  double? width = 0;
  double? heigth = 0;
  final VoidCallback onPressed;
  ButtonGreen(
      {Key? key,
      required this.text,
      required this.onPressed,
      this.heigth,
      this.width})
      : super(key: key);

  @override
  State<ButtonGreen> createState() => _ButtonGreenState();
}

class _ButtonGreenState extends State<ButtonGreen> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      child: Container(
        margin: EdgeInsets.only(
          top: 30,
          left: 30,
          right: 20,
          bottom: 10,
        ),
        width: widget.width,
        height: widget.heigth,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: LinearGradient(
              colors: [
                Color(0XFFa7ff84),
                Color(0XFF1cbb78),
              ],
              begin: FractionalOffset(0.2, 0.0),
              end: FractionalOffset(1.0, 0.6),
              stops: [0.0, 0.6],
              tileMode: TileMode.clamp),
        ),
        child: Center(
          child: Text(
            widget.text,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
