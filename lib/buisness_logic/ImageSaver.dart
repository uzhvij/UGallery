import 'dart:convert';
import 'dart:io';
import 'package:downloads_path_provider/downloads_path_provider.dart';
import 'package:flutter_gallery/data_src/PhotoInfoList.dart';
import '../data_src/DataIds.dart' as ids;

class ImageSaver {
  saveImage(int position) async {
    String url = await getImageUrl(position);
    String path = await getPathToSave(position);

    saveImageToFile(url, path);
  }

  getImageUrl(int position) async {
    String result;
    String url = PhotoInfoList.getDownloadRequestUrl(position) + '?client_id=' + ids.clientKey;
    HttpClient client = new HttpClient();

    await client.getUrl(Uri.parse(url)).then((HttpClientRequest request) {
      return request.close();
    }).then((HttpClientResponse response) {
      return response
          .transform(utf8.decoder)
          .listen((contents) => result = contents)
          .asFuture();
    });

    return jsonDecode(result).entries.elementAt(0).value;
  }

  getPathToSave(int position) async {
    String path;
    String imageId = PhotoInfoList.getImageId(position);

    await DownloadsPathProvider.downloadsDirectory.then((Directory directory) {
      path = directory.path + '/' + imageId + '.png';
    });
    return path;
  }

  saveImageToFile(String imageUrl, String path) {
    HttpClient client = new HttpClient();

    client
        .getUrl(Uri.parse(imageUrl))
        .then((HttpClientRequest request, {error}) {
      return request.close();
    }).then((HttpClientResponse response) {
      response.pipe(new File(path).openWrite());
    });
  }
}
