class PhotoInfo {
  final String name;
  final String userName;
  final String smallSize;
  final String regularSize;
  final String fullSize;

  PhotoInfo._({this.name, this.userName, this.smallSize, this.fullSize, this.regularSize});

  factory PhotoInfo.fromJson(Map<String, dynamic> json) {
    return new PhotoInfo._(
        name: json['user']['name'],
        userName: json['user']['username'],
        smallSize: json['urls']['small'],
        fullSize: json['urls']['full'],
        regularSize: json['urls']['regular']);
  }
}
