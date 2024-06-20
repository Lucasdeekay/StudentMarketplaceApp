import 'package:flutter/material.dart';
import 'package:student_marketplace/components/route_manager.dart';
import 'package:student_marketplace/pages/my_products.dart';
import 'package:student_marketplace/pages/profile.dart';
import 'package:student_marketplace/pages/search_products.dart';

import '../pages/dashboard.dart';
import '../pages/payment_screen.dart';



Widget BottomBar(BuildContext context, int index, String firstName, String lastName, String email, String matricNumber, String username, String user_id, String phone_number){
  return BottomNavigationBar(
    // Navigation Bar at the bottom
    backgroundColor: Colors.white,
    unselectedItemColor: Colors.grey,
    selectedItemColor: Colors.blueAccent,
    unselectedFontSize: 10.0,
    selectedFontSize: 10.0,
    selectedLabelStyle: const TextStyle(
      fontStyle: FontStyle.italic,
      fontWeight: FontWeight.normal,
    ),
    unselectedLabelStyle: const TextStyle(
      fontStyle: FontStyle.italic,
      fontWeight: FontWeight.normal,
    ),
    items: const [
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.payment),
        label: 'Buy',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.sell),
        label: 'Sell',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.savings),
        label: 'Transaction',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.person),
        label: 'Profile',
      ),
    ],
    type: BottomNavigationBarType.fixed,
    currentIndex: index,
    // Set the current index (active link)
    onTap: (index) {
      // Handle navigation here
      if (index == 0) {
        // Navigate to the Product
        Navigator.of(context).push(createRoute(DashboardScreen(firstName: firstName, lastName: lastName, email: email, matricNumber: matricNumber, username: username, user_id: user_id, phone_number: phone_number,)));
      } else if (index == 1) {
        // Navigate to profile
        Navigator.of(context).push(createRoute(SearchProductScreen(firstName: firstName, lastName: lastName, email: email, matricNumber: matricNumber, username: username, user_id: user_id, phone_number: phone_number,)));
      }
      else if (index == 2) {
        // Navigate to profile
        Navigator.of(context).push(createRoute(MyProductsScreen(firstName: firstName, lastName: lastName, email: email, matricNumber: matricNumber, username: username, user_id: user_id, phone_number: phone_number,)));
      }
      else if (index == 3) {
        // Navigate to profile
        Navigator.of(context).push(createRoute(PaymentScreen(firstName: firstName, lastName: lastName, email: email, matricNumber: matricNumber, username: username, user_id: user_id, phone_number: phone_number,)));
      }
      else if (index == 4) {
        // Navigate to profile
        Navigator.of(context).push(createRoute(ProfileScreen(firstName: firstName, lastName: lastName, email: email, matricNumber: matricNumber, username: username, user_id: user_id, phone_number: phone_number,)));
      }
    },
  );
}