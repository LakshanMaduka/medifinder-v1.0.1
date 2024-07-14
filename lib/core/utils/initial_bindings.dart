import 'package:flutter/material.dart';
import 'package:medifinder/core/data/api_client.dart';
import 'package:medifinder/presentation/search_screen/controller/search_controller.dart';

import '../app_export.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {

    Get.put(PrefUtils());
    Get.put(ApiClient());

  }
}
