import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:platzi_trips_app/Places/model/place.dart';
import 'package:platzi_trips_app/Places/ui/widgets/scard_image.dart';
import 'package:platzi_trips_app/Users/model/user.dart';
import 'package:platzi_trips_app/Users/repository/cloud_firestore_api.dart';
import 'package:platzi_trips_app/Users/ui/widgets/profile_place.dart';

class CloudFirestoreRepository {
  final _cloudFirestoreAPI = CloudFirestoreAPI();

  void updateUserDataFirestore(User1 user) =>
      _cloudFirestoreAPI.updateUserData(user);

  Future<void> updatePlaceData(Place place) =>
      _cloudFirestoreAPI.updatePlaceData(place);
  //listado de places

  List<ProfilePlace> myBuildPlaces(List<DocumentSnapshot> placeListSnapshot) =>
      _cloudFirestoreAPI.myBuildPlaces(placeListSnapshot);

  List<ScardImage> buildPlaces(List<DocumentSnapshot> placeListSnapshot) =>
      _cloudFirestoreAPI.buildPlaces(placeListSnapshot);
}
