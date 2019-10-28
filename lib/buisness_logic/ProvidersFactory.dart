import 'package:flutter_gallery/buisness_logic/SmallSinglePhotoDataProvider.dart';
import 'package:flutter_gallery/data_src/PhotoInfoList.dart';
import 'PhotoListDataProvider.dart';
import 'AbstractDataProvider.dart';
import 'SinglePhotoDataProvider.dart';

enum ProviderType { PHOTO_LIST, SINGLE_PHOTO, SMALL_SINGLE_PHOTO }

class ProvidersFactory {

  static AbstractDataProvider buildContentProvider(ProviderType type, int position) {
    AbstractDataProvider provider;
    switch (type) {
      case ProviderType.PHOTO_LIST:
        provider = PhotoListDataProvider();
        break;
      case ProviderType.SINGLE_PHOTO:
        provider = SinglePhotoDataProvider(PhotoInfoList.getRegularImageUrl(position));
        break;
      case ProviderType.SMALL_SINGLE_PHOTO:
        provider = SmallSinglePhotoDataProvider(PhotoInfoList.getSmallImageUrl(position));
        break;
    }
    return provider;
  }
}
