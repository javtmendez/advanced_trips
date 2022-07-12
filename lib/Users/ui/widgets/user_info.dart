import 'package:flutter/material.dart';
import 'package:platzi_trips_app/Users/model/user.dart';

class UserInfo extends StatelessWidget {
  final User1 user;

  UserInfo(this.user);

  @override
  Widget build(BuildContext context) {
    final userPhoto = Container(
      margin: EdgeInsets.only(left: 5),
      width: 65,
      height: 65,
      decoration: BoxDecoration(
          border: Border.all(
              color: Colors.white, width: 2.0, style: BorderStyle.solid),
          shape: BoxShape.circle,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(user.photoURL),
            // image: AssetImage(user.phtoUrl),
          )),
    );

    final userInfo = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
            margin: EdgeInsets.only(bottom: 5.0),
            child: Text(user.name,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: 'Lato',
                ))),
        Text(user.email,
            style: TextStyle(fontSize: 15.0, color: Colors.white30)),
      ],
    );

    return Container(
      margin: EdgeInsets.symmetric(vertical: 25.0, horizontal: 60.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[userPhoto, userInfo],
      ),
    );
  }
}
