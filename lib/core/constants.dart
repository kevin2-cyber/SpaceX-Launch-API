
import 'package:spacex_api/model/model.dart';

class AppConstants {
  // font
  static const kFont = 'One Ui Sans';

  // url
  static const kBaseUrl = 'https://spacex-production.up.railway.app/';

  // lottie files
 static const kWelcomeX = 'assets/lottie/spacex.json';
 static const kSpaceX = 'assets/lottie/welcome.json';

  // dummy data
  static List<History> kDummyText = [
    History(id: "0", title: 'title', details: 'details', eventDateUtc: DateTime.now()),
    History(id: "1", title: 'title', details: 'details', eventDateUtc: DateTime.now()),
    History(id: "2", title: 'title', details: 'details', eventDateUtc: DateTime.now()),
    History(id: "3", title: 'title', details: 'details', eventDateUtc: DateTime.now()),
    History(id: "4", title: 'title', details: 'details', eventDateUtc: DateTime.now()),
  ];

  // history
  static const historyQuery = """
      query SpaceX() {
              histories() {
                id
                title
                details
                event_date_utc
              }
            }
  """;

  // ships
  static const shipQuery = """
      query SpaceX() {
         ships {
          id
          name
          image
          home_port
          type
        }
      }
  """;

  // images
  static const elon = 'assets/images/elon.jpeg';
  static const gwynne = 'assets/images/gwynne.jpeg';
}