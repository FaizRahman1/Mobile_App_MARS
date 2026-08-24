// File: lib/resources/api_repository_bridgeidlist.dart (or wherever it's located)

import 'package:bridgeinsp_new/slope/slmodels/Slopeidlist_model.dart' hide SlopeidlistModel;
import 'package:bridgeinsp_new/slope/resources/slopeidlist_provider.dart';
import 'package:bridgeinsp_new/slope/slmodels/slopeidlist_model.dart'; // Adjust import path

class ApiRepositorySlopeidlist {
  final ApiProviderSlopeidlist  _provider = ApiProviderSlopeidlist();

  // --- REVERTED: Call provider without page/size ---
  Future<SlopeidlistModel> fetchSlopelist(String id) {
    return _provider.fetchSlopeidlist(id);
  }
}

class SearchRepo {
  final _provider = ApiProviderSlopeidlist();

  late String message;

  // --- REVERTED: Call provider without page/size ---
  Future<SlopeidlistModel> fetchSlopeidlist(String id) {
    return _provider.fetchSlopeidlist(id);
  }
}

class NetworkError extends Error {}