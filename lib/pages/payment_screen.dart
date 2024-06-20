import 'package:flutter/material.dart';
import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:http/http.dart' as http;
import 'package:student_marketplace/pages/payment_success.dart';
import 'dart:convert';
import 'package:uuid/uuid.dart';
import '../components/alert_manager.dart';
import '../components/bottom_nav.dart';
import '../components/nav_arrow.dart';
import '../components/route_manager.dart';

class PaymentScreen extends StatefulWidget {
  final String lastName;
  final String firstName;
  final String email;
  final String matricNumber;
  final String username;
  final String user_id;
  final String phone_number;

  const PaymentScreen(
      {Key? key,
        required this.firstName,
        required this.lastName,
        required this.email,
        required this.matricNumber,
        required this.username,
        required this.user_id,
        required this.phone_number})
      : super(key: key);

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController amountController = TextEditingController();
  String? description;
  String txRef = '';
  String fullName = '';

  String firstName = '';
  String lastName = '';
  String email = '';
  String matricNumber = '';
  String username = '';
  String user_id = '';
  String phone_number = '';

  final emailRegex = RegExp(r"[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*");

  var publicKey = 'pk_test_0f30abd4793da6f7064c7a7fafd0fefa0c9d50d9';
  final plugin = PaystackPlugin();

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
    plugin.initialize(publicKey: publicKey);
    generateTransactionRef();
  }

  void generateTransactionRef() {
    const uuid = Uuid();
    txRef = uuid.v4();
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
                        'Deposit/Withdrawal',
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
                            'Kindly make your deposit/withdrawal seamlessly within our app',
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
                                    'Transaction Type',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.normal,
                                      fontFamily: 'Plus Jakarta Sans',
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 16),
                                  child: Container(
                                    width: double.infinity,
                                    child: DropdownButtonFormField<String>(
                                      value: description,
                                      hint: Row(
                                        children: <Widget>[
                                          Text(
                                              'Select Payment Description',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 16.0,
                                                fontFamily: 'Plus Jakarta Sans',
                                                letterSpacing: 0,
                                                color: Colors.black,
                                              )
                                          ),
                                        ],
                                      ),
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          description = newValue;
                                        });
                                      },
                                      items: [
                                        'Deposit',
                                        'Withdrawal',
                                      ].map((String desc) {
                                        return DropdownMenuItem<String>(
                                          value: desc,
                                          child: Row(
                                            children: <Widget>[
                                              Text(
                                                  desc,
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 16.0,
                                                    fontFamily: 'Plus Jakarta Sans',
                                                    letterSpacing: 0,
                                                    color: Colors.black,
                                                  )
                                              ),
                                            ],
                                          ),
                                        );
                                      }).toList(),
                                      dropdownColor: Colors.grey[100],
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
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'This field is required';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                ),
                                const Padding(
                                  padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 4),
                                  child: Text(
                                    'Amount',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.normal,
                                      fontFamily: 'Plus Jakarta Sans',
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                TextFormField(
                                  controller: amountController,
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
                                  keyboardType: TextInputType.number,
                                  cursorColor: Colors.blue,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Amount is required';
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
                              await plugin.initialize(publicKey: publicKey);
                              initiatePayment();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blueAccent, // Button color
                              foregroundColor: Colors.white, // Text color on button
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(36.0), // Button corner radius
                              ),
                              minimumSize: const Size(250, 50), // Set minimum button size
                            ),
                            child: const Text('Process Transaction'),
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
      bottomNavigationBar: BottomBar(context, 3, firstName, lastName, email,
          matricNumber, username, user_id, phone_number),
    );
  }

  void initiatePayment() async {
    final amount = amountController.text;
    Charge charge = Charge()
      ..amount = int.parse(amount) * 100
      ..email = email
      ..reference = txRef
      ..currency = 'NGN';

    try {
      CheckoutResponse response = await plugin.checkout(
        context,
        method: CheckoutMethod.card,
        charge: charge,
      );

      if (response.status == true) {
        // Payment successful
        savePaymentData(amount, description!);
        successFlushbar(context, "Success", 'Transaction Successful!');
        Navigator.of(context).push(createRoute(PaymentSuccessScreen()));
      } else {
        // Payment failed
        errorFlushbar(context, "Error", 'Transaction Failed!');
      }
    } catch (e) {
      // Handle payment errors or exceptions
      errorFlushbar(context, "Error", "An error occured!");
    }
  }

  void savePaymentData(String amount, String description) async {
    String apiUrl;
    description == 'Deposit' ? apiUrl = 'https://studentmarketplace.pythonanywhere.com/wallet/deposit/?user_id=$user_id/' : apiUrl = 'https://studentmarketplace.pythonanywhere.com/wallet/withdraw/?user_id=$user_id/';
    final headers = {'Content-Type': 'application/json'};
    final data = {
      'amount': amount,
    };

    final response = await http.post(
      Uri.parse(apiUrl),
      headers: headers,
      body: json.encode(data),
    );

    if (response.statusCode == 201) {
      null;
    } else {
      errorFlushbar(context, "Error", "Payment Failed! Check your internet connection.");
    }
  }
}
