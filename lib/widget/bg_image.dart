import 'package:flutter/material.dart';

class BgImage extends StatelessWidget {
  final image;

  const BgImage({Key? key, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      image,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      fit: BoxFit.cover,
      filterQuality: FilterQuality.high,
      colorBlendMode: BlendMode.darken,
      cacheHeight: 1550,
      //todo ?
      cacheWidth: 1024,
    );
  }
}
