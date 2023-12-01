import 'package:flutter/material.dart';

class CAFormField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final bool autofocus;
  final TextInputType keyboardType;
  final String? Function(String? value)? validator;

  const CAFormField({
    super.key,
    required this.label,
    required this.controller,
    this.autofocus = false,
    this.keyboardType = TextInputType.text,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        const SizedBox(height: 4),
        TextFormField(
          controller: controller,
          autofocus: autofocus,
          keyboardType: keyboardType,
          validator: validator,
        ),
      ],
    );
  }
}
