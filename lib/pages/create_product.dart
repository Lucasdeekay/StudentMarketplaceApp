import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:student_marketplace/pages/sign_in.dart';
import '../components/nav_arrow.dart';
import '../components/alert_manager.dart';
import '../components/route_manager.dart';

class CreateProductScreen extends StatefulWidget {
  const CreateProductScreen({Key? key}) : super(key: key);

  @override
  _CreateProductScreenState createState() => _CreateProductScreenState();
}

class _CreateProductScreenState extends State<CreateProductScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController imageController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
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
                        'Add New Product',
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
                                    'Product Name',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.normal,
                                      fontFamily: 'Plus Jakarta Sans',
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                TextFormField(
                                  controller: nameController,
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
                                      return 'Product Name is required';
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
                                    'Price',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.normal,
                                      fontFamily: 'Plus Jakarta Sans',
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                TextFormField(
                                  controller: priceController,
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
                                  keyboardType: TextInputType.number,
                                  cursorColor: Colors.blue,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Price is required';
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
                                    'Quantity',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.normal,
                                      fontFamily: 'Plus Jakarta Sans',
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                TextFormField(
                                  controller: quantityController,
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
                                  keyboardType: TextInputType.number,
                                  cursorColor: Colors.blue,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Quantity is required';
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
                                    'Image url',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.normal,
                                      fontFamily: 'Plus Jakarta Sans',
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                TextFormField(
                                  controller: imageController,
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
                                  keyboardType: TextInputType.url,
                                  cursorColor: Colors.blue,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Image url is required';
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
                                    'Description',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.normal,
                                      fontFamily: 'Plus Jakarta Sans',
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                TextFormField(
                                  controller: descriptionController,
                                  textInputAction: TextInputAction.done,
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
                                  minLines: 3,
                                  maxLines: 4,
                                  keyboardType: TextInputType.text,
                                  cursorColor: Colors.blue,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Description is required';
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
                                String name = nameController.text;
                                String price = priceController.text;
                                String quantity = quantityController.text;
                                String image = imageController.text;
                                String description = descriptionController.text;

                                infoFlushbar(context, "Loading...", "Adding new product");

                                final response = await http.post(
                                  Uri.parse('https://studentmarketplace.pythonanywhere.com/products/create/'),
                                  headers: {
                                    'Content-Type': 'application/json',
                                  },
                                  body: jsonEncode({
                                    'title': name,
                                    'price': price,
                                    'available_quantity': quantity,
                                    'image': image,
                                    'description': description,
                                  }),
                                );

                                if (response.statusCode == 200) {
                                  // Login successful! Parse the response (replace with your actual data structure)
                                  var data = jsonDecode(response.body);

                                  setState(() {
                                    nameController.text = '';
                                    priceController.text = '';
                                    quantityController.text = '';
                                    imageController.text = '';
                                    descriptionController.text = '';
                                  });

                                  successFlushbar(context, "Success", "Product successfully added");
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
                            child: const Text('Create New Product'),
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