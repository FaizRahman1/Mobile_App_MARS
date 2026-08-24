// ApiProviderTDeckDrainage

import 'package:bridgeinsp_new/bridge/brmodels/t_dd_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class ApiProviderTDeckDrainage {
  final Dio _dio = Dio();
  //final String _url = 'https://localhost:7039/api/TDeckDrainage';
  final String _url = 'https://192.168.0.243:5000/api/TDeckDrainage';

  //ApiProviderTDeckDrainage({required this.url});

  Future<TDeckDrainageModel> fetchTDeckDrainage() async {
    try {
      Response response = await _dio.get(_url);

      return TDeckDrainageModel.fromJson(response.data);
    } catch (error, stacktrace) {
      if (kDebugMode) {
        print("Exception occured: $error stackTrace: $stacktrace");
      }

      return TDeckDrainageModel.withError("Data not found / Connection issue");
    }
  }
}
//final String _url = 'https://teman-api-func.plus.com.my/api/bridge/all';
//'https://teman-api.plus.com.my/c&s/bridgepi/all';
//https://teman-api-func.plus.com.my/api/bridgepi/all?page=1&id=BR/C1/ML/H/278.20/-/-/-/RB/-
