import 'package:flutter/material.dart';

class Gradiant1 extends StatelessWidget {
  String titulo;
  double heigtn = 0.0;
  Gradiant1(this.titulo, this.heigtn);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: heigtn,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [Color(0XFF4268D3), Color(0XFF584CD1)],
            begin: FractionalOffset(0.2, 0.0),
            end: FractionalOffset(1.0, 0.6),
            stops: [0.0, 0.6],
            tileMode: TileMode.clamp),
      ),
      alignment: Alignment(-0.9, -0.6),
      child: Text(
        titulo,
        style: TextStyle(
          fontSize: 33,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}
