// ApiRepositoryBridgeinventory

import 'package:bridgeinsp_new/bridge/brmodels/bridgeinventory_model.dart';
import 'package:bridgeinsp_new/bridge/resources/bridgeinventory_provider.dart';

class ApiRepositoryBridgeinventory {
  final String? url;
  ApiRepositoryBridgeinventory({required this.url});


  Future<BridgeinventoryModel>? fetchBridgeinv() {
    final provider = ApiProviderBridgeinventory(url: url);
    return provider.fetchBridgeinv();
  }
}

class NetworkError extends Error {}