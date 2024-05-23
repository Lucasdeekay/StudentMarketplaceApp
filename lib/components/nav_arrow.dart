import 'package:flutter/material.dart';

class NavigateArrow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () => Navigator.pop(context), // Navigate to previous page
      child: Container(
        width: 40.0,
        height: 40.0,
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: const Center(
          child: Icon(
            Icons.arrow_back_ios_new, // Use Icons.arrow_back for back arrow
            color: Colors.black,
            size: 16.0,
          ),
        ),
      ),
    );
  }
}
