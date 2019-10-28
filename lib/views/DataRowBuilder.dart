import 'package:flutter/material.dart';
import 'package:flutter_gallery/buisness_logic/PhotoInfo.dart';
import 'package:flutter_gallery/data_src/PhotoInfoList.dart';
import 'LinkTextSpan.dart';
import '../data_src/DataLinks.dart' as links;

enum PlaceTo { CARD_VIEW, APP_BAR }

class DataRowBuilder {
  static PhotoInfo photoInfo;

  static getRow(BuildContext context, int position, PlaceTo place) {
    photoInfo = PhotoInfoList.getElement(position);
    Row row = Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
      Text(
        'Photo by',
        style: TextStyle(fontSize: 16.0, fontStyle: FontStyle.italic),
        textAlign: TextAlign.center,
      ),

      RichText(
        text: LinkTextSpan(
            style: Theme.of(context).textTheme.body1.copyWith(
                  color: Colors.black,
                  decoration: TextDecoration.underline,
                  fontSize: 16.0,
                ),
            text: makeOptimalLengthUserName(photoInfo.name, place),
            url: makeUserUri()),
        overflow: TextOverflow.ellipsis,
      ),
      Text(
        'on',
        style: TextStyle(fontSize: 16.0, fontStyle: FontStyle.italic),
        textAlign: TextAlign.center,
      ),
      RichText(
        text: LinkTextSpan(
            style: Theme.of(context).textTheme.body1.copyWith(
                  color: Colors.black26,
                  decoration: TextDecoration.underline,
                  fontSize: 15.0,
                ),
            text: links.site,
            url: links.uriSite),
      )
    ]);
    return row;
  }

  static makeUserUri() {
    String uri =
        links.firstPartUserUri + photoInfo.userName + links.secondPartUserUri;
    return uri;
  }

  static makeOptimalLengthUserName(String name, PlaceTo place) {
    String optimalName = name;
    switch (place) {
      case PlaceTo.CARD_VIEW:
        if (name.length >= 18) optimalName = name.substring(0, 15) + "...";
        break;
      case PlaceTo.APP_BAR:
        if (name.length >= 15) optimalName = name.substring(0, 12) + "...";
        break;
    }
    return optimalName;
  }
}
