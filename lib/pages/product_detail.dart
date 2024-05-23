import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../components/alert_manager.dart';
import '../components/route_manager.dart';
import 'my_products.dart';


class ProductDetailScreen extends StatefulWidget {
  final String product_id;
  final String title;
  final String description;
  final String price;
  final String available_quantity;
  final String image;

  const ProductDetailScreen({required this.product_id, required this.title, required this.description, required this.price, required this.available_quantity, required this.image});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {

  String product_id = '';
  String title = '';
  String description = '';
  String price = '';
  String available_quantity = '';
  String category = '';
  String image = '';

  @override
  void initState() {
    super.initState();
    product_id = widget.product_id;
    title = widget.title;
    description = widget.description;
    price = widget.price;
    available_quantity = widget.available_quantity;
    image = widget.image;
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
                    padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () async {
                            // Handle button press action
                            final response = await http.delete(
                              Uri.parse('https://localhost:8000/products/$product_id/delete')
                            );

                            if (response.statusCode == 200) {
                              // Login successful! Parse the response (replace with your actual data structure)
                              var data = jsonDecode(response.body);
                              String successMessage = data['success'];

                              successFlushbar(context, "Success", successMessage);
                              Future.delayed(Duration(seconds: 3), () {
                                // Pass the token to the home screen (or handle it appropriately)
                                Navigator.of(context).pushAndRemoveUntil(
                                  createRoute(MyProductsScreen(firstName:data['first_name'], lastName: data['last_name'], email: data['email'], matricNumber: data['matric_no'], username: data['username'], user_id: data['user_id'], program: data['program'],)),
                                      (route) => false,
                                );
                              });
                            } else {
                              // Login failed! Parse the error message (replace with your actual error handling)
                              var error = jsonDecode(response.body);
                              String errorMessage = error[
                              'error']; // Assuming your response contains an 'error' key

                              errorFlushbar(context, "Error", errorMessage);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.redAccent, // Button color
                            foregroundColor: Colors.white, // Text color on button
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(36.0), // Button corner radius
                            ),
                            minimumSize: const Size(250, 50), // Set minimum button size
                          ),
                          child: const Text('Delete Product'),
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
    );
  }
}
