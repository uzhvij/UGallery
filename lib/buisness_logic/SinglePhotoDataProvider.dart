import 'package:flutter/material.dart';
import 'AbstractDataProvider.dart';

class SinglePhotoDataProvider extends AbstractDataProvider{

  SinglePhotoDataProvider(String source){
    dataUri = source;
  }

  @override
  getData() {
    return new NetworkImage(dataUri);
  }

}