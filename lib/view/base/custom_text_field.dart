import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final Function(String)? onChanged;

  CustomTextField({
    required this.hintText,
    required this.controller,
    this.onChanged,
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: widget.controller,
          style: Theme.of(context).textTheme.subtitle1,
          decoration: InputDecoration(
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Theme.of(context).colorScheme.shadow),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Theme.of(context).colorScheme.shadow),
            ),
            contentPadding: const EdgeInsets.only(top: 5),
            hintText: widget.hintText,
            fillColor: Theme.of(context).colorScheme.onPrimary,
            hintStyle: Theme.of(context).textTheme.subtitle1!.copyWith(color: Theme.of(context).colorScheme.shadow),
            filled: true,
          ),
          onChanged: widget.onChanged,
        ),
      ],
    );
  }
}