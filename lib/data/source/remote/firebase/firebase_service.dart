import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../model/audio_model.dart';
import '../../../model/book_model.dart';
import '../../../model/category_model.dart';

class FirebaseService {
  final _firebaseAuth = FirebaseAuth.instance;
  final _firebaseStorage = FirebaseStorage.instance;
  final _firebaseFirestore = FirebaseFirestore.instance;

  // Future<bool> registerAccount(String email, String password) async {
  //   try {
  //     final register = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
  //
  //     if ()
  //   }
  // }

  signInFacebook() async {

  }

  Future<User?> signInGoogle() async {
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

    User? user;

    if (gUser != null) {
      final GoogleSignInAuthentication auth = await gUser.authentication;

      final credential = GoogleAuthProvider.credential(
          accessToken: auth.accessToken,
          idToken: auth.idToken
      );

      try {
        user = (await _firebaseAuth.signInWithCredential(credential)).user;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'account-exists-with-different-credential') {
          // handle the error here
        }
        else if (e.code == 'invalid-credential') {
          // handle the error here
        }
      }
    }

    return user;
  }

  Future<List<CategoryModel>> getAllCategories() async {
    final snapshot = await _firebaseFirestore
        .collection('categories')
        .get();

    return List.generate(
        snapshot.docs.length,
            (index) => CategoryModel.fromJson(
                snapshot.docs[index].data(),
                snapshot.docs[index].id
            )
    );
  }

  Future<List<BookModel>> getAllBooks() async {
    final snapshot = await _firebaseFirestore
        .collection('books')
        .get();

    return List.generate(
        snapshot.docs.length,
            (index) => BookModel.fromJson(
            snapshot.docs[index].data(),
            snapshot.docs[index].id
        )
    );
  }

  Future<List<AudioModel>> getAllAudios(String bookName) async {
    final audios = await _firebaseStorage
        .ref()
        .child('audio/$bookName/')
        .list();

    var list = List.generate(audios.items.length, (index) => AudioModel.fromJson(audios.items[index].name));

    return list;
  }

  Future<String> downloadAudio(String bookName, String audioName) async {
    final audioUrl = await _firebaseStorage
        .ref()
        .child('audio/$bookName/$audioName')
        .getDownloadURL();

    return audioUrl;
  }
}