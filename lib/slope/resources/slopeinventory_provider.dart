// ApiProviderBridgeinventory

import 'package:bridgeinsp_new/slope/slmodels/slopeinventory_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class ApiProviderSlopeinventory {
  final String? url;
  final Dio _dio = Dio();

  ApiProviderSlopeinventory({required this.url});

  Future<SlopeinventoryModel> fetchSlopeinv() async {
    try {
      String inv = url!.replaceAll(r'/', '%2F');
      String newurl =
          'https://teman-api.plus.com.my/c&s/slopegi/all?id=$inv';
      Response response = await _dio.get(newurl,
          options: Options(
            headers: {
              "Ocp-Apim-Subscription-Key": "526af1e9044d44d69095c8847675031c"
            },
          ));
      return SlopeinventoryModel.fromJson(
          (response.data) as Map<String, dynamic>);
    } catch (error, stacktrace) {
      if (kDebugMode) {
        print("Exception occured: $error stackTrace: $stacktrace");
      }
      return SlopeinventoryModel.withError(
          "Data not found / Connection issue");
    }
  }


}
//final String _url = 'https://teman-api-func.plus.com.my/api/bridge/all';
//'https://teman-api.plus.com.my/c&s/bridgepi/all';
//https://teman-api-func.plus.com.my/api/bridgepi/all?page=1&id=BR/C1/ML/H/278.20/-/-/-/RB/-
