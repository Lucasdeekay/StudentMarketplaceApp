import 'package:flutter/material.dart';
import 'package:student_marketplace/pages/sign_in.dart';
import 'package:student_marketplace/pages/sign_up.dart';

import '../components/route_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();

}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min, // Center content vertically
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.25), // Top padding
            Padding(
              padding: const EdgeInsets.only(top: 24.0), // Spacing after logo
              child: RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: 'Student Marketplace',
                      style: TextStyle(
                        fontSize: 32.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 180.0), // Spacing after text
            ElevatedButton(
              onPressed: () {
                // Handle button press action
                Navigator.of(context).push(createRoute(SignUpScreen()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent, // Button color
                foregroundColor: Colors.white, // Text color on button
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(36.0), // Button corner radius
                ),
                minimumSize: const Size(250, 50), // Set minimum button size
              ),
              child: const Text('Get Started'),
            ),
            const SizedBox(height: 16.0), // Small spacing after button
            Row(
              mainAxisAlignment: MainAxisAlignment.center, // Center row content
              children: [
                const Text(
                  'Already a member? ',
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.black54, // Lighter text color
                  ),
                ),
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    // Handle "Sign In" tap (e.g., navigate to sign in screen)
                    Navigator.of(context).push(createRoute(SignInScreen()));
                  },
                  child: const Text(
                    'Sign In',
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.black, // Lighter text color
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 64.0),
          ],
        ),
      ),
    );
  }
}
