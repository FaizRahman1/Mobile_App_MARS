import 'package:bridgeinsp_new/slope/slmodels/slopeinspection_model.dart';
import 'package:bridgeinsp_new/slope/resources/slopeinspection_provider.dart';

class ApiRepositorySlopepi {
  final String? url1;
  final DateTime? date1;
  ApiRepositorySlopepi({required this.url1, required this.date1});

  // ignore: non_constant_identifier_names
  Future<SlopeinspectionModel> GetSlopepiList() {
    final provider = ApiProviderSlopepi(url: url1, date: date1);
    return provider.GetSlopegiList();
  }
}

class NetworkError extends Error {}
