import 'package:bridgeinsp_new/models/t_dd_model.dart';
import 'package:bridgeinsp_new/resources/t_dd_provider.dart';

class ApiRepositoryTDeckDrainage {
  final _provider = ApiProviderTDeckDrainage();

  Future<TDeckDrainageModel> fetchTDeckDrainage() {
    return _provider.fetchTDeckDrainage();
  }
}

class NetworkError extends Error {}
