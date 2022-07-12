import 'package:flutter/material.dart';
import 'package:platzi_trips_app/Places/ui/widgets/stars.dart';
import 'package:platzi_trips_app/Places/ui/widgets/stars.dart';

class Reviews extends StatelessWidget {
  String pathImage;
  String nombreUsuario;
  String detalle;
  String comentario;
  int numberStars;
  bool visibility1;
  Reviews(this.pathImage, this.nombreUsuario, this.detalle, this.comentario,
      this.numberStars, this.visibility1);
  @override
  Widget build(BuildContext context) {
    final comentarioReview = Container(
      margin: EdgeInsets.only(left: 20),
      child: Text(
        comentario,
        textAlign: TextAlign.left,
        style: TextStyle(
          color: Colors.black87,
          fontSize: 14,
        ),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
    final detalleReview = Container(
        margin: EdgeInsets.only(left: 20),
        child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Text(
            detalle,
            textAlign: TextAlign.left,
            style: TextStyle(
              color: Colors.black54,
              fontSize: 13,
            ),
          ),
          Stars(numberStars, 12, visibility1)
        ]));
    final usuarioTituloReview = Container(
      margin: EdgeInsets.only(left: 20),
      child: Text(
        nombreUsuario,
        textAlign: TextAlign.left,
        style: TextStyle(
          color: Colors.black,
          fontSize: 20,
        ),
      ),
    );
    final photo = Container(
      margin: EdgeInsets.only(left: 5),
      width: 65,
      height: 65,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage(pathImage),
          fit: BoxFit.cover,
        ),
      ),
    );
    final contenidoReview = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [usuarioTituloReview, detalleReview, comentarioReview],
    );
    final finalReview = Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 3, bottom: 3),
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.transparent,
          width: 1.5,
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [photo, contenidoReview],
      ),
    );

    return finalReview;
  }
}
