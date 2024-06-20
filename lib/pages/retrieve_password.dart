import 'package:flutter/material.dart';
import 'package:student_marketplace/components/nav_arrow.dart';
import 'package:student_marketplace/pages/sign_in.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../components/alert_manager.dart';
import '../components/route_manager.dart';

class RetrievePasswordScreen extends StatefulWidget {
  final String user;

  const RetrievePasswordScreen({Key? key, required this.user}) : super(key: key);

  @override
  _RetrievePasswordScreenState createState() => _RetrievePasswordScreenState();
}

class _RetrievePasswordScreenState extends State<RetrievePasswordScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  late bool passwordVisibility = true;
  late bool confirmPasswordVisibility = true;

  String _user = "";

  @override
  void initState(){
    super.initState();
    _user = widget.user;
  }

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
                        'Reset Password',
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
                            'Enter a strong password.',
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
                                    'Password',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.normal,
                                      fontFamily: 'Plus Jakarta Sans',
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                TextFormField(
                                  controller: passwordController,
                                  autofillHints: [AutofillHints.password],
                                  textInputAction: TextInputAction.done,
                                  obscureText: passwordVisibility,
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
                                    suffixIcon: InkWell(
                                      onTap: () => setState(
                                            () => passwordVisibility =
                                        !passwordVisibility,
                                      ),
                                      focusNode:
                                      FocusNode(skipTraversal: true),
                                      child: Icon(
                                        !passwordVisibility
                                            ? Icons.visibility_outlined
                                            : Icons.visibility_off_outlined,
                                        color: Colors.grey,
                                        size: 18,
                                      ),
                                    ),
                                  ),
                                  style: const TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: 'Plus Jakarta Sans',
                                    color: Colors.black,
                                    height: 1,
                                  ),
                                  minLines: 1,
                                  keyboardType: TextInputType.visiblePassword,
                                  cursorColor: Colors.blue,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Password is required';
                                    }
                                    return null;
                                  },
                                ),
                              ],
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
                                    'Confirm Password',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.normal,
                                      fontFamily: 'Plus Jakarta Sans',
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                TextFormField(
                                  controller: confirmPasswordController,
                                  autofillHints: [AutofillHints.password],
                                  textInputAction: TextInputAction.done,
                                  obscureText: confirmPasswordVisibility,
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
                                    suffixIcon: InkWell(
                                      onTap: () => setState(
                                            () => confirmPasswordVisibility =
                                        !confirmPasswordVisibility,
                                      ),
                                      focusNode:
                                      FocusNode(skipTraversal: true),
                                      child: Icon(
                                        !confirmPasswordVisibility
                                            ? Icons.visibility_outlined
                                            : Icons.visibility_off_outlined,
                                        color: Colors.grey,
                                        size: 18,
                                      ),
                                    ),
                                  ),
                                  style: const TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: 'Plus Jakarta Sans',
                                    color: Colors.black,
                                    height: 1,
                                  ),
                                  minLines: 1,
                                  keyboardType: TextInputType.visiblePassword,
                                  cursorColor: Colors.blue,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Confirm Password is required';
                                    } else if (value != passwordController.text) {
                                      return 'Passwords do not match';
                                    }
                                    return null; // Return null if the field is valid
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
                              if (_formKey.currentState!.validate()) {
                                String password = passwordController.text;

                                infoFlushbar(context, "Loading...", "Signing in your account...");

                                final response = await http.post(
                                  Uri.parse('https://studentmarketplace.pythonanywhere.com/retrieve_password'),
                                  headers: {
                                    'Content-Type': 'application/json',
                                  },
                                  body: jsonEncode({
                                    'user_id': _user,
                                    'password': password,
                                  }),
                                );

                                if (response.statusCode == 200) {
                                  // Login successful! Parse the response (replace with your actual data structure)
                                  var data = jsonDecode(response.body);
                                  String successMessage = data['success'];

                                  successFlushbar(context, "Success", successMessage);
                                  Future.delayed(Duration(seconds: 3), () {
                                    // Pass the token to the home screen (or handle it appropriately)
                                    Navigator.of(context).push(createRoute(SignInScreen()));
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
                            child: const Text('Change Password'),
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
