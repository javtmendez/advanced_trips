import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/Users/blocUser/user_bloc.dart';

class SdcardImageList extends StatelessWidget {
  const SdcardImageList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserBloc? userBloc;
    userBloc = BlocProvider.of<UserBloc>(context);

    return StreamBuilder(
        stream: userBloc.placesStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
            case ConnectionState.none:
              return LinearProgressIndicator(
                backgroundColor: Colors.black,
              );
            case ConnectionState.active:
            case ConnectionState.done:
              return Container(
                  height: 350,
                  margin: EdgeInsets.only(top: 30),
                  child: ListView(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.all(40),
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: userBloc!.buildPlaces(snapshot.data.docs),
                        )
                      ]));
          }
        });
  }
}
