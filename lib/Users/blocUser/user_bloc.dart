import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/Places/model/place.dart';
import 'package:platzi_trips_app/Places/ui/widgets/scard_image.dart';
import 'package:platzi_trips_app/Users/model/user.dart';
import 'package:platzi_trips_app/Users/repository/auth_repository.dart';
import 'package:platzi_trips_app/Users/repository/cloud_fire_repository.dart';
import 'package:platzi_trips_app/Users/repository/cloud_firestore_api.dart';
import 'package:platzi_trips_app/Users/repository/firebase_storage_repository.dart';
import 'package:platzi_trips_app/Users/ui/widgets/profile_place.dart';

class UserBloc implements Bloc {
  final _authRepository = AuthRepository();
  // casos de uso
  // 1 sign in a las aplicacion con google

  Stream<User?> streamFirebase = FirebaseAuth.instance.authStateChanges();
  Stream<User?> get authStatus => streamFirebase;
  Future<User?> currentUsuario() async {
    User? user = FirebaseAuth.instance.currentUser;
    return user;
  }

  Future<UserCredential> singIn() => _authRepository.singInFIrebase();
// lista de places por medio de un
  Stream<QuerySnapshot> placesListStream = FirebaseFirestore.instance
      .collection(CloudFirestoreAPI().PLACE)
      .snapshots();
  Stream<QuerySnapshot> get placesStream => placesListStream;
//stream para filtrar los places por usuario la cual funciona como un metodo ya que recibe un parametro
  Stream<QuerySnapshot> myPlacesListStream(String uid) => FirebaseFirestore
      .instance
      .collection(CloudFirestoreAPI().PLACE)
      .where("userOwner",
          isEqualTo: FirebaseFirestore.instance
              .doc("${CloudFirestoreAPI().USERS}/${uid.toString()}"))
      .snapshots();
  //2. Registrar usuario en base de datos
  final _cloudFirestoreRepository = CloudFirestoreRepository();

  void updateUserData(User1 user1) =>
      _cloudFirestoreRepository.updateUserDataFirestore(user1);

//3. ingresar un nuevo place
  Future<void> updatePlaceData(Place place) =>
      _cloudFirestoreRepository.updatePlaceData(place);

  final _firebaseStorageRepository = FirebaseStorageRepository();
  Future<UploadTask> uploadFile(String path, File image) =>
      _firebaseStorageRepository.uploadFile(path, image);

  //listado de places
  List<ProfilePlace> myBuildPlaces(List<DocumentSnapshot> placeListSnapshot) =>
      _cloudFirestoreRepository.myBuildPlaces(placeListSnapshot);

  List<ScardImage> buildPlaces(List<DocumentSnapshot> placeListSnapshot) =>
      _cloudFirestoreRepository.buildPlaces(placeListSnapshot);

  singOut() {
    return _authRepository.singOut();
  }

  // final _text$ = StreamController<String>();
  // Stream<String> get text$ => _text$.stream;
  // Sink<String> get text => _text$.sink;

  @override
  void dispose() {
    // _text$.close();
    // TODO: implement dispose
  }
}
