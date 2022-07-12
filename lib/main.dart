import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// import 'firebase_options.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'firebase_options.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/Users/blocUser/user_bloc.dart';
import 'package:platzi_trips_app/Users/ui/screens/sing_in_with_google.dart';
import 'package:platzi_trips_app/Places/ui/screens/page_detalle_bussines.dart';
import 'package:platzi_trips_app/pages/pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   title: 'Flutter Demo',
    //   theme: ThemeData(
    //     primarySwatch: Colors.orange,
    //   ),
    //   initialRoute: 'inicio',
    //   routes: {
    //     'inicio': (_) => SingInScreen(),
    //     'details': (_) => PagedetalleBussines(),
    //   },
    //   home: SingInScreen(),
    // );
    return BlocProvider(
      bloc: UserBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
        initialRoute: 'inicio',
        routes: {
          'inicio': (_) => SingInScreen(),
          'details': (_) => PagedetalleBussines(),
        },
        home: SingInScreen(),
      ),
    );
  }
}
