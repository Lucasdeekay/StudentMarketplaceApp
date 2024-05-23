import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:student_marketplace/pages/create_product.dart';
import '../components/bottom_nav.dart';
import '../components/route_manager.dart';


class DashboardScreen extends StatefulWidget {
  final String lastName;
  final String firstName;
  final String email;
  final String matricNumber;
  final String username;
  final String user_id;
  final String program;

  const DashboardScreen(
      {Key? key,
        required this.firstName,
        required this.lastName,
        required this.email,
        required this.matricNumber,
        required this.username,
        required this.user_id,
        required this.program})
      : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  String firstName = '';
  String lastName = '';
  String email = '';
  String matricNumber = '';
  String username = '';
  String user_id = '';
  String program = '';
  String balance = '';


  @override
  void initState() {
    super.initState();
    firstName = widget.firstName;
    lastName = widget.lastName;
    email = widget.email;
    matricNumber = widget.matricNumber;
    username = widget.username;
    user_id = widget.user_id;
    program = widget.program;
  }

  Future<void> fetchData() async {

    try {
      final response = await http.get(Uri.parse(
          'https://localhost:8000/dashboard'));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        setState(() {
          balance = data['wallet']['balance'];
        });

      } else {
        // Handle API error
        errorFlushbar(context, 'Error', 'Unable to load data. Check your internet connection');
      }
    } catch (e) {
      // Handle other errors
      errorFlushbar(context, 'Error', 'An error occured');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Builder(
          builder: (context) => Icon(Icons.home),
        ),
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Text(
          'Home',
          style: TextStyle(
            fontFamily: 'Outfit',
            color: Colors.black,
            fontSize: 22,
            letterSpacing: 0,
          ),
        ),
        centerTitle: false,
        elevation: 0,
      ),
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 4,
                        color: Color(0x25090F13),
                        offset: Offset(
                          0.0,
                          2,
                        ),
                      )
                    ],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 16),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Good Morning,',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 24.0,
                            fontFamily: 'Outfit',
                            letterSpacing: 0,
                          ),
                        ),
                        Text(
                          '$lastName $firstName',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16.0,
                            fontFamily: 'Plus Jakarta Sans',
                            color: Colors.grey,
                            letterSpacing: 0,
                          ),
                        ),
                        Divider(
                          height: 24,
                          thickness: 2,
                          color: Colors.grey,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Email',
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 16,
                                      fontFamily: 'Plus Jakarta Sans',
                                      letterSpacing: 0,
                                    ),
                                  ),
                                  Text(
                                    '$email',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14.0,
                                      fontFamily: 'Outfit',
                                      color: Colors.black,
                                      letterSpacing: 0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Matric No',
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 16,
                                      fontFamily: 'Plus Jakarta Sans',
                                      letterSpacing: 0,
                                    ),
                                  ),
                                  Text(
                                    '$matricNumber',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14.0,
                                      fontFamily: 'Outfit',
                                      color: Colors.black,
                                      letterSpacing: 0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 24.0,),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Program',
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 16,
                                      fontFamily: 'Plus Jakarta Sans',
                                      letterSpacing: 0,
                                    ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        '$program',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14.0,
                                          fontFamily: 'Outfit',
                                          color: Colors.black,
                                          letterSpacing: 0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 24.0,),
                        Divider(
                          height: 24,
                          thickness: 2,
                          color: Colors.grey,
                        ),
                        Text(
                          'Wallet Balance',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 24.0,
                            fontFamily: 'Outfit',
                            letterSpacing: 0,
                          ),
                        ),
                        Text(
                          '#$balance',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16.0,
                            fontFamily: 'Plus Jakarta Sans',
                            color: Colors.grey,
                            letterSpacing: 0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 12, 0, 0),
                child: Text(
                  'The student marketplace allows you to sell your products fellow students. EASY CONNECT!!!',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    fontStyle: FontStyle.italic,
                    fontFamily: 'Plus Jakarta Sans',
                    color: Colors.grey,
                    letterSpacing: 0,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 12, 0, 0),
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
                              createRoute(CreateProductScreen())
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
                                  Icons.shopping_cart,
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
                                'Add New Product',
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
      bottomNavigationBar: BottomBar(context, 0, firstName, lastName, email,
          matricNumber, username, user_id, program),
    );
  }
}
