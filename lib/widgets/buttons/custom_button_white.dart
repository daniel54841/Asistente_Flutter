import 'package:flutter/material.dart';

import '../../utils/responsive.dart';

class CustomButtonWhite extends StatelessWidget {
  const CustomButtonWhite(
      {super.key, required this.onTap, required this.title});
  final Function onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive.of(context);
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
      child: GestureDetector(
        onTap: onTap(),
        child: Container(
          width: responsive.wp(50), //200
          height: responsive.dp(4), //55
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              10,
            ),
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                color: Colors.black,
                fontSize: responsive.dp(8),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
