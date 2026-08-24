import 'package:bridgeinsp_new/bridge/brmodels/bridgeinspection_model.dart';
import 'package:dio/dio.dart';

class ApiProviderBridgepi {
  final Dio _dioBpi = Dio();
  final String? url;
  final DateTime? date;
  ApiProviderBridgepi({required this.url, required this.date});

  Future<BridgeinspectionModel> GetBridgegiList() async {
    try {
      String man = url!.replaceAll(r'/', '%2F');
      String result =
          date.toString().substring(0, date.toString().indexOf(' '));
      print(man);
      print(result);
      String newurl =
          'https://teman-api.plus.com.my/c&s/bridgegi/info?id=$man&dateofinspection=$result';
      //'https://teman-api.plus.com.my/c&s/drainagepi/info?id=$man&dateofinspection=$result';
      Response response = await _dioBpi.get(newurl,
          options: Options(
            headers: {
              "Ocp-Apim-Subscription-Key": "526af1e9044d44d69095c8847675031c"
            },
          ));
      return BridgeinspectionModel.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return BridgeinspectionModel.withError(
          "Data not found / Connection issue");
    }
  }
}
