import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:faker_app_flutter_firebase/src/data/job.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/foundation.dart';

class FirestoreRepository {
  final FirebaseFirestore _firestore;

  FirestoreRepository(this._firestore);

  Future<void> addJob(
          {required String uid,
          required String title,
          required String company}) =>
      _firestore.collection('jobs').add({
        'uid': uid,
        'title': title,
        'company': company,
      });

  Future<void> updateJob(
          {required String uid,
          required String jobId,
          required String title,
          required String company}) =>
      _firestore.doc('jobs/$jobId').update({
        'uid': uid,
        'title': title,
        'company': company,
      });

  Future<void> deleteJob(String uid, String jobId) {
    return _firestore.doc('jobs/$jobId').delete();
  }

  Query<Job> jobsQuery() {
    return _firestore.collection('jobs').withConverter(
          fromFirestore: (snapshot, options) => Job.fromMap(snapshot.data()!),
          toFirestore: (job, options) => job.toMap(),
        );
  }
}

final firestoreRepositoryProvider = Provider<FirestoreRepository>(
  (ref) => FirestoreRepository(FirebaseFirestore.instance),
);
