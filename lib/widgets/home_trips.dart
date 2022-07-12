import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/Users/blocUser/user_bloc.dart';
import 'package:platzi_trips_app/Users/model/user.dart';
import 'package:platzi_trips_app/pages/pages.dart';

class HomeTrip extends StatefulWidget {
  final User1 user;
  HomeTrip({Key? key, required this.user}) : super(key: key);

  @override
  State<HomeTrip> createState() => _HomeTripState();
}

class _HomeTripState extends State<HomeTrip> {
  // final String uuid = widget.uid;
  int indexTap = 0;

  void onTapTapped(int index) {
    setState(() {
      indexTap = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> widgetsChildren = [
      RetoTres(),
      PagedetalleBussines(),
      RetoCuatro(
        user: widget.user,
      )
    ];
    return Scaffold(
      body: widgetsChildren[indexTap],
      bottomNavigationBar: Theme(
        data: Theme.of(context)
            .copyWith(canvasColor: Colors.white, primaryColor: Colors.orange),
        child: BlocProvider(
            bloc: UserBloc(),
            child: BottomNavigationBar(
                showSelectedLabels: false,
                showUnselectedLabels: false,
                currentIndex: indexTap,
                onTap: onTapTapped,
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home_outlined), label: ""),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.search_outlined), label: ""),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.local_movies), label: "")
                ])),
      ),
    );
  }
}
