import 'package:bridgeinsp_new/drainage/Drmodels/Drainageinspection_model.dart';
import 'package:dio/dio.dart';

class ApiProviderDrainagepi {
  final Dio _dioBpi = Dio();
  final String? url;
  final DateTime? date;
  ApiProviderDrainagepi({required this.url, required this.date});

  Future<DrainageinspectionModel> GetDrainagegiList() async {
    try {
      String man = url!.replaceAll(r'/', '%2F');
      String result =
          date.toString().substring(0, date.toString().indexOf(' '));
      print(man);
      print(result);
      String newurl =
          'https://teman-api.plus.com.my/c&s/drainagegi/info?id=$man&dateofinspection=$result';
      //'https://teman-api.plus.com.my/c&s/drainagepi/info?id=$man&dateofinspection=$result';
      Response response = await _dioBpi.get(newurl,
          options: Options(
            headers: {
              "Ocp-Apim-Subscription-Key": "526af1e9044d44d69095c8847675031c"
            },
          ));
      return DrainageinspectionModel.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return DrainageinspectionModel.withError(
          "Data not found / Connection issue");
    }
  }
}
