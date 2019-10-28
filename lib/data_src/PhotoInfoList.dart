import 'package:flutter_gallery/buisness_logic/PhotoInfo.dart';
import 'package:flutter_gallery/buisness_logic/ProvidersFactory.dart';

class PhotoInfoList{
  static List<PhotoInfo> list;

  static getData() async {
    try {
      list =
      await ProvidersFactory.buildContentProvider(ProviderType.PHOTO_LIST, null)
          .getData();
    } catch (e) {
      print(e.toString());
    }
  }

  static getRegularImageUrl(int position){
    return list[position].regularSize;
  }

  static getSmallImageUrl(int position){
    return list[position].smallSize;
  }

  static getElement(int position){
    return list.elementAt(position);
  }

  static getPhotoListItemCount(){
    return list.length;
  }
}