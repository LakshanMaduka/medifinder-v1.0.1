import 'package:medifinder/presentation/add_medicine_screen/add_medicine_screen.dart';
import 'package:medifinder/presentation/add_medicine_screen/binding/add_medicine_binding.dart';
import 'package:medifinder/presentation/details_screen/binding/details_screen_binding.dart';
import 'package:medifinder/presentation/details_screen/details_screen.dart';
import 'package:medifinder/presentation/home_screen/binding/home_binding.dart';
import 'package:medifinder/presentation/home_screen/home_screen.dart';
import 'package:medifinder/presentation/login_screen/binding/login_binding.dart';
import 'package:medifinder/presentation/login_screen/login_screen.dart';
import 'package:medifinder/presentation/splash_screen/binding/splash_screen_binding.dart';
import 'package:medifinder/presentation/splash_screen/splash_screen.dart';

import '../core/app_export.dart';

 // ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class AppRoutes {
  static const String splashScreen =
      '/splash_screen_screen';

  static const String loginScreen =
      '/login_screen';

  static const String homeScreen =
      '/home_screen';

  static const String detailsScreen =
      '/details_screen';

  static const String addMedicineScreen =
      '/add_medicine_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String initialRoute = '/initialRoute';

  static List<GetPage> pages = [
    GetPage(
      name: splashScreen,
      page: () => SplashScreen(),
      bindings: [SplashScreenBinding()],
    ),
    GetPage(
      name: loginScreen,
      page: () => LoginScreen(),
      bindings: [LoginBinding()],
    ),
    GetPage(
      name: homeScreen,
      page: () => HomeScreen(),
      bindings: [HomeBinding()],
    ),
    GetPage(
      name: detailsScreen,
      page: () => DetailsScreen(),
      bindings: [DetailsScreenBinding()],
    ),
    GetPage(
      name: addMedicineScreen,
      page: () => AddMedicineScreen(),
      bindings: [AddMedicineBinding()],
    ),

    GetPage(
      name: initialRoute,
      page: () => SplashScreen(),
      bindings: [SplashScreenBinding()],
    )
  ];
}