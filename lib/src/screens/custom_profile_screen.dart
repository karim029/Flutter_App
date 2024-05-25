import 'package:faker_app_flutter_firebase/src/screens/ui_auth_providers.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomProfileScreen extends ConsumerWidget {
  const CustomProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
       final authProviders = ref.watch(authProviderProvider);

    return ProfileScreen(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      avatarSize: 64,
      avatarPlaceholderColor: const Color.fromARGB(255, 165, 165, 165),
      showDeleteConfirmationDialog: true,

      providers: authProviders,
     

    );
  }
 }
