import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:student_marketplace/pages/sign_in.dart';
import '../components/nav_arrow.dart';
import '../components/alert_manager.dart';
import '../components/route_manager.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController matricNoController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late bool passwordVisibility = true;

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
                        'Sign Up',
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
                        children: [
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
                                    'Last Name',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.normal,
                                      fontFamily: 'Plus Jakarta Sans',
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                TextFormField(
                                  controller: lastNameController,
                                  autofillHints: [AutofillHints.familyName],
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
                                  keyboardType: TextInputType.text,
                                  cursorColor: Colors.blue,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Last Name is required';
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
                                    'First Name',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.normal,
                                      fontFamily: 'Plus Jakarta Sans',
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                TextFormField(
                                  controller: firstNameController,
                                  autofillHints: [AutofillHints.familyName],
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
                                  keyboardType: TextInputType.text,
                                  cursorColor: Colors.blue,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'First Name is required';
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
                                    'Matric No',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.normal,
                                      fontFamily: 'Plus Jakarta Sans',
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                TextFormField(
                                  controller: matricNoController,
                                  autofillHints: [AutofillHints.familyName],
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
                                  keyboardType: TextInputType.text,
                                  cursorColor: Colors.blue,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Matric No is required';
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
                                    'Phone Number',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.normal,
                                      fontFamily: 'Plus Jakarta Sans',
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                TextFormField(
                                  controller: phoneNumberController,
                                  autofillHints: [AutofillHints.telephoneNumberExtension],
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
                                  keyboardType: TextInputType.phone,
                                  cursorColor: Colors.blue,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Phone Number is required';
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
                                    'Bio',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.normal,
                                      fontFamily: 'Plus Jakarta Sans',
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                TextFormField(
                                  controller: bioController,
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
                                  minLines: 2,
                                  maxLines: 4,
                                  keyboardType: TextInputType.text,
                                  cursorColor: Colors.blue,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Bio is required';
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
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 24, 0, 40),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () async {
                              // Handle button press action
                              if (_formKey.currentState!.validate()) {
                                String lastName = lastNameController.text;
                                String firstName = firstNameController.text;
                                String matricNo = matricNoController.text;
                                String email = emailController.text;
                                String phoneNumber = phoneNumberController.text;
                                String bio = bioController.text;
                                String password = passwordController.text;

                                infoFlushbar(context, "Loading...", "Signing in your account...");

                                final response = await http.post(
                                  Uri.parse('https://studentmarketplace.pythonanywhere.com/register'),
                                  headers: {
                                    'Content-Type': 'application/json',
                                  },
                                  body: jsonEncode({
                                    'last_name': lastName,
                                    'first_name': firstName,
                                    'matric_number': matricNo,
                                    'bio': bio,
                                    'phone_number': phoneNumber,
                                    'email': email,
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
                                    Navigator.of(context).pushAndRemoveUntil(
                                      createRoute(SignInScreen()),
                                          (route) => false,
                                    );
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
                              minimumSize: const Size(200, 50), // Set minimum button size
                            ),
                            child: const Text('Create Account'),
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