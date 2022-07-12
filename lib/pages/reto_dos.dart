import 'package:flutter/material.dart';

class Retodos extends StatelessWidget {
  const Retodos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/bakery.jpg",
          height: double.infinity,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Center(
          child: Container(
            alignment: Alignment.center,
            color: Color.fromRGBO(0, 0, 0, 0.5),
            height: 100,
            child: Text(
              "hola mundo",
              style: TextStyle(color: Colors.white, fontSize: 40),
            ),
          ),
        )
      ],
    );
  }
}
