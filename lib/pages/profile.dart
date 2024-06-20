import 'package:flutter/material.dart';
import 'package:student_marketplace/pages/retrieve_password.dart';
import 'package:student_marketplace/pages/splash.dart';
import 'package:http/http.dart' as http;
import 'package:student_marketplace/pages/support.dart';
import '../components/bottom_nav.dart';
import '../components/greeting.dart';
import '../components/route_manager.dart';

class ProfileScreen extends StatefulWidget {
  final String firstName;
  final String lastName;
  final String email;
  final String matricNumber;
  final String username;
  final String user_id;
  final String phone_number;

  const ProfileScreen({Key? key, required this.firstName, required this.lastName, required this.email, required this.matricNumber, required this.username, required this.user_id, required this.phone_number}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String firstName = '';
  String lastName = '';
  String email = '';
  String matricNumber = '';
  String username = '';
  String user_id = '';
  String phone_number = '';

  @override
  void initState() {
    super.initState();
    firstName = widget.firstName;
    lastName = widget.lastName;
    email = widget.email;
    matricNumber = widget.matricNumber;
    username = widget.username;
    user_id = widget.user_id;
    phone_number = widget.phone_number;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Align(
              alignment: AlignmentDirectional(0, 0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24, 24, 24, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 36, 0, 6),
                      child: Text(
                        greeting(),
                        style: const TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.normal,
                          fontStyle: FontStyle.italic,
                          fontFamily: 'Plus Jakarta Sans',
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 6),
                      child: Text(
                        'Welcome $username',
                        style: const TextStyle(
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Plus Jakarta Sans',
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: Colors.blueAccent,
                          ),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(18),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Thank you for supporting us!',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.normal,
                                  fontFamily: 'Plus Jakarta Sans',
                                  color: Colors.white,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0, 6, 0, 0),
                                child: Text(
                                  'As a local business, we thank you for supporting us and hope you enjoy.',
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: 'Plus Jakarta Sans',
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0, 12, 0, 12),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                Navigator.of(context).push(
                                  createRoute(RetrievePasswordScreen(user: user_id,))
                                );
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    width: 40,
                                    height: 40,
                                    decoration: const BoxDecoration(
                                      color: Colors.blueAccent,
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Padding(
                                      padding: EdgeInsets.all(4),
                                      child: Icon(
                                        Icons.settings,
                                        color:Colors.white,
                                        size: 16,
                                      ),
                                    ),
                                  ),
                                  const Padding(
                                    padding:
                                    EdgeInsetsDirectional.fromSTEB(
                                        18, 0, 0, 0),
                                    child: Text(
                                      'Settings',
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.normal,
                                        fontFamily: 'Plus Jakarta Sans',
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0, 12, 0, 12),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                Navigator.of(context).push(
                                  createRoute(SupportScreen(user: user_id,))
                                );
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    width: 40,
                                    height: 40,
                                    decoration: const BoxDecoration(
                                      color: Colors.blueAccent,
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Padding(
                                      padding: EdgeInsets.all(4),
                                      child: Icon(
                                        Icons.support_agent,
                                        color:Colors.white,
                                        size: 16,
                                      ),
                                    ),
                                  ),
                                  const Padding(
                                    padding:
                                    EdgeInsetsDirectional.fromSTEB(
                                        18, 0, 0, 0),
                                    child: Text(
                                      'Contact Support',
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.normal,
                                        fontFamily: 'Plus Jakarta Sans',
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0, 12, 0, 12),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                final response = await http.post(
                                  Uri.parse('https://studentmarketplace.pythonanywhere.com/logout'),
                                  headers: {
                                    'Content-Type': 'application/json',
                                  },
                                );
                                Navigator.of(context).pushAndRemoveUntil(
                                  createRoute(SplashScreen()),
                                      (route) => false,
                                );
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    width: 40,
                                    height: 40,
                                    decoration: const BoxDecoration(
                                      color: Colors.blueAccent,
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Padding(
                                      padding: EdgeInsets.all(4),
                                      child: Icon(
                                        Icons.logout,
                                        color:Colors.white,
                                        size: 16,
                                      ),
                                    ),
                                  ),
                                  const Padding(
                                    padding:
                                    EdgeInsetsDirectional.fromSTEB(
                                        18, 0, 0, 0),
                                    child: Text(
                                      'Log out',
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.normal,
                                        fontFamily: 'Plus Jakarta Sans',
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomBar(context, 4, firstName, lastName, email, matricNumber, username, user_id, phone_number),
    );
  }
}
