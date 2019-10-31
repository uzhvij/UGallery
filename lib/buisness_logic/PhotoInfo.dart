class PhotoInfo {
  final String id;
  final String name;
  final String userName;
  final String smallSize;
  final String regularSize;
  final String downloadLocation;

  PhotoInfo._({this.id, this.name, this.userName, this.smallSize, this.downloadLocation, this.regularSize});

  factory PhotoInfo.fromJson(Map<String, dynamic> json) {
    return new PhotoInfo._(
        id: json['id'],
        name: json['user']['name'],
        userName: json['user']['username'],
        smallSize: json['urls']['small'],
        downloadLocation: json['links']['download_location'],
        regularSize: json['urls']['regular']);
  }
}
