import 'package:flutter/material.dart';
import 'package:guitar_notebook/extensions/navigation_extension.dart';

class DefaultBottomSheetHeader extends StatelessWidget {
  final String label;
  final List<Widget> children;

  const DefaultBottomSheetHeader({
    super.key,
    required this.label,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  label,
                  style: Theme.of(context).textTheme.headlineSmall,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
              Row(
                children: [
                  IconButton(
                      onPressed: context.goBack, icon: const Icon(Icons.close)),
                ],
              )
            ],
          ),
          const SizedBox(height: 8.0),
          ...children,
        ],
      ),
    );
  }
}
