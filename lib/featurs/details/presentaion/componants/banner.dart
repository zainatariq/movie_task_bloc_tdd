import 'package:flutter/cupertino.dart';

import 'arc_clipper.dart';

class ArcBannerImage extends StatelessWidget {
  ArcBannerImage(this.imageUrl, this.height);

  final String imageUrl;
  final double height;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    return ClipPath(
      clipper: ArcClipper(),
      child: imageUrl != null
          ? Image.network(
        imageUrl,
        width: screenWidth,
        height: height,
        fit: BoxFit.cover,
      )
          : Image.asset(
        "assets/no_poster.jpg",
        width: screenWidth,
        height: height,
        fit: BoxFit.cover,
      ),
    );
  }
}

