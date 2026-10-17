import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class QuantityControl extends StatelessWidget {
  const QuantityControl({
    super.key,
    required this.value,
    required this.onChanged,
  });
  final int value;
  final ValueChanged<int> onChanged;
  @override
  Widget build(BuildContext context) => Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      IconButton(
        tooltip: 'Kurangi jumlah',
        onPressed: value > 1 ? () => onChanged(-1) : null,
        icon: const Icon(Icons.remove_circle_outline, color: AppColors.primary),
      ),
      Text('$value', style: Theme.of(context).textTheme.titleMedium),
      IconButton(
        tooltip: 'Tambah jumlah',
        onPressed: value < 10 ? () => onChanged(1) : null,
        icon: const Icon(Icons.add_circle, color: AppColors.primary),
      ),
    ],
  );
}
