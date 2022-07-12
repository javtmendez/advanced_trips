import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/Users/blocUser/user_bloc.dart';
import 'package:platzi_trips_app/Users/model/user.dart';
import 'package:platzi_trips_app/Users/ui/widgets/button_bar.dart';
import 'package:platzi_trips_app/Users/ui/widgets/user_info.dart';

class HeaderProfile extends StatelessWidget {
  UserBloc? userBloc;
  User1? user;
  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of<UserBloc>(context);
    return StreamBuilder(
      stream: userBloc!.streamFirebase,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
          case ConnectionState.none:
            return LinearProgressIndicator();
          case ConnectionState.active:
          case ConnectionState.done:
            return (ShowProfileData(snapshot, context));
        }
      },
    );
  }

  Widget ShowProfileData(AsyncSnapshot snapshot, BuildContext context) {
    final appBloc = BlocProvider.of<UserBloc>(context);
    if (!snapshot.hasData || snapshot.hasError) {
      print("no logueado");
      return Container(
        height: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            Text(
              "Los datos no fueron posible ser cargados",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ],
        ),
      );
    } else {
      print("logueado");
      print(snapshot.data);

      user = User1(
          name: snapshot.data.displayName,
          email: snapshot.data.email,
          photoURL: snapshot.data.photoURL,
          uid: snapshot.data.uid);
      return Container(
        height: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            UserInfo(user!),
            ButtonsBar(),
          ],
        ),
      );
    }
  }
}
