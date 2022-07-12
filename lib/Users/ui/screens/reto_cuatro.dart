import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/Users/blocUser/user_bloc.dart';
import 'package:platzi_trips_app/Users/model/user.dart';
import 'package:platzi_trips_app/Users/ui/screens/reto_tres.dart';
import 'package:platzi_trips_app/Users/ui/widgets/head_profile.dart';
import 'package:platzi_trips_app/Users/ui/widgets/profile_place_list.dart';
import 'package:platzi_trips_app/Places/ui/widgets/card_image.dart';

class RetoCuatro extends StatelessWidget {
  final User1 user;
  const RetoCuatro({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String uid;
    uid = user.uid;
    return BlocProvider(
        bloc: UserBloc(),
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(top: 140),
              child: ListView(
                children: [
                  ProfilePlacesList(
                    uid: uid,
                  ),
                ],
              ),
            ),
            MenuPath(),
            HeaderProfile(),
          ],
        ));
  }
}

class ImageNew extends StatelessWidget {
  const ImageNew({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void onPressedFav() {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text("Agregaste a tus Favoritos"),
      ));
    }

    return Container(
        width: 250,
        height: 190,
        margin: EdgeInsets.only(bottom: 50),
        child: CardImage(
          pathImage: "assets/bakery.jpg",
          buttonIcon: Icons.star_border,
          onPressedFavicon: onPressedFav,
          iscamara: false,
        ));
  }
}

class ButtonMenu extends StatelessWidget {
  final IconData iconData;
  const ButtonMenu({
    Key? key,
    required this.iconData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      // margin: EdgeInsets.only(right: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: IconButton(
        icon: Icon(iconData),
        onPressed: () {},
      ),
    );
  }
}
