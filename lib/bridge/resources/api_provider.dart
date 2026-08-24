/*
//import 'package:bridgeinsp/bloc/bloc/bloc/student_bloc.dart';
import 'package:bridgeinsp/models/bridgeidlist_model.dart';
import 'package:bridgeinsp/models/generaldata_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiProvider {
  Future<BridgeIdListModel> fetchBridgeIdList() async {
    try {
      var headers = {
        'Ocp-Apim-Subscription-Key': '526af1e9044d44d69095c8847675031c'
      };
      var uri = Uri.parse('https://teman-api.plus.com.my/c&s/bridge/all');
      //https://teman-api.plus.com.my/c&s/bridge/all?section=C1

      http.Response response = await http.get(uri, headers: headers);
      //final httpPackageInfo = await http.read(uri, headers: headers);
      final httpPackageJson = json.decode(response.body);

      if (response.statusCode == 200) {
        debugPrint(response.body);
      } else {
        debugPrint(response.reasonPhrase);
      }

      return BridgeIdListModel.fromJson(httpPackageJson);
    } catch (error, stacktrace) {
      debugPrint("Exception occured: $error stackTrace: $stacktrace");

      return BridgeIdListModel.withError(
          "Data not found : $error / Connection issue");
    }
  } // -------------------------------------------------- bridge id list

  Future<BridgeGeneralDataModel> fetchGeneralData() async {
    try {
      var headers = {
        'Ocp-Apim-Subscription-Key': '526af1e9044d44d69095c8847675031c'
      };
      var uri = Uri.parse('https://teman-api.plus.com.my/c&s/bridge/all');
      //https://teman-api.plus.com.my/c&s/bridge/all?section=C1

      http.Response response = await http.get(uri, headers: headers);
      //final httpPackageInfo = await http.read(uri, headers: headers);
      final httpPackageJson = json.decode(response.body);

      if (response.statusCode == 200) {
        debugPrint(response.body);
      } else {
        debugPrint(response.reasonPhrase);
      }

      return BridgeGeneralDataModel.fromJson(httpPackageJson);
    } catch (error, stacktrace) {
      debugPrint("Exception occured: $error stackTrace: $stacktrace");

      return BridgeGeneralDataModel.withError(
          "Data not found : $error / Connection issue");
    }
  } // -------------------------------------------------- general data
}

*/