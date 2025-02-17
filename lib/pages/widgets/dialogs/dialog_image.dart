import 'package:flutter/material.dart';

/// {@template DialogImage}
/// TODO: Add description.
/// {@endtemplate}
class DialogImage extends StatelessWidget {
  /// {@macro DialogImage}
  const DialogImage({
    required this.imageTask,
    required this.tag,
    super.key,
  });
  Future<void> show(BuildContext context) => showDialog<void>(
        context: context,
        builder: (_) => DialogImage(
          imageTask: imageTask,
          tag: tag,
        ),
      );

  ///
  final String tag;

  ///
  final String imageTask;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Hero(
        tag: imageTask,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
            imageTask,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => const Icon(
              Icons.broken_image,
              size: 60,
            ),
          ),
        ),
      ),
    );
  }
}
