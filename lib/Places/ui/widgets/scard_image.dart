import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:platzi_trips_app/Places/model/place.dart';

class ScardImage extends StatelessWidget {
  final Place place;
  ScardImage(this.place);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(alignment: Alignment(0.9, 1.1), children: [
        imagen_principal(place: place),
        FloatingActionButton(
          onPressed: () {},
          child: Icon(
            Icons.favorite_border,
            color: Colors.white,
          ),
          backgroundColor: Color.fromARGB(255, 252, 164, 0),
          mini: true,
        )
      ]),
    );
  }
}

class imagen_principal extends StatelessWidget {
  final Place place;
  const imagen_principal({
    Key? key,
    required this.place,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250.0,
      width: 350.0,
      // margin: EdgeInsets.only(left: 20),
      decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            // image: NetworkImage(place.urlImage),
            image: CachedNetworkImageProvider(place.urlImage),
          ),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          shape: BoxShape.rectangle,
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black12,
                blurRadius: 15.0,
                offset: Offset(0.0, 7.0))
          ]),
    );
  }
}
