import 'package:flutter/material.dart';

class RetoTres extends StatelessWidget {
  const RetoTres({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(top: 175),
          child: _ListDescriptionBussines(),
        ),
        MenuPath(),
      ],
    );
  }
}

class MenuPath extends StatelessWidget {
  const MenuPath({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CustomClipPath(),
      child: Container(
        width: double.infinity,
        height: 200,
        color: Colors.orange,
      ),
    );
  }
}

class CustomClipPath extends CustomClipper<Path> {
  // var radius = 10.0;
  @override
  Path getClip(Size size) {
    //  https://www.developerlibs.com/2019/08/flutter-draw-custom-shaps-clip-path.html
    Path path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(
        size.width / 4, size.height - 40, size.width / 2, size.height - 20);
    path.quadraticBezierTo(
        3 / 4 * size.width, size.height, size.width, size.height - 30);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class _ListDescriptionBussines extends StatelessWidget {
  const _ListDescriptionBussines({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Column(
        children: [
          _InforDet(
              "Pungbu",
              "Nails Studio, Certificados en uñas, grantizamos la mejor calidad.",
              "assets/pungbu.jpg"),
          _InforDet(
              "FEEL CREATIVE",
              "Diseño Grafico, Mantas, Impresiones, etc.",
              "assets/fellcreative.jpg"),
          _InforDet(
              "Pungbu",
              "Nails Studio, Certificados en uñas, grantizamos la mejor calidad.",
              "assets/pungbu.jpg"),
          _InforDet(
              "FEEL CREATIVE",
              "Diseño Grafico, Mantas, Impresiones, etc.",
              "assets/fellcreative.jpg"),
          _InforDet(
              "Pungbu",
              "Nails Studio, Certificados en uñas, grantizamos la mejor calidad.",
              "assets/pungbu.jpg"),
          _InforDet(
              "FEEL CREATIVE",
              "Diseño Grafico, Mantas, Impresiones, etc.",
              "assets/fellcreative.jpg"),
          _InforDet(
              "FEEL CREATIVE",
              "Diseño Grafico, Mantas, Impresiones, etc.",
              "assets/fellcreative.jpg"),
          _InforDet(
              "FEEL CREATIVE",
              "Diseño Grafico, Mantas, Impresiones, etc.",
              "assets/fellcreative.jpg"),
        ],
      ),
    ]);
  }
}

class _InforDet extends StatelessWidget {
  String Titulo;
  String Subtitulo;
  String PathImagen;
  _InforDet(this.Titulo, this.Subtitulo, this.PathImagen);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 120,
      // margin: EdgeInsets.only(top: 2, bottom: 2),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //imagen

              Container(
                height: 80,
                width: 80,
                margin: EdgeInsets.only(left: 10, right: 10),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(PathImagen),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  // margin: EdgeInsets.only(top: 35),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.all(5),
                        child: Text(
                          Titulo.toUpperCase(),
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 5),
                        child: Text(
                          Subtitulo,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 14,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () => Navigator.pushNamed(context, 'details'),
                child: Container(
                  height: 40,
                  width: 40,
                  margin: EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromRGBO(50, 20, 30, 0.5),
                  ),
                  child: Icon(
                    Icons.navigate_next_rounded,
                    color: Colors.orange,
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Divider(
            color: Colors.black54,
          )
        ],
      ),
    );
  }
}
