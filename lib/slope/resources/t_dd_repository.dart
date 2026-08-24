import 'package:bridgeinsp_new/slope/slmodels/t_dd_model.dart';
import 'package:bridgeinsp_new/slope/resources/t_dd_provider.dart';

class ApiRepositoryTDeckSlope {
  final _provider = ApiProviderTDeckSlope();

  Future<TDeckSlopeModel> fetchTDeckSlope() {
    return _provider.fetchTDeckSlope();
  }
}

class NetworkError extends Error {}
