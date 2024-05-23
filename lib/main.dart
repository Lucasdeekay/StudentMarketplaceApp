import 'package:flutter/material.dart';
import 'package:student_marketplace/pages/dashboard.dart';
import 'package:student_marketplace/pages/my_products.dart';
import 'package:student_marketplace/pages/payment_screen.dart';
import 'package:student_marketplace/pages/payment_success.dart';
import 'package:student_marketplace/pages/product_detail.dart';
import 'package:student_marketplace/pages/profile.dart';
import 'package:student_marketplace/pages/purchase_product.dart';
import 'package:student_marketplace/pages/search_products.dart';
import 'package:student_marketplace/pages/splash.dart';
import 'package:student_marketplace/pages/support.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student Marketplace',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
      // home: const PurchaseProductScreen(product_id: '2', title: 'Shoe', description: 'My shoes', price: '450', available_quantity: '35', image: 'https://unsplash.com/photos/a-couple-of-people-sitting-next-to-each-other-HTP5klp7fn4',),
      // home: const DashboardScreen(firstName: 'John', lastName: 'Marlo', email: 'jmarllo@gmail.com', matricNumber: 'DU9843', username: 'JohnMarlo', user_id: '2', program: 'Computer Science'),
    );
  }
}
