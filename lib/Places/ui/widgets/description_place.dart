import 'package:flutter/material.dart';
import 'package:platzi_trips_app/widgets/button_purple.dart';
import 'package:platzi_trips_app/widgets/caja_texto.dart';

import 'package:platzi_trips_app/Places/ui/widgets/stars.dart';

class Descriptionplace extends StatelessWidget {
  String nombreLugar;
  int numberStars;
  String descripcionLugar;

  Descriptionplace(this.nombreLugar, this.numberStars, this.descripcionLugar);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    final size = MediaQuery.of(context).size;
    final emailCtrl = TextEditingController();

    final titleStart = Container(
        margin: EdgeInsets.only(
          top: 300,
          left: 20.0,
          right: 20.0,
        ),
        child: Row(
          children: [
            Text(
              nombreLugar,
              style: textTheme.headline5,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              textAlign: TextAlign.left,
            ),
            Stars(numberStars, 20, true)
          ],
        ));

    final description = Container(
      margin: EdgeInsets.only(
        left: 20.0,
        right: 20.0,
        bottom: 10,
      ),
      width: size.width,
      child: Text(
        descripcionLugar,
        style: TextStyle(fontFamily: "Lato", fontSize: 20),
        overflow: TextOverflow.ellipsis,
        maxLines: 8,
        textAlign: TextAlign.justify,
      ),
    );

    final contenido =
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
      titleStart,
      description,
      CajaTexto(
          textController: emailCtrl,
          icon: Icons.mail_outline_rounded,
          placeholder: 'Caja de texto',
          keyboardType: TextInputType.emailAddress,
          isPassword: false),
      ButtonPurple(
        onpressButtonPurple: () {},
        tituloButton: 'Aceptar',
      ),
    ]);
    return contenido;
  }
}
