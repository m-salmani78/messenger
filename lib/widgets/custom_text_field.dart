import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String? hintText;

  const CustomTextField({Key? key, this.hintText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(26),
      clipBehavior: Clip.antiAlias,
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          hintText: hintText,
          border: InputBorder.none,
          // contentPadding: EdgeInsets.zero,
        ),
      ),
    );
  }
}
