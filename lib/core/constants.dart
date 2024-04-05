
import 'package:spacex_api/model/history.dart';

class AppConstants {
  // font
  static const kFont = 'One Ui Sans';

  // url
  static const kBaseUrl = 'https://spacex-production.up.railway.app/';

  static List<History> kDummyText = [
    History(id: "0", title: 'title', details: 'details', eventDateUtc: DateTime.now()),
    History(id: "1", title: 'title', details: 'details', eventDateUtc: DateTime.now()),
    History(id: "2", title: 'title', details: 'details', eventDateUtc: DateTime.now()),
    History(id: "3", title: 'title', details: 'details', eventDateUtc: DateTime.now()),
    History(id: "4", title: 'title', details: 'details', eventDateUtc: DateTime.now()),
  ];
}