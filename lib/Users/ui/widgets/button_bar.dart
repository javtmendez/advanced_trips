import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:platzi_trips_app/Places/ui/screens/add_new_place.dart';
import 'package:platzi_trips_app/Users/blocUser/user_bloc.dart';
import 'package:platzi_trips_app/Users/ui/widgets/cicle_button.dart';

class ButtonsBar extends StatelessWidget {
  UserBloc? userBloc;

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of(context);
    // Carga la imagen desde una camara
    final ImagePicker _picker = ImagePicker();
    Future getImage() async {
      await _picker
          .pickImage(
            source: ImageSource.camera,
            imageQuality: 70,
          )
          .then((XFile? value) => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AddNewPlace(image: value!))))
          .catchError((onError) => print("error"));
    }

    //Prevenir perdida de datos
    Future<void> retrieveLostData() async {
      final LostDataResponse response = await _picker.retrieveLostData();
      if (response.isEmpty) {
        return;
      }
      if (response.file != null) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) =>
                    AddNewPlace(image: response.file!)));
      }
    }

    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 10.0),
        child: Row(
          children: <Widget>[
            //Cambiar la contraseña
            CircleButton(true, Icons.vpn_key, 20.0,
                Color.fromRGBO(255, 255, 255, 0.6), () => {}),
            //Añadiremos un nuevo lugar
            CircleButton(
                false, Icons.add, 40.0, Color.fromRGBO(255, 255, 255, 1),
                () async {
              getImage();
              retrieveLostData();
            }),

            //Cerrar Sesión
            CircleButton(
                true,
                Icons.exit_to_app,
                20.0,
                Color.fromRGBO(255, 255, 255, 0.6),
                () => {
                      userBloc!.singOut(),
                    }),
          ],
        ));
  }
}
