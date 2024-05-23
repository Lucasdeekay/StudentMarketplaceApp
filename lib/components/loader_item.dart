import 'package:flutter/material.dart';

class LoaderItemWidget extends StatefulWidget {
  const LoaderItemWidget({super.key});

  @override
  State<LoaderItemWidget> createState() => _LoaderItemWidgetState();
}

class _LoaderItemWidgetState extends State<LoaderItemWidget> {

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: MediaQuery.sizeOf(context).width * 0.48,
          height: 150,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: Colors.grey,
              width: 1,
            ),
          ),
          child: Align(
            alignment: AlignmentDirectional(1, -1),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 12, 12, 0),
              child: Container(
                width: 32,
                height: 32,
                child: const Stack(
                  children: [
                    Align(
                      alignment: AlignmentDirectional(1, -1),
                      child: Icon(
                        Icons.favorite_border_rounded,
                        color: Colors.pinkAccent,
                        size: 32,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
          child: Container(
            width: 140,
            height: 21,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 6, 0, 0),
          child: Container(
            width: 60,
            height: 18,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
            ),
          ),
        ),
      ],
    );
  }
}
