import 'package:flutter/material.dart';
import 'package:flutter_gallery/buisness_logic/ImageSaver.dart';
import 'package:flutter_gallery/data_src/PermissionWorker.dart';
import 'package:photo_view/photo_view.dart';
import '../buisness_logic/ProvidersFactory.dart';
import 'DataRowBuilder.dart';

class FullSizePhotoDisplay extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  final int position;

  FullSizePhotoDisplay(this.position);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
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
        body: Builder(
          builder: (BuildContext context){
            return GestureDetector(
              child: Center(
                child: PhotoView(
                  imageProvider: ProvidersFactory.buildContentProvider(
                      ProviderType.SINGLE_PHOTO, position).getData(),
                  maxScale: 1.0,
                  minScale: 0.36,
                ),
              ),
              onLongPress: () => downloadPicture(),
            );
          },
        )
    );
  }

  downloadPicture() async{
    var writeStoragePermission = await PermissionWorker.checkAndGrantPermissions();
    if( writeStoragePermission == true){
      new ImageSaver().saveImage(position);
    }else{
      scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text('Cant save picture.'),
        action: SnackBarAction(
          label: 'You have to granted permission.',
          onPressed: () {
            downloadPicture();
          },
        ),
      ));
    }
  }
}
