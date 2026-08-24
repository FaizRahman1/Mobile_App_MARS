import 'package:bridgeinsp_new/bridge/brmodels/t_dd_model.dart';
import 'package:bridgeinsp_new/bridge/resources/t_dd_provider.dart';

class ApiRepositoryTDeckDrainage {
  final _provider = ApiProviderTDeckDrainage();

  Future<TDeckDrainageModel> fetchTDeckDrainage() {
    return _provider.fetchTDeckDrainage();
  }
}

class NetworkError extends Error {}
