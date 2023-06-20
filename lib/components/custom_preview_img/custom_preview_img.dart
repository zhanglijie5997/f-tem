import 'package:flutter/material.dart';
import 'package:full_screen_image/full_screen_image.dart';
import 'dart:math' as math;

class CustomPreviewImg extends StatelessWidget {
  final String tag;
  final String path;
  const CustomPreviewImg({super.key, required this.tag, required this.path});

  @override
  Widget build(BuildContext context) {
    return FullScreenWidget(
      disposeLevel: DisposeLevel.High,
      child: Hero(
        tag: '$tag${math.Random().nextDouble()}',
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.network(
            path,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
