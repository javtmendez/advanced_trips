import 'package:flutter/material.dart';
import 'package:platzi_trips_app/Places/ui/widgets/card_image.dart';

class CardListImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.all(40),
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ContainerImage(
                  dirpath: "assets/bakery.jpg",
                  buttonIcon: Icons.favorite_border,
                  onPressedFavicon: () {}),
              ContainerImage(
                  dirpath: "assets/bakery.jpg",
                  buttonIcon: Icons.favorite_border,
                  onPressedFavicon: () {}),
              ContainerImage(
                  dirpath: "assets/bakery.jpg",
                  buttonIcon: Icons.favorite_border,
                  onPressedFavicon: () {}),
              ContainerImage(
                  dirpath: "assets/bakery.jpg",
                  buttonIcon: Icons.favorite_border,
                  onPressedFavicon: () {}),
              ContainerImage(
                  dirpath: "assets/bakery.jpg",
                  buttonIcon: Icons.favorite_border,
                  onPressedFavicon: () {}),
            ],
          ),
        ],
      ),
    );
  }
}

class ContainerImage extends StatelessWidget {
  final String dirpath;
  final IconData buttonIcon;
  final VoidCallback onPressedFavicon;
  const ContainerImage({
    Key? key,
    required this.dirpath,
    required this.buttonIcon,
    required this.onPressedFavicon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(
          top: 80,
          right: 10,
        ),
        child: CardImage(
          pathImage: dirpath,
          buttonIcon: buttonIcon,
          onPressedFavicon: onPressedFavicon,
          iscamara: false,
        ));
  }
}
