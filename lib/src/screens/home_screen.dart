import 'package:faker/faker.dart';
import 'package:faker_app_flutter_firebase/src/data/firestore_repository.dart';
import 'package:faker_app_flutter_firebase/src/routing/app_router.dart';
import 'package:faker_app_flutter_firebase/widgets/job_list.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            'My Jobs',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.person,
                color: Colors.white,
              ),
              onPressed: () => context.goNamed(AppRoute.profile.name),
            )
          ]),
          body: const JobsListView(),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        child: const Icon(Icons.add),
        onPressed: () {
          final user = ref.read(firebaseAuthProvider).currentUser;
          final faker = Faker();
          final title  = faker.job.title();
          final company = faker.company.name();

          ref.read(firestoreRepositoryProvider).addJob(
                uid: user!.uid,
                title: title,
                company: company,
              );
        },
      ),
    );
  }
}


  
