import 'package:cloud_firestore/cloud_firestore.dart';

abstract class FirestoreDatabaseProvider {
  static FirebaseFirestore get db => FirebaseFirestore.instance;
}
