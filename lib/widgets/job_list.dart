
import 'package:faker_app_flutter_firebase/src/data/firestore_repository.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class JobsListView extends ConsumerWidget {
  const JobsListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final firestoreRepository = ref.read(firestoreRepositoryProvider);
    return FirestoreListView(query: firestoreRepository.jobsQuery(),itemBuilder: (context, doc) {
      return ListTile(
        title: Text(doc['title']),
        subtitle:Text(doc['company']) ,
      );
    },);
  }
}