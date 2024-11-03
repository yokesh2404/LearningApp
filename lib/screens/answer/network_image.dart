import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class NetworkImageWorkaround extends StatelessWidget {
  final String imageUrl;
  final double width;
  final double height;

  NetworkImageWorkaround({
    required this.imageUrl,
    this.width = 100,
    this.height = 100,
  });

  @override
  Widget build(BuildContext context) {
    final String viewType = 'network-image-${imageUrl.hashCode}';
    // ui.platformViewRegistry.registerViewFactory(viewType, (int viewId) {
    //   final html.ImageElement img = html.ImageElement()
    //     ..src = imageUrl
    //     ..width = width.toInt()
    //     ..height = height.toInt()
    //     ..style.border = 'none';
    //   return img;
    // });

    return SizedBox(
      width: width,
      height: height,
      child: HtmlElementView(viewType: viewType),
    );
  }
}
