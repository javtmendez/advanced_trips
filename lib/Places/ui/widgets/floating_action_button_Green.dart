import 'package:flutter/material.dart';

class FloatingActionButtonGreen extends StatefulWidget {
  final IconData iconData;
  final VoidCallback onPressed;
  FloatingActionButtonGreen(
      {Key? key, required this.iconData, required this.onPressed})
      : super(key: key);

  @override
  State<FloatingActionButtonGreen> createState() =>
      _FloatingActionButtonGreenState();
}

class _FloatingActionButtonGreenState extends State<FloatingActionButtonGreen> {
  // bool _pressed = false;

  // void _onPressedFav() {
  //   setState(() {
  //     _pressed = !this._pressed;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Color(0xFF11DA53),
      mini: true,
      tooltip: "Fav",
      onPressed: widget.onPressed,
      heroTag: null,
      child: Icon(
        widget.iconData,
        color: Colors.white,
      ),
    );
  }
}
