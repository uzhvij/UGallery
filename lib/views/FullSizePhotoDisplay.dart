import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import '../buisness_logic/ProvidersFactory.dart';
import 'DataRowBuilder.dart';

class FullSizePhotoDisplay extends StatelessWidget {
  final int position;

  FullSizePhotoDisplay(this.position);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: DataRowBuilder.getRow(context, position, PlaceTo.APP_BAR),
        ),
        body: Center(
          child: PhotoView(
            imageProvider: ProvidersFactory.buildContentProvider(
                ProviderType.SINGLE_PHOTO, position).getData(),
            maxScale: 1.0,
            minScale: 0.36,
          )
        ));
  }
}
