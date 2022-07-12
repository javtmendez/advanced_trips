import 'package:flutter/material.dart';
import 'package:platzi_trips_app/Places/ui/screens/list_scard_image.dart';
import 'package:platzi_trips_app/Places/ui/widgets/card_image_list.dart';
import 'package:platzi_trips_app/widgets/gradient1.dart';

class HeaderAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Gradiant1("POPULAR", 250),
        SdcardImageList()
        // CardListImage()
        // Container(
        //   margin: EdgeInsets.only(top: 10),
        //   child: SdcardImageList(),
        // )
      ],
    );
  }
}
