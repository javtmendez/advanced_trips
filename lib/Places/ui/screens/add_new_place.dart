import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:platzi_trips_app/Places/model/place.dart';
import 'package:platzi_trips_app/Places/ui/widgets/card_image.dart';
import 'package:platzi_trips_app/Users/blocUser/user_bloc.dart';
import 'package:platzi_trips_app/widgets/button_purple.dart';
import 'package:platzi_trips_app/widgets/caja_texto.dart';
import 'package:platzi_trips_app/widgets/gradient1.dart';

class AddNewPlace extends StatefulWidget {
  XFile image;
  AddNewPlace({Key? key, required this.image});

  @override
  State<AddNewPlace> createState() => _AddNewPlaceState();
}

class _AddNewPlaceState extends State<AddNewPlace> {
  final tituloPlace = TextEditingController();
  final descriptionPlace = TextEditingController();

  void onPressedFav() {}

  @override
  Widget build(BuildContext context) {
    UserBloc userBloc = BlocProvider.of<UserBloc>(context);
    return Scaffold(
      body: Stack(
        children: [
          Gradiant1("NUEVO", 300),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(
                    top: 175,
                  ),
                  width: 250,
                  height: 190,
                  child: CardImage(
                    // image: widget.image!.path,
                    buttonIcon: Icons.camera_alt_outlined,
                    onPressedFavicon: onPressedFav,
                    pathImage: "assets/backery.jpg",
                    iscamara: true,
                    imgCamera: widget.image,
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Padding(padding: EdgeInsets.only(top: 45, left: 5)),
              SizedBox(
                width: 50,
                height: 50,
                child: IconButton(
                  icon: Icon(
                    Icons.keyboard_arrow_left_outlined,
                    color: Colors.red,
                    size: 45,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 350, bottom: 20),
            child: ListView(children: [
              Container(),
              Container(
                margin: EdgeInsets.only(bottom: 20),
                child: CajaTexto(
                  textController: tituloPlace,
                  placeholder: 'Caja de texto',
                  keyboardType: TextInputType.emailAddress,
                  isPassword: false,
                ),
              ),
              CajaTexto(
                textController: descriptionPlace,
                placeholder: 'Caja de texto',
                keyboardType: TextInputType.multiline,
                isPassword: false,
                maxlines: 4,
              ),
              CajaTexto(
                textController: descriptionPlace,
                placeholder: 'Caja de texto',
                keyboardType: TextInputType.name,
                isPassword: false,
                iconS: Icons.location_on_outlined,
              ),
              ButtonPurple(
                onpressButtonPurple: () {
                  // LinearProgressIndicator(
                  //   backgroundColor: Colors.red,
                  // );
                  //1. Firebase Storage
                  //url -
                  // Id usuario logueado actualmente
                  // String? urlImagen;
                  userBloc.currentUsuario().then((User? value) {
                    if (value != null) {
                      CircularProgressIndicator();
                      String uid = value.uid;
                      String path =
                          "${uid.toString()}/${DateTime.now().toString()}.jpg";
                      userBloc
                          .uploadFile(path, File(widget.image.path))
                          .then((UploadTask value) {
                        value.then((TaskSnapshot snapshot) {
                          snapshot.ref.getDownloadURL().then((urlimage) {
                            print("url imagen:${urlimage.toString()}");
                            // LinearProgressIndicator(
                            //   backgroundColor: Colors.amber[400],
                            // );
                            //2. Cloud Firestore
                            //Place - title, description, url, userOwner, likes
                            userBloc
                                .updatePlaceData(Place(
                              name: tituloPlace.text,
                              description: descriptionPlace.text,
                              urlImage: urlimage,
                              likes: 0,
                            ))
                                .whenComplete(() {
                              print("finalizo");
                              Navigator.pop(context);
                            });
                          });
                        });
                      });
                    }
                  });
                },
                tituloButton: 'Guardar',
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
