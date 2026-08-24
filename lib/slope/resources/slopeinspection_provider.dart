import 'package:bridgeinsp_new/slope/slmodels/slopeinspection_model.dart';
import 'package:bridgeinsp_new/slope/slmodels/slopeinspection_model.dart';
import 'package:dio/dio.dart';

class ApiProviderSlopepi {
  final Dio _dioBpi = Dio();
  final String? url;
  final DateTime? date;
  ApiProviderSlopepi({required this.url, required this.date});

  Future<SlopeinspectionModel> GetSlopegiList() async {
    try {
      String man = url!.replaceAll(r'/', '%2F');
      String result =
          date.toString().substring(0, date.toString().indexOf(' '));
      print(man);
      print(result);
      String newurl =
          'https://teman-api.plus.com.my/c&s/slopegi/info?id=$man&dateofinspection=$result';
      Response response = await _dioBpi.get(newurl,
          options: Options(
            headers: {
              "Ocp-Apim-Subscription-Key": "526af1e9044d44d69095c8847675031c"
            },
          ));
      return SlopeinspectionModel.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return SlopeinspectionModel.withError(
          "Data not found / Connection issue");
    }
  }

}
