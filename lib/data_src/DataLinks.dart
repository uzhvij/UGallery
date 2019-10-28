import 'DataIds.dart' as id;

String site = "Unsplash";

final String uriSite =
    "https://unsplash.com/?utm_source=UGallery&utm_medium=referral";

String photoListDataUri = "https://api.unsplash.com/photos/random?client_id=" +
    id.clientKey +
    "&count=10";

String firstPartUserUri = "https://unsplash.com/@";

String secondPartUserUri = "?utm_source=UGallery&utm_medium=referral";
