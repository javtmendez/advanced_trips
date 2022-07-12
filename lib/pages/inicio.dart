import 'package:flutter/material.dart';
import 'package:platzi_trips_app/pages/pages.dart';

class Inicio extends StatelessWidget {
  const Inicio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   leading: Icon(Icons.home),
        //   title: Text('Platzi'),
        //   centerTitle: true,
        body: RetoTres());
    //     body: Stack(
    //   children: [
    //     ListView(
    //       children: [
    //         Descriptionplace("Dubili lula", 2,
    //             "Et quis fugiat est adipisicing labore velit ipsum duis irure nulla eiusmod Lorem velit aute. Consectetur velit eu cillum cillum nulla nulla eu. Lorem commodo eu ea commodo occaecat dolor do Lorem reprehenderit deserunt eu et ea. Aliquip dolore amet dolore quis enim elit et Lorem irure. Quis et laborum laboris sunt ex aliqua mollit."),
    //         ListReviews(),
    //       ],
    //     ),
    //     HeaderAppBar()
    //   ],
    // ));
    // body: new Reviews("assets/bakery.jpg", "Javier Tzoc", "1 review",
    //     "Hermoso Pais Guatemala, mis 5 estrellas...", 3));
    // body: new Descriptionplace("Dubili lula", 2,
    //     "Et quis fugiat est adipisicing labore velit ipsum duis irure nulla eiusmod Lorem velit aute. Consectetur velit eu cillum cillum nulla nulla eu. Lorem commodo eu ea commodo occaecat dolor do Lorem reprehenderit deserunt eu et ea. Aliquip dolore amet dolore quis enim elit et Lorem irure. Quis et laborum laboris sunt ex aliqua mollit."));
  }
}
