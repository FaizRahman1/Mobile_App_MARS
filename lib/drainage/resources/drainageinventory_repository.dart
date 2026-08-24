// ApiRepositoryBridgeinventory

import 'package:bridgeinsp_new/drainage/Drmodels/drainageinventory_model.dart';
import 'package:bridgeinsp_new/drainage/resources/drainageinventory_provider.dart';

class ApiRepositoryDrainageinventory {
  final String? url;
  ApiRepositoryDrainageinventory({required this.url});


   Future<DrainageinventoryModel> fetchDrainageinv() {
    final provider = ApiProviderDrainageinventory(url: url);
    return provider.fetchDrainageinv();
  }
}
/*
class SearchRepo {
  final _provider = ApiProviderBridgeidlist();

  late String message;

  Future<BridgeidlistModel>? fetchBridgeidlist() {
    return _provider.fetchBridgeidlist();
  }
}
*/

class NetworkError extends Error {}
