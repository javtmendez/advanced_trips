import 'package:flutter/material.dart';
import 'package:platzi_trips_app/Places/ui/screens/header_app_bar.dart';
import 'package:platzi_trips_app/Places/ui/widgets/description_place.dart';
import 'package:platzi_trips_app/Places/ui/widgets/list_reviews.dart';

class PagedetalleBussines extends StatelessWidget {
  const PagedetalleBussines({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        ListView(
          children: [
            Descriptionplace("Dubili lula", 2,
                "Et quis fugiat est adipisicing labore velit ipsum duis irure nulla eiusmod Lorem velit aute. Consectetur velit eu cillum cillum nulla nulla eu. Lorem commodo eu ea commodo occaecat dolor do Lorem reprehenderit deserunt eu et ea. Aliquip dolore amet dolore quis enim elit et Lorem irure. Quis et laborum laboris sunt ex aliqua mollit."),
            ListReviews(),
          ],
        ),
        HeaderAppBar(),
      ],
    ));
  }
}
