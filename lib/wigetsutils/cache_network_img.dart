import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:magento_mobile/constants.dart';
import 'package:shimmer/shimmer.dart';

Widget imgBuilder(String url,{double radis=0,Color color=Colors.white}) {
  return CachedNetworkImage(
    imageUrl: url,
    //CategoriesBloc().doGetCategoryImg().then((value) => return value;),
    imageBuilder: (context, imageProvider) => Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radis),
        image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.fill,
            colorFilter:
                ColorFilter.mode(color, BlendMode.colorBurn)),
      ),
    ),
    placeholder: (context, url) => Shimmer.fromColors(child: Container(width: 300,height: 300,), 
    baseColor: kSecondaryColor, 
    highlightColor: kPrimaryColor),
  );
}