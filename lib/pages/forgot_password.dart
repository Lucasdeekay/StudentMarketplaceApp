import 'package:flutter/material.dart';
import 'package:student_marketplace/components/nav_arrow.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:student_marketplace/pages/retrieve_password.dart';
import '../components/alert_manager.dart';
import '../components/route_manager.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  final emailRegex = RegExp(r"[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(24),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    NavigateArrow(),
                    const Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                      child: Text(
                        'Forgot Password',
                        style: TextStyle(
                          fontSize: 28.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Plus Jakarta Sans',
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Form(
                      key: _formKey,
                      autovalidateMode: AutovalidateMode.disabled,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'We\'ll send you an email to reset your password.',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.black87,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 18, 0, 0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 4),
                                  child: Text(
                                    'Email',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.normal,
                                      fontFamily: 'Plus Jakarta Sans',
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                TextFormField(
                                  controller: emailController,
                                  autofillHints: [AutofillHints.email],
                                  textInputAction: TextInputAction.next,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Color(0x00000000),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Color(0x00000000),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Color(0x00000000),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Color(0x00000000),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    filled: true,
                                    fillColor: Colors.white,
                                  ),
                                  style: const TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: 'Plus Jakarta Sans',
                                    color: Colors.black,
                                    height: 1,
                                  ),
                                  minLines: 1,
                                  keyboardType: TextInputType.emailAddress,
                                  cursorColor: Colors.blue,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Email is required';
                                    } else if (!emailRegex.hasMatch(value)) {
                                      return 'Invalid Email Address';
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () async {
                              // Handle button press action
                              if (_formKey.currentState!.validate()) {
                                String email = emailController.text;

                                infoFlushbar(context, "Loading...", "Signing in your account...");

                                final response = await http.post(
                                  Uri.parse('https://studentmarketplace.pythonanywhere.com/forgot_password'),
                                  headers: {
                                    'Content-Type': 'application/json',
                                  },
                                  body: jsonEncode({
                                    'email': email,
                                  }),
                                );

                                if (response.statusCode == 200) {
                                  // Login successful! Parse the response (replace with your actual data structure)
                                  var data = jsonDecode(response.body);
                                  String successMessage = data['success'];

                                  successFlushbar(context, "Success", successMessage);
                                  Future.delayed(Duration(seconds: 3), () {
                                    // Pass the token to the home screen (or handle it appropriately)
                                    Navigator.of(context).push(createRoute(RetrievePasswordScreen(user: '${data['user_id']}',)));
                                  });
                                } else {
                                  // Login failed! Parse the error message (replace with your actual error handling)
                                  var error = jsonDecode(response.body);
                                  String errorMessage = error['error']; // Assuming your response contains an 'error' key

                                  errorFlushbar(context, "Error", errorMessage);
                                }
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blueAccent, // Button color
                              foregroundColor: Colors.white, // Text color on button
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(36.0), // Button corner radius
                              ),
                              minimumSize: const Size(250, 50), // Set minimum button size
                            ),
                            child: const Text('Reset Password'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
