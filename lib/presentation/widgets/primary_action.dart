import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class PrimaryAction extends StatelessWidget {
  const PrimaryAction({super.key, required this.label, required this.onPressed, this.trailing});
  final String label;
  final VoidCallback? onPressed;
  final Widget? trailing;
  @override
  Widget build(BuildContext context) => FilledButton(
    onPressed: onPressed,
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: Space.medium),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(child: Text(label, textAlign: TextAlign.center)),
          if (trailing != null) ...[Space.rowGap, trailing!],
        ],
      ),
    ),
  );
}
