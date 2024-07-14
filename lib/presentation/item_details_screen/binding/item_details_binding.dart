import 'package:medifinder/presentation/item_details_screen/controller/item_details_controllser.dart';

import '../../../core/app_export.dart';

class ItemDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ItemDetailsController());
  }
}