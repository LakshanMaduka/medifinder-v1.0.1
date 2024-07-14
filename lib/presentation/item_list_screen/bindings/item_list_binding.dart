import 'package:medifinder/presentation/item_list_screen/controller/item_list_controller.dart';

import '../../../core/app_export.dart';

class ItemListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ItemListController());
  }
}