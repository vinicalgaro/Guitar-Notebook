import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class DefaultHeaderPage extends StatelessWidget {
  final String title;
  final String subtitle;
  final List<Widget>? content;
  final EdgeInsets? margin;

  const DefaultHeaderPage({
    super.key,
    required this.title,
    required this.subtitle,
    this.content,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin:
              margin ??
              const EdgeInsets.only(
                left: 16.0,
                right: 16.0,
                top: 20.0,
                bottom: 10.0,
              ),
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText(
                  title,
                  maxLines: 1,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 26,
                    overflow: TextOverflow.ellipsis,
                  ),
                  minFontSize: 14,
                ),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    subtitle,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ),
        ),
        if (content != null)
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [...content!],
                ),
              ),
            ),
          ),
      ],
    );
  }
}
