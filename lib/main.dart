import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medifinder/firebase_options.dart';
import 'core/app_export.dart';
import 'core/utils/initial_bindings.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) {
    Logger.init(kReleaseMode ? LogMode.live : LogMode.debug);
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        child: GetMaterialApp(
          initialBinding: InitialBindings(),
          debugShowCheckedModeBanner: false,
          theme: theme,
          translations: AppLocalization(),
          locale: Get.deviceLocale,
          fallbackLocale: Locale('en', 'US'),
          title: 'medifinder',
          initialRoute: AppRoutes.initialRoute,
          getPages: AppRoutes.pages,
        ),
      );
    });
  }
}
