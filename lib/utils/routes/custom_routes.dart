import 'package:get/get.dart';

/*import '../views/home/home_view.dart';*/
import '../../views/contact/contact_view.dart';
import '../../views/home/home_view.dart';
import '../../views/home/list/list_detail_view.dart';
import '../../views/login/login_view.dart';
import '../../views/settings/settings_view.dart';

class CustomRoutes {
  static List<GetPage<dynamic>> getListRoutes() {
    return [
      GetPage(
        name: "/login",
        page: () => const LoginView(),
      ),
      GetPage(
        name: "/home",
        page: () => const HomeView(),
      ),
      GetPage(
        name: "/detail_list",
        page: () => const ListDetailView(),
      ),
      GetPage(
        name: "/contact",
        page: () => const ContactView(),
      ),
      GetPage(
        name: "/settings",
        page: () => const SettingsView(),
      )
    ];
  }
}
