import 'package:flutter/material.dart';
import 'package:guitar_notebook/helpers/get_from_assets.dart';

class DefaultImageBuilder extends StatelessWidget {
  final String assetImageFileName;
  final double? height;

  const DefaultImageBuilder({
    super.key,
    required this.assetImageFileName,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image(
        height: height,
        fit: BoxFit.cover,
        loadingBuilder:
            (
              BuildContext context,
              Widget child,
              ImageChunkEvent? loadingProgress,
            ) {
              if (loadingProgress == null) {
                return child;
              }

              return Center(
                child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes!
                      : null,
                  strokeWidth: 2,
                  color: Theme.of(context).colorScheme.primary,
                ),
              );
            },
        image: AssetImage(getImageFromAssets(assetImageFileName)),
      ),
    );
  }
}
