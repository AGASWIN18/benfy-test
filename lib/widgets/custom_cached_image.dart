import 'package:benfy/core/config/app_images.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CustomCachedImage extends StatelessWidget {
  final String imageUrl;
  final double width;
  final double height;
  final double borderRadius;
  final BoxFit fit;
  final Color? placeholderColor;
  final Color? errorColor;

  const CustomCachedImage({
    super.key,
    required this.imageUrl,
    this.width = double.infinity,
    this.height = 120,
    this.borderRadius = 12,
    this.fit = BoxFit.cover,
    this.placeholderColor,
    this.errorColor,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        width: width,
        height: height,
        fit: fit,
        placeholder: (context, url) => Container(
          width: width,
          height: height,
          color: placeholderColor ?? Colors.grey[200],
          child: Center(
            child: Image.asset(
              AppPngImages.imagePLaceHolder,
              fit: BoxFit.cover,
            ),
          ),
        ),
        errorWidget: (context, url, error) => Container(
          width: width,
          height: height,
          color: errorColor ?? Colors.grey[300],
          child: Image.asset(AppPngImages.imagePLaceHolder, fit: BoxFit.cover),
        ),
      ),
    );
  }
}
