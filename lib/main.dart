import 'package:ads/ads.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gallery/data_src/PhotoInfoList.dart';
import 'package:flutter_gallery/views/DataRowBuilder.dart';
import 'buisness_logic/ProvidersFactory.dart';
import 'views/FullSizePhotoDisplay.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UGallery',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: MainPage(title: 'UGallery'),
    );
  }
}

class MainPage extends StatefulWidget {
  final String title;

  MainPage({Key key, this.title}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int adsCounter = 0;
  bool isLoading = false;
  ScrollController scrollController;
  Ads ads;

  //ToDo add real app id & switch testing to false
  @override
  void initState() {
    super.initState();

    ads = Ads("ca-app-pub-3940256099942544/1033173712", testing: true);

    getDataAndUpdatePhotoListView();
    scrollController = new ScrollController(keepScrollOffset: false);
  }

  @override
  void dispose() {
    ads.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.autorenew,
              size: 30,
            ),
            color: Colors.black,
            iconSize: 20.0,
            onPressed: () => getDataAndUpdatePhotoListView(),
          ),
        ],
      ),
      backgroundColor: Colors.grey[400],
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : buildPhotoListView(),
    );
  }

  Widget buildPhotoListView() {
    return new ListView.builder(
      key: ObjectKey(context.hashCode),
      controller: scrollController,
      itemBuilder: (context, position) {
        return GestureDetector(
            child: Card(
              margin: EdgeInsets.all(10.0),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: buildRowPhotoListView(position),
              ),
              elevation: 7.0,
              shape: new RoundedRectangleBorder(
                side: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.elliptical(10.0,10.0)),
              ),
            ),
            onTap: () => openFullSizePhotoDisplay(position));
      },
      itemCount: PhotoInfoList.getPhotoListItemCount(),
    );
  }

  Widget buildRowPhotoListView(int position) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ProvidersFactory.buildContentProvider(ProviderType.SMALL_SINGLE_PHOTO, position).getData(),
        Divider(height: 10.0,),
        DataRowBuilder.getRow(context, position, PlaceTo.CARD_VIEW),
      ],
    );
  }

  getDataAndUpdatePhotoListView() async {
    setState(() {
      isLoading = true;
    });
    await PhotoInfoList.getData();
    setState(() {
      isLoading = false;
    });
  }

  openFullSizePhotoDisplay(int position) {

    showAds();

    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => FullSizePhotoDisplay(position),
        ));
  }

  showAds() {
    if (adsCounter == 2) {
      ads.showFullScreenAd();
      adsCounter = 0;
    } else {
      adsCounter++;
    }
  }
}
