import 'package:dio/dio.dart';
import 'package:flutter/material.dart';


import '../app_export.dart';
import 'dialog_helper.dart';

class ExceptionHandler {
  dynamic e;
  ExceptionHandler(this.e);
  void handleException(){
    if(e is DioException){
      if(e.type == DioExceptionType.connectionError ){
        DialogHelper.showErrorDialog(
            title: 'msg_connection_error'.tr,
            description: "msg_check_connectivity".tr);
      }else if(e.type == DioExceptionType.connectionTimeout){
        DialogHelper.showErrorDialog(
            title: 'msg_connection_time_out'.tr,
            description: "msg_check_network".tr);
      }
      else if(e.response!.data['message'] == 'Invalid credentials'){
        DialogHelper.showSnackBar(
            title: 'msg_invalid_credentials'.tr, description: "msg_check_email_password".tr);
      }
      else if(e.response!.statusCode == 401){
        //Get.offAllNamed(AppRoutes.loginOneScreen);
        DialogHelper.showToast("msg_unauthorized".tr);

      }
      else if(e.response!.statusCode == 500){
        DialogHelper.showErrorDialog(
            title: 'msg_server_error'.tr,
            description: "msg_try_again".tr,
            onPressed: (){
              Get.back();
            }
        );
        print(e);
      }

      else if(e.type == DioExceptionType.badResponse){
        DialogHelper.showErrorDialog(
            title: 'msg_bad_response'.tr, description: "${e.message}");
      }else if (e.type == DioExceptionType.cancel){
        DialogHelper.showErrorDialog(
            title: 'msg_request_cancelled'.tr, description: "");
      }else{
        DialogHelper.showErrorDialog(title: 'msg_unknown_error'.tr, description: "");
      }

    }else{
      DialogHelper.showErrorDialog(title: 'msg_error_occurred'.tr, description: e.toString());
    }
  }
}
