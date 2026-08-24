// ApiRepositoryBridgeinventory

import 'package:bridgeinsp_new/slope/resources/slopeinventory_provider.dart';
import 'package:bridgeinsp_new/slope/slmodels/slopeinventory_model.dart';

class ApiRepositorySlopeinventory {
  final String? url;
  ApiRepositorySlopeinventory({required this.url});


   Future<SlopeinventoryModel> fetchSlopeinv() {
    final provider = ApiProviderSlopeinventory(url: url);
    return provider.fetchSlopeinv();
  }
}

class NetworkError extends Error {}