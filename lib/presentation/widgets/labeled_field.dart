import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class LabeledField extends StatelessWidget {
  const LabeledField({
    super.key,
    required this.label,
    required this.hint,
    this.controller,
    this.leading,
    this.trailing,
    this.obscure = false,
    this.validator,
    this.onChanged,
    this.maxLines = 1,
    this.keyboardType,
  });
  final String label, hint;
  final TextEditingController? controller;
  final Widget? leading, trailing;
  final bool obscure;
  final String? Function(String?)? validator;
  final ValueChanged<String>? onChanged;
  final int maxLines;
  final TextInputType? keyboardType;
  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(label, style: Theme.of(context).textTheme.labelLarge),
      Space.gap,
      TextFormField(
        controller: controller,
        obscureText: obscure,
        validator: validator,
        onChanged: onChanged,
        maxLines: maxLines,
        keyboardType: keyboardType,
        style: Theme.of(context).textTheme.bodyMedium,
        decoration: InputDecoration(
          hintText: hint,
          prefixIcon: leading == null
              ? null
              : Padding(padding: Space.cardPadding, child: leading),
          suffixIcon: trailing,
        ),
      ),
    ],
  );
}
