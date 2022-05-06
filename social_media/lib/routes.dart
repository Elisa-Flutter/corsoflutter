import 'package:social_media/pages/home_page/home.dart';
import 'package:social_media/pages/log_in/log_in.dart';

routes() {
  return {
    "/": (context) => const LogIn(),
    "/home": (context) => const Home(),
  };
}
