import 'package:ecommerceapp/vendor/views/auth/screens/landing_screen.dart';
import 'package:ecommerceapp/vendor/views/auth/screens/main_vendor_screens.dart';
import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
import 'package:flutter/material.dart';

import 'package:flutterfire_ui/auth.dart';

class VendorAuthScreen extends StatelessWidget {
  const VendorAuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      // If the user is already signed-in, use it as initial data
      initialData: FirebaseAuth.instance.currentUser,
      builder: (context, snapshot) {
        // User is not signed in
        if (!snapshot.hasData) {
          return SignInScreen(providerConfigs: [
            EmailProviderConfiguration(),
            GoogleProviderConfiguration(
                clientId: '1:573827726190:android:7ed7cfbd8c5ffbdafa5f7f'),
            PhoneProviderConfiguration(),
          ]);
        }

        // Render your application if authenticated
        return MainVendorScreen();
      },
    );
  }
}
