import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:student_marketplace/pages/payment_success.dart';

import '../components/alert_manager.dart';
import '../components/route_manager.dart';
import 'my_products.dart';
import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:uuid/uuid.dart';


class PurchaseProductScreen extends StatefulWidget {
  final String product_id;
  final String title;
  final String description;
  final String price;
  final String available_quantity;
  final String image;
  final String user_id;

  const PurchaseProductScreen({required this.product_id, required this.title, required this.description, required this.price, required this.available_quantity, required this.image, required this.user_id});

  @override
  State<PurchaseProductScreen> createState() => _PurchaseProductScreenState();
}

class _PurchaseProductScreenState extends State<PurchaseProductScreen> {

  String product_id = '';
  String title = '';
  String description = '';
  String price = '';
  String available_quantity = '';
  String image = '';
  String user_id = '';
  String email = '';
  String txRef = '';

  TextEditingController quantityController = TextEditingController();

  var publicKey = 'pk_test_0f30abd4793da6f7064c7a7fafd0fefa0c9d50d9';
  final plugin = PaystackPlugin();

  @override
  void initState() {
    super.initState();
    plugin.initialize(publicKey: publicKey);
    generateTransactionRef();
    product_id = widget.product_id;
    title = widget.title;
    description = widget.description;
    price = widget.price;
    available_quantity = widget.available_quantity;
    image = widget.image;
    user_id = widget.user_id;
    fetchData();
  }

  void generateTransactionRef() {
    const uuid = Uuid();
    txRef = uuid.v4();
  }

  Future<void> fetchData() async {

    try {
      final response = await http.get(Uri.parse(
          'https://studentmarketplace.pythonanywhere.com/dashboard/?user_id=$user_id/'));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        setState(() {
          email = data['student']['email'];
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
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: CachedNetworkImage(
                            fadeInDuration: Duration(milliseconds: 500),
                            fadeOutDuration: Duration(milliseconds: 500),
                            imageUrl:
                            image,
                            width: MediaQuery
                                .sizeOf(context)
                                .width * 0.9,
                            height: 250,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 12, 0, 0),
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'Plus Jakarta Sans',
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const Divider(
                    height: 36,
                    thickness: 1,
                    color: Color(0xFFE0E3E7),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(24, 24, 24, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Price',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.normal,
                            fontFamily: 'Plus Jakarta Sans',
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          '#$price',
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.normal,
                            fontFamily: 'Plus Jakarta Sans',
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(24, 24, 24, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Available Quantity',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.normal,
                            fontFamily: 'Plus Jakarta Sans',
                            color: Colors.black,
                          ),
                        ),
                        Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                250, 0, 0, 0),
                            child: Row(
                              children: [
                                Text(
                                  available_quantity,
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: 'Plus Jakarta Sans',
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            )
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(24, 24, 24, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Description',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.normal,
                            fontFamily: 'Plus Jakarta Sans',
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          description,
                          style: const TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.normal,
                            fontFamily: 'Plus Jakarta Sans',
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    height: 36,
                    thickness: 1,
                    color: Color(0xFFE0E3E7),
                  ),
                  Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16, 12, 8, 0),
                      child: TextFormField(
                        controller: quantityController,
                        textCapitalization: TextCapitalization.words,
                        decoration: InputDecoration(
                          labelText: 'Enter Your Preferred Quantity',
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14.0,
                            color: Colors.grey,
                            letterSpacing: 0,
                          ),
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
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter your quantity';
                          }
                          return null;
                        },
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
                          child: const Text('Purchase Product'),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 48.0,),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void initiatePayment() async {
    final amount = int.parse(price) * int.parse(quantityController.text);
    Charge charge = Charge()
      ..amount = amount * 100
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
        savePaymentData(quantityController.text, product_id, user_id);
        successFlushbar(context, "Success", 'Payment Successful!');
        Navigator.of(context).push(createRoute(PaymentSuccessScreen()));
      } else {
        // Payment failed
        errorFlushbar(context, "Error", 'Payment Failed!');
      }
    } catch (e) {
      // Handle payment errors or exceptions
      errorFlushbar(context, "Error", "An error occured!");
    }
  }

  void savePaymentData(String quantity, String product_id, String user_id) async {
    var apiUrl = 'https://studentmarketplace.pythonanywhere.com/products/details/purchase/?user_id=$user_id/';
    final headers = {'Content-Type': 'application/json'};
    final data = {
      'product_id': product_id,
      'quantity': quantity,
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
