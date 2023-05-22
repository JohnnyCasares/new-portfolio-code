import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
  MyTextField(
      {Key? key,
      required this.hint,
      this.maxLines,
      required this.controller,
      this.keyboardType,
      this.validator})
      : super(key: key);
  final String hint;
  final int? maxLines;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  String? Function(String?)? validator;

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: widget.validator,
        keyboardType: widget.keyboardType,
        controller: widget.controller,
        maxLines: widget.maxLines,
        decoration: InputDecoration(
          filled: false,
          hintText: widget.hint,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
        ),
        onChanged: (value) {
          // Clear the error message when the text is changed
          if (widget.validator != null) {
            widget.validator!(value);
          }
        },
      ),
    );
  }
}
