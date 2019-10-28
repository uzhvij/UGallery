import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'AbstractDataProvider.dart';

class SmallSinglePhotoDataProvider extends AbstractDataProvider{
  SmallSinglePhotoDataProvider(String source){
    dataUri = source;
  }

  @override
  getData() {
    return new CachedNetworkImage(
      height: 150,
      placeholder: (context, url) => CircularProgressIndicator(),
      imageUrl: dataUri,
    );
  }

}