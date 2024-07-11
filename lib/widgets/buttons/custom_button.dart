import 'package:flutter/material.dart';

import '../../utils/responsive.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.onTap, required this.title});
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
            gradient: const LinearGradient(
              colors: [
                Color(0xAE4B39EF),
                Colors.lightBlueAccent,
              ],
              stops: [
                0,
                1,
              ],
              begin: AlignmentDirectional(0, -1),
              end: AlignmentDirectional(0, -1),
            ),
            borderRadius: BorderRadius.circular(
              10,
            ),
          ),
          child: Center(
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
