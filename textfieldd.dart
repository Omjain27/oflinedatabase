import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  TextEditingController controller;
  String? hint;
  String? label;
  MyTextField({super.key,required this.controller,this.hint,this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
            hintText: "",
            labelText: ""),
      ),
    );
  }
}
