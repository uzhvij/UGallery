import 'package:flutter/material.dart';
import 'package:flutter_gallery/buisness_logic/ImageSaver.dart';
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
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.file_download,
                size: 30,
              ),
              color: Colors.black,
              iconSize: 20.0,
              onPressed: () => downloadPicture(),
            ),
          ],
        ),
        body: GestureDetector(
            child: Center(
                child: PhotoView(
                        imageProvider: ProvidersFactory.buildContentProvider(
                          ProviderType.SINGLE_PHOTO, position).getData(),
                          maxScale: 1.0,
                        minScale: 0.36,
                ),
            ),
          onLongPress: () => downloadPicture(),
        )
    );
  }

  downloadPicture() {
    new ImageSaver().saveImage(position);
    }
}
