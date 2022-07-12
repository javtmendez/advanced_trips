import 'package:flutter/material.dart';

class ButtonPurple extends StatelessWidget {
  final String tituloButton;
  final VoidCallback onpressButtonPurple;
  const ButtonPurple(
      {Key? key, required this.tituloButton, required this.onpressButtonPurple})
      : super(key: key);
//  () {
//         Scaffold.of(context).showSnackBar(SnackBar(
//           content: Text(
//             buttontext.text,
//             style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
//             textAlign: TextAlign.center,
//           ),
//           backgroundColor: Color.fromRGBO(0, 20, 35, 0.5),
//         ));
//       }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpressButtonPurple,
      child: Container(
        margin: EdgeInsets.only(
          top: 30,
          left: 30,
          right: 20,
          bottom: 10,
        ),
        width: 180,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: LinearGradient(
              colors: [Color(0XFF4268D3), Color(0XFF584CD1)],
              begin: FractionalOffset(0.2, 0.0),
              end: FractionalOffset(1.0, 0.6),
              stops: [0.0, 0.6],
              tileMode: TileMode.clamp),
        ),
        child: Center(
          child: Text(
            tituloButton,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
