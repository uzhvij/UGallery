import 'dart:io';
import 'package:downloads_path_provider/downloads_path_provider.dart';
import 'package:flutter_gallery/data_src/PhotoInfoList.dart';

class ImageSaver{

  saveImage(int position){
    print("download");
    String source = PhotoInfoList.getDownloadRequestUrl(position);
    Future<Directory> downloadsDirectory = DownloadsPathProvider.downloadsDirectory;
    downloadsDirectory.then((Directory directory) {
      print(directory.path);
    });
  }

}