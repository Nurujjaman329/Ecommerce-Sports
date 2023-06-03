import 'package:ecommerceapp/provider/cart_provider.dart';
import 'package:ecommerceapp/provider/product_provider.dart';
import 'package:ecommerceapp/vendor/views/auth/screens/landing_screen.dart';
import 'package:ecommerceapp/vendor/views/auth/screens/main_vendor_screens.dart';
import 'package:ecommerceapp/vendor/views/auth/screens/upload_screen.dart';
import 'package:ecommerceapp/vendor/views/auth/vendors_auth.dart';
import 'package:ecommerceapp/views/buyers/auth/login_screen.dart';
import 'package:ecommerceapp/views/buyers/main_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) {
      return ProductProvider();
    }),
    ChangeNotifierProvider(create: (_) {
      return CartProvider();
    })
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
      builder: EasyLoading.init(),
    );
  }
}
