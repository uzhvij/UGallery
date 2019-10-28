import 'PhotoInfo.dart';
import 'AbstractDataProvider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../data_src/DataLinks.dart' as links;

class PhotoListDataProvider extends AbstractDataProvider {
  @override

  PhotoListDataProvider(){
    dataUri = links.photoListDataUri;
}

  getData() async{
    List<PhotoInfo> list = List();
    final response = await http.get(dataUri);
    if (response.statusCode == 200) {
      list = (json.decode(response.body) as List)
          .map((data) => new PhotoInfo.fromJson(data))
          .toList();
    } else {
      throw Exception('Failed to load photos');
    }
    return list;
  }
}
