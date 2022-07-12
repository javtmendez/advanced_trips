import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/Users/blocUser/user_bloc.dart';
import 'package:platzi_trips_app/Users/model/user.dart';
import 'package:platzi_trips_app/widgets/button_green.dart';
import 'package:platzi_trips_app/widgets/gradient1.dart';
import 'package:platzi_trips_app/widgets/home_trips.dart';

class SingInScreen extends StatefulWidget {
  SingInScreen({Key? key}) : super(key: key);

  @override
  State<SingInScreen> createState() => _SingInScreenState();
}

class _SingInScreenState extends State<SingInScreen> {
  UserBloc? userBloc;

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of(context);

    return _handleCurrentSession();
  }

  Widget _handleCurrentSession() {
    return StreamBuilder(
      stream: userBloc!.authStatus,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        //snapshot- data - Object User
        if (!snapshot.hasData || snapshot.hasError) {
          return signInGoogleUI();
        } else {
          return HomeTrip(
            user: User1(
              uid: snapshot.data!.uid,
              name: snapshot.data?.displayName ?? '',
              email: snapshot.data?.email ?? '',
              photoURL: snapshot.data?.photoURL ?? '',
            ),
            // uid: snapshot.data.uid,
          );
        }
      },
    );
  }

  Widget signInGoogleUI() {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Gradiant1("", size.height),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Welcome. \n This is your Travel App",
                style: TextStyle(
                  fontSize: 37,
                ),
              ),
              ButtonGreen(
                text: "Login with Gmail",
                onPressed: () async {
                  final UserCredential value = await userBloc!.singIn();

                  userBloc!.updateUserData(User1(
                    uid: value.user!.uid,
                    name: value.user?.displayName ?? '',
                    email: value.user?.email ?? '',
                    photoURL: value.user?.photoURL ?? '',
                  ));
                },
                heigth: 50.0,
                width: 300,
              ),
            ],
          )
        ],
      ),
    );
  }
}
