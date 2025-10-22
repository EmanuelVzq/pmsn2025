import 'package:cloud_firestore/cloud_firestore.dart';

class SongsFirebase{
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  CollectionReference? songsColection;
  SongsFirebase(){
  songsColection = firebaseFirestore.collection('songs');
  }

  Future<void> insert(Map<String, dynamic> song) async{
    songsColection!.doc().set(song);
  }

  Future<void> update(Map<String, dynamic> song, String id) async{
    songsColection!.doc().update(song);
  }

  Future<void> delete( String id) async{
    songsColection!.doc().delete();
  }

  Stream<QuerySnapshot> selectAll() {
    return songsColection!.snapshots();
  }
  
}