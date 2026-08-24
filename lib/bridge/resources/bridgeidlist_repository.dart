// File: lib/resources/api_repository_bridgeidlist.dart (or wherever it's located)

import 'package:bridgeinsp_new/bridge/brmodels/bridgeidlist_model.dart';
import 'package:bridgeinsp_new/bridge/resources/bridgeidlist_provider.dart'; // Adjust import path

class ApiRepositoryBridgeidlist {
  final _provider = ApiProviderBridgeidlist();

  // --- REVERTED: Call provider without page/size ---
  Future<BridgeidlistModel>? fetchBridgeidlist(String id) {
    return _provider.fetchBridgeidlist(id);
  }
}

class SearchRepo {
  final _provider = ApiProviderBridgeidlist();

  late String message;

  // --- REVERTED: Call provider without page/size ---
  Future<BridgeidlistModel>? fetchBridgeidlist(String id) {
    return _provider.fetchBridgeidlist(id);
  }
}

class NetworkError extends Error {}