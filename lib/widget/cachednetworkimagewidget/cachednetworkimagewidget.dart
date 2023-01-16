import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../utils/utils/resource/image_resource.dart';

CachedNetworkImage cachedNetworkImage(String url , {BoxFit fit = BoxFit.cover,Color ?color}){
  return CachedNetworkImage(
    cacheKey: url,
    imageUrl: url,
    fit: fit,
    color: color,
    placeholder: (context, url) => Image.asset(ImageResource.instance.placeholderImage,fit: BoxFit.contain,),
    errorWidget: (context, url, error) => Padding(
      padding: const EdgeInsets.all(8.0),
      child: Image.asset(ImageResource.instance.errorImage,fit: BoxFit.contain,),
    ),
  );
}