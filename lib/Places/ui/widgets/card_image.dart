import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:platzi_trips_app/Places/ui/widgets/floating_action_button_Green.dart';

class CardImage extends StatelessWidget {
  final VoidCallback onPressedFavicon;
  final String pathImage;
  final IconData buttonIcon;
  final bool iscamara;
  final XFile? imgCamera;
  CardImage(
      {Key? key,
      required this.pathImage,
      required this.buttonIcon,
      required this.onPressedFavicon,
      required this.iscamara,
      this.imgCamera});
  // CardImage(this.pathimage, this.buttonIcon, this.onPressedFavicon, this.image);
  @override
  Widget build(BuildContext context) {
    final card = Container(
      height: 350.0,
      width: 250.0,
      // margin: EdgeInsets.only(left: 20),
      decoration: BoxDecoration(
          image:
              DecorationImage(fit: BoxFit.cover, image: AssetImage(pathImage)),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          shape: BoxShape.rectangle,
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black38,
                blurRadius: 15.0,
                offset: Offset(0.0, 7.0))
          ]),
    );
    final imagecamara = Container(
      height: 350.0,
      width: 250.0,
      child: Image.file(File(imgCamera?.path ?? "assets/pungbu.jpg")),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          shape: BoxShape.rectangle,
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black38,
                blurRadius: 15.0,
                offset: Offset(0.0, 7.0))
          ]),
    );

    return Stack(
      alignment: Alignment(0.9, 1.1),
      children: [
        iscamara == true ? imagecamara : card,
        FloatingActionButtonGreen(
          iconData: buttonIcon,
          onPressed: this.onPressedFavicon,
        )
      ],
    );
  }
}
