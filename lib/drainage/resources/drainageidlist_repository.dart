// File: lib/resources/api_repository_bridgeidlist.dart (or wherever it's located)

import 'package:bridgeinsp_new/drainage/Drmodels/Drainageidlist_model.dart';
import 'package:bridgeinsp_new/drainage/resources/drainageidlist_provider.dart'; // Adjust import path

class ApiRepositoryDrainageidlist {
  final ApiProviderDrainageidlist  _provider = ApiProviderDrainageidlist();

  // --- REVERTED: Call provider without page/size ---
  Future<DrainageidlistModel> fetchDrainagedlist(String id) {
    return _provider.fetchDrainageidlist(id);
  }
}

class SearchRepo {
  final _provider = ApiProviderDrainageidlist();

  late String message;

  // --- REVERTED: Call provider without page/size ---
  Future<DrainageidlistModel>? fetchDrainageidlist(String id) {
    return _provider.fetchDrainageidlist(id);
  }
}

class NetworkError extends Error {}