import 'package:flutter/material.dart';
import 'package:platzi_trips_app/Places/ui/widgets/reviews.dart';

class ListReviews extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> listreview = [];
    listreview.add(Reviews(
        "assets/bakery.jpg",
        "Xavito",
        "1 review 10 comentarios",
        "Espectacular lugar volvere el proximo anio",
        5,
        true));
    listreview.add(Reviews("assets/bakery.jpg", "Selvyn Mendez",
        "1 review 1 comentarios", "Lugar mas bonito", 2, true));
    listreview.add(Reviews("assets/bakery.jpg", "Juan Perez",
        "1 review 1 comentarios", "Lugar mas bonito", 4, true));
    listreview.add(Reviews("assets/bakery.jpg", "Pedro Hernandez",
        "1 review 1 comentarios", "Lugar mas bonito", 1, true));
    listreview.add(Reviews("assets/bakery.jpg", "Pedro Hernandez",
        "1 review 1 comentarios", "Lugar mas bonito", 1, true));
    listreview.add(Reviews("assets/bakery.jpg", "Pedro Hernandez",
        "1 review 1 comentarios", "Lugar mas bonito", 1, true));
    listreview.add(Reviews("assets/bakery.jpg", "Pedro Hernandez",
        "1 review 1 comentarios", "Lugar mas bonito", 1, true));
    listreview.add(Reviews("assets/bakery.jpg", "Pedro Hernandez",
        "1 review 1 comentarios", "Lugar mas bonito", 1, true));
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: listreview,
    );
  }
}
