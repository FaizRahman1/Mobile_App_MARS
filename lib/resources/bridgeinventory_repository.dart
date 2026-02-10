// ApiRepositoryBridgeinventory

import 'package:bridgeinsp_new/models/bridgeinventory_model.dart';
import 'package:bridgeinsp_new/resources/bridgeinventory_provider.dart';

class ApiRepositoryBridgeinventory {
  final String? url;
  ApiRepositoryBridgeinventory({required this.url});

  //final _provider = ApiProviderBridgeinventory();

  Future<BridgeinventoryModel>? fetchBridgeinv() {
    final provider = ApiProviderBridgeinventory(url: url);
    return provider.fetchBridgeinv();
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
