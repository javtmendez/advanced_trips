import 'package:flutter/material.dart';

class Stars extends StatelessWidget {
  int numberStars;
  double size1;
  bool visibility1;
  Stars(this.numberStars, this.size1, this.visibility1);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: showStars(numberStars, size1, visibility1),
    );
  }
}

Widget stars(bool withborder, double size1, bool visibility1) {
  return Visibility(
    visible: visibility1,
    child: Container(
      margin: EdgeInsets.only(
        right: 0.1,
      ),
      child: Icon(
        withborder ? Icons.star : Icons.star_border,
        color: Color(0xFFf2C611),
        size: size1,
      ),
    ),
  );
}

Widget showStars(int numberStars, double size1, bool visibility1) {
  List<Widget> rowStart = [];
  for (var i = 0; i < 5; i++) {
    if (i < numberStars) {
      rowStart.add(stars(true, size1, visibility1));
    } else {
      rowStart.add(stars(false, size1, visibility1));
    }
  }
  return new Row(
    mainAxisSize: MainAxisSize.min,
    children: rowStart,
  );
}
