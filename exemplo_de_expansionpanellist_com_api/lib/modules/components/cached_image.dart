import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CachedImage extends StatelessWidget {
  const CachedImage({Key? key, required this.url, this.circular = false})
      : super(key: key);

  final String url;
  final bool circular;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
            
      imageUrl: url,
      imageBuilder: circular
          ? (context, imageProvider) =>
              CircleAvatar(backgroundImage: imageProvider)
          : null,
      progressIndicatorBuilder: (context, url, downloadProgress) =>
          CircularProgressIndicator(
        value: downloadProgress.progress,
      ),
      errorWidget: (context, url, error) => const Icon(Icons.error),
      fadeInDuration: const Duration(milliseconds: 400),
    );
  }
}
