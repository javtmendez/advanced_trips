import 'package:flutter/material.dart';

class CajaTexto extends StatelessWidget {
  final IconData? icon;
  final IconData? iconS;
  final String placeholder;
  final TextEditingController textController;
  final TextInputType keyboardType;
  final bool isPassword;
  final int? maxlines;

  const CajaTexto(
      {Key? key,
      required this.textController,
      this.icon,
      required this.placeholder,
      required this.keyboardType,
      required this.isPassword,
      this.maxlines,
      this.iconS})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(right: 5, left: 5, top: 5, bottom: 5),
        decoration: BoxDecoration(
            color: Color.fromRGBO(0, 20, 35, 0.5),
            borderRadius: BorderRadius.circular(10),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.orange.withOpacity(0.05),
                offset: Offset(0, 5),
                blurRadius: 5,
              )
            ]),
        child: TextField(
          style: TextStyle(color: Colors.white),
          controller: this.textController,
          autocorrect: false,
          maxLines: this.maxlines,
          keyboardType: this.keyboardType,
          obscureText: this.isPassword,
          decoration: InputDecoration(
            hintStyle: TextStyle(color: Colors.white),
            prefixIcon: Icon(this.icon),
            focusedBorder: InputBorder.none,
            border: InputBorder.none,
            hintText: this.placeholder,
          ),
        ));
  }
}
