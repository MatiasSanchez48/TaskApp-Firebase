import 'package:flutter/material.dart';

/// {@template ImageCustom}
/// TODO: Add description.
/// {@endtemplate}
class ImageCustom extends StatelessWidget {
  /// {@macro ImageCustom}
  const ImageCustom({
    this.urlImage = '',
    this.height = 200,
    this.width = 200,
    this.radius = 8,
    this.child,
    super.key,
  });

  ///
  final String urlImage;

  ///
  final double height;

  ///
  final double width;

  ///
  final double radius;

  ///
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: child ??
            Image.network(
              urlImage,
              width: width,
              height: height,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => const Icon(
                Icons.broken_image,
                size: 100,
              ),
            ),
      ),
    );
  }
}
