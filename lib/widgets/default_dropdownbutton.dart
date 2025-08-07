import 'package:flutter/material.dart';

class DefaultDropdownButton<T> extends StatelessWidget {
  final String label;
  final List<T> items;
  final void Function(T?)? onChanged;
  final T? value;
  final Widget Function(T item) itemBuilder;

  const DefaultDropdownButton({
    super.key,
    required this.label,
    required this.items,
    required this.onChanged,
    required this.itemBuilder,
    this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
        DropdownButtonFormField<T>(
          initialValue: value,
          decoration: const InputDecoration(),
          borderRadius: BorderRadius.circular(8.0),
          items: items
              .map(
                (item) =>
                    DropdownMenuItem<T>(value: item, child: itemBuilder(item)),
              )
              .toList(),
          dropdownColor: Theme.of(context).colorScheme.surface,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
