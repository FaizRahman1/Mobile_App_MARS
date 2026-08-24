import 'package:bridgeinsp_new/drainage/Drmodels/Drainageinspection_model.dart';
import 'package:bridgeinsp_new/drainage/resources/drainageinspection_provider.dart';

class ApiRepositoryDrainagepi {
  final String? url1;
  final DateTime? date1;
  ApiRepositoryDrainagepi({required this.url1, required this.date1});

  // ignore: non_constant_identifier_names
  Future<DrainageinspectionModel> GetDrainagepiList() {
    final provider = ApiProviderDrainagepi(url: url1, date: date1);
    return provider.GetDrainagegiList();
  }
}

class NetworkError extends Error {}
