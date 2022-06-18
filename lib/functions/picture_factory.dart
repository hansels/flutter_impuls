import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_impuls/configs/configs.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class PictureFactory {
  static Widget build(
    String imageUrl, {
    BoxFit fit = BoxFit.cover,
    double placeholderRatioX = 16,
    double placeholderRatioY = 9,
    Widget placeholder,
    double placeholderHeight,
    void Function() onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        fit: fit,
        fadeInCurve: Curves.fastOutSlowIn,
        alignment: Alignment.center,
        placeholder: (context, url) =>
            placeholder ??
            Center(
              child: AspectRatio(
                aspectRatio: placeholderRatioX / placeholderRatioY,
                child: const SpinKitFadingCircle(color: Configs.secondaryColor),
              ),
            ),
      ),
    );
  }
}
