import 'package:bridgeinsp_new/bridge/brmodels/bridgeinspection_model.dart';
import 'package:bridgeinsp_new/bridge/resources/bridgeinspection_provider.dart';

class ApiRepositoryBridgepi {
  final String? url1;
  final DateTime? date1;
  ApiRepositoryBridgepi({required this.url1, required this.date1});

  // ignore: non_constant_identifier_names
  Future<BridgeinspectionModel>? GetBridgepiList() {
    final provider = ApiProviderBridgepi(url: url1, date: date1);
    return provider.GetBridgegiList();
  }
}

class NetworkError extends Error {}
