import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:student_marketplace/components/bottom_nav.dart';
import 'package:student_marketplace/components/route_manager.dart';
import 'package:student_marketplace/pages/product_detail.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../components/alert_manager.dart';


class ProductItem extends StatelessWidget {
  final String product_id;
  final String title;
  final String description;
  final String price;
  final String available_quantity;
  final String image;
  

  ProductItem({required this.product_id, required this.title, required this.description, required this.price, required this.available_quantity, required this.image});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 8),
        child: InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () async {
            // Handle "Sign In" tap (e.g., navigate to sign in screen)
            Navigator.of(context)
                .push(createRoute(ProductDetailScreen(product_id: product_id, title: title, description: description, price: price, available_quantity: available_quantity, image: image)));
          },
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow:  [
                BoxShadow(
                  blurRadius: 3,
                  color: Color(0x411D2429),
                  offset: Offset(0, 1),
                )
              ],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(
                        0, 1, 1, 1),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: Image.network(
                        image,
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          8, 8, 4, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment:
                        MainAxisAlignment.center,
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.normal,
                              fontFamily: 'Plus Jakarta Sans',
                              color: Colors.black,
                            ),
                          ),
                          Padding(
                            padding:
                            EdgeInsetsDirectional.fromSTEB(
                                0, 4, 8, 0),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.favorite_rounded,
                                  color: Colors.red,
                                  size: 24,
                                ),
                                AutoSizeText(
                                  description,
                                  textAlign: TextAlign.start,
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
                        ],
                      ),
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0, 4, 0, 0),
                        child: Icon(
                          Icons.chevron_right_rounded,
                          color: Color(0xFF57636C),
                          size: 24,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0, 12, 4, 8),
                        child: Text(
                          '#$price',
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.normal,
                            fontFamily: 'Plus Jakarta Sans',
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        )
    );
  }
}

class ProductList {
  final List<ProductItem> items;

  ProductList({required this.items});

  factory ProductList.fromJson(List<dynamic> json) {
    List<ProductItem> items = [];

    for (var item in json) {
      items.add(ProductItem(
        product_id: '${item['id']}',
        title: '${item['title']}',
        description: '${item['description']}',
        price: '${item['price']}',
        available_quantity: '${item['available_quantity']}',
        image: '${item['image']}',
      ));
    }

    return ProductList(items: items);
  }
}

class MyProductsScreen extends StatefulWidget {
  final String firstName;
  final String lastName;
  final String email;
  final String matricNumber;
  final String username;
  final String user_id;
  final String phone_number;

  const MyProductsScreen({Key? key, required this.firstName, required this.lastName, required this.email, required this.matricNumber, required this.username, required this.user_id, required this.phone_number}) : super(key: key);

  @override
  _MyProductsScreenState createState() => _MyProductsScreenState();
}

class _MyProductsScreenState extends State<MyProductsScreen> {
  String firstName = '';
  String lastName = '';
  String email = '';
  String matricNumber = '';
  String username = '';
  String user_id = '';
  String phone_number = '';
  ProductList? products;

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
    fetchData();
  }

  Future<void> fetchData() async {

    try {
      final response = await http.get(Uri.parse('https://studentmarketplace.pythonanywhere.com/products/?user_id=$user_id/'));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        setState(() {
          products = ProductList.fromJson(data['products']);
        });
      } else {
        // Handle API error
        errorFlushbar(context, "Error", 'Failed to load product details');
      }
    } catch (e) {
      // Handle other errors
      errorFlushbar(context, "Error", '$e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            const Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16, 36, 16, 6),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'My Products',
                    style: TextStyle(
                      fontSize: 32.0,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Plus Jakarta Sans',
                      color: Colors.black,
                    ),
                  )
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'View all your products below',
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Plus Jakarta Sans',
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
              child: ListView(
                padding: EdgeInsets.zero,
                primary: false,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                children: [
                  if (products == null || products!.items.isEmpty)
                    Center(child: const Text('No product available'))
                  else
                    Column(
                      children: products!.items,
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomBar(context, 2, firstName, lastName, email, matricNumber, username, user_id, phone_number),
    );
  }
}
