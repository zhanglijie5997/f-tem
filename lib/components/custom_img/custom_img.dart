import 'package:art_app/constants/assets.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

class CustomImage extends StatefulWidget {
  final String url;
  final Size? size;
  const CustomImage({Key? key, required this.url, this.size}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CustomImageState createState() => _CustomImageState();
}

class _CustomImageState extends State<CustomImage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    _controller = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 3),
        lowerBound: 0.0,
        upperBound: 1.0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final String url = widget.url;
    final size = widget.size ?? const Size(300, 200);
    return ExtendedImage.network(
      url,
      fit: BoxFit.cover,
      width: size.width,
      height: size.height,
      cache: true,
      loadStateChanged: (ExtendedImageState state) {
        switch (state.extendedImageLoadState) {
          case LoadState.loading:
            _controller.reset();
            return Image.asset(
              Assets.assetsImagesNoEmptyV3,
              fit: BoxFit.contain,
            );
          case LoadState.completed:
            if (state.wasSynchronouslyLoaded) {
              return state.completedWidget;
            }
            _controller.forward();

            ///if you don't want override completed widget
            ///please return null or state.completedWidget
            //return null;
            //return state.completedWidget;
            return FadeTransition(
              opacity: _controller,
              child: state.completedWidget,
            );
          case LoadState.failed:
            _controller.reset();
            //remove memory cached
            state.imageProvider.evict();
            return GestureDetector(
              child: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  Image.asset(
                    Assets.assetsImagesNoEmptyV3,
                    fit: BoxFit.contain,
                  ),
                ],
              ),
              onTap: () {
                state.reLoadImage();
              },
            );
        }
      },
    );
  }
}
