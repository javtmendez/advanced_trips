import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:platzi_trips_app/Places/model/place.dart';
import 'package:platzi_trips_app/Places/ui/widgets/card_image.dart';
import 'package:platzi_trips_app/Places/ui/widgets/card_image2.dart';
import 'package:platzi_trips_app/Places/ui/widgets/scard_image.dart';
import 'package:platzi_trips_app/Users/model/user.dart';
import 'package:platzi_trips_app/Users/ui/widgets/profile_place.dart';

class CloudFirestoreAPI {
  final String USERS = 'users';
  final String PLACE = 'places';
  static FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  void updateUserData(User1 user) async {
    DocumentReference ref = _db.collection(USERS).doc(user.uid);
    return ref.set({
      'uid': user.uid,
      'name': user.name,
      'email': user.email,
      'photoURL': user.photoURL,
      'myPlaces': user.myPlaces,
      'myFavoritePlaces': user.myFavoritePlaces,
      'lastSignIn': DateTime.now()
    }, SetOptions(merge: true));
  }

  Future<void> updatePlaceData(Place place) async {
    CollectionReference refPlaces = _db.collection(PLACE);
    String uid = await _auth.currentUser!.uid;
    await refPlaces.add({
      'name': place.name,
      'description': place.description,
      'likes': place.likes,
      'urlImage': place.urlImage,
      'userOwner': _db.doc("$USERS/$uid") //reference
    }).then((DocumentReference docRef) =>
        docRef.get().then((DocumentSnapshot snapshot1) {
          DocumentReference refUser = _db.collection(USERS).doc(uid);
          refUser.update({
            'myPlaces':
                FieldValue.arrayUnion([_db.doc("$PLACE/${snapshot1.id}")])
          });
        }));
  }

//listado de places ingresados por el usuario
  List<ProfilePlace> myBuildPlaces(List<DocumentSnapshot> placeListSnapshot) {
    List<ProfilePlace> profilePlaces = [];
    placeListSnapshot.forEach((p) {
      profilePlaces.add(ProfilePlace(Place(
          name: p['name'],
          description: p['description'],
          likes: p['likes'],
          urlImage: p['urlImage'])));
    });
    return profilePlaces;
  }

  //listado de todos los places
  List<ScardImage> buildPlaces(List<DocumentSnapshot> placeListSnapshot) {
    List<ScardImage> cardImage = [];
    placeListSnapshot.forEach((p) {
      cardImage.add(ScardImage(Place(
        name: '',
        description: '',
        likes: p['likes'],
        urlImage: p['urlImage'],
      )));
    });
    return cardImage;
  }
}
