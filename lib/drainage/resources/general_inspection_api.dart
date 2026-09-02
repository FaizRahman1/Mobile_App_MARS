import 'package:bridgeinsp_new/drainage/Drmodels/drpost_model.dart';
import 'package:bridgeinsp_new/drainage/resources/drainage_asset_resolver.dart';
import 'package:bridgeinsp_new/drainage/resources/mars_api_config.dart';
import 'package:dio/dio.dart';

class DrainageApiException implements Exception {
  const DrainageApiException(this.message, {this.statusCode});

  final String message;
  final int? statusCode;

  @override
  String toString() => message;
}

class DrainageSubmissionResult {
  const DrainageSubmissionResult({
    required this.message,
    required this.assetInternalId,
    required this.drainageId,
  });

  final String message;
  final int? assetInternalId;
  final String drainageId;
}

class GeneralInspectionApi {
  GeneralInspectionApi({
    Dio? dio,
    DrainageAssetResolver? assetResolver,
  })  : _assetResolver = assetResolver ?? const DrainageAssetResolver(),
        _dio = dio ??
            Dio(
              BaseOptions(
                baseUrl: MarsApiConfig.baseUrl,
                connectTimeout: const Duration(seconds: 15),
                receiveTimeout: const Duration(seconds: 30),
                sendTimeout: const Duration(seconds: 30),
                headers: const {'Content-Type': 'application/json'},
                validateStatus: (status) => status != null && status < 500,
              ),
            );

  final Dio _dio;
  final DrainageAssetResolver _assetResolver;

  Future<DrainageSubmissionResult> submit(DRPostModel inspection) async {
    final drainageId = inspection.id.trim();
    if (drainageId.isEmpty) {
      throw const DrainageApiException('DrainageId is required.');
    }

    var assetInternalId = inspection.assetInternalId;
    if (assetInternalId == null) {
      try {
        final asset = await _assetResolver.resolve(drainageId);
        assetInternalId = asset.id;
      } on DrainageAssetResolutionException catch (error) {
        throw DrainageApiException(error.message);
      }
    }

    if (assetInternalId == null) {
      throw const DrainageApiException(
        'The drainage inventory record does not contain AssetInternalId.',
      );
    }

    final request = _buildRequest(inspection, assetInternalId);

    try {
      final response = await _dio.post<Map<String, dynamic>>(
        '/api/Drain/GeneralInspection',
        data: request,
      );

      final body = response.data ?? const <String, dynamic>{};
      final message = body['message']?.toString() ??
          'The server returned status ${response.statusCode}.';

      if (response.statusCode == 200 || response.statusCode == 201) {
        return DrainageSubmissionResult(
          message: message,
          assetInternalId: int.tryParse(
            (body['assetInternalId'] ?? '').toString(),
          ),
          drainageId: request['drainageId'] as String,
        );
      }

      throw DrainageApiException(message, statusCode: response.statusCode);
    } on DrainageApiException {
      rethrow;
    } on DioException catch (error) {
      final responseMessage = error.response?.data is Map
          ? (error.response?.data as Map)['message']?.toString()
          : null;

      throw DrainageApiException(
        responseMessage ?? _connectionMessage(error),
        statusCode: error.response?.statusCode,
      );
    }
  }

  Map<String, dynamic> _buildRequest(
    DRPostModel inspection,
    int assetInternalId,
  ) {
    final drainageId = inspection.id.trim();
    if (drainageId.isEmpty) {
      throw const DrainageApiException('DrainageId is required.');
    }

    final submittedBy = _limit(
      inspection.inspectedby.trim().isEmpty
          ? 'MobileUser'
          : inspection.inspectedby.trim(),
      10,
    );

    return <String, dynamic>{
      'drainageId': drainageId,
      'assetInternalId': assetInternalId,
      'dateOfInspection': inspection.dateofinsp.toIso8601String(),
      'dateOfLastInspection': null,
      'inspectedBy': _limit(inspection.inspectedby.trim(), 25),
      // SubmittedBy is used by the latest DTO. UpdatedBy keeps compatibility
      // with the earlier development version of the endpoint.
      'submittedBy': submittedBy,
      'updatedBy': submittedBy,
      'maintainedBy': null,
      'drainageType': null,
      'drainageSize': null,
      'numberOfCells': null,
      'inlet': <String, dynamic>{
        'siltationDiameter': _lookup('IC43', inspection.siltationdiameterinlet),
        'vegetationCover': _lookup('IC45', inspection.vegecoverinlet),
        'headwallStatus': _lookup('IC47', inspection.headwallstatusinlet),
        'headwallExplanation': inspection.headwallexplainationinlet,
        'wingwallStatus': _lookup('IC48', inspection.wingwallstatusinlet),
        'wingwallExplanation': inspection.wingwallexplanationinlet,
        'sumpStatus': _lookup('IC49', inspection.sumpstatusinlet),
        'sumpExplanation': inspection.sumpexplanationinlet,
        'apronStatus': _lookup('IC50', inspection.apronstatusinlet),
        'apronExplanation': inspection.apronexplanationinlet,
        'incomingDrainStatus': _lookup('IC51', inspection.incdrainstatusinlet),
        'incomingDrainExplanation': inspection.incdrainexplanationinlet,
      },
      'outlet': <String, dynamic>{
        'siltationDiameter': _lookup('IC44', inspection.siltationdiameteroutlet),
        'vegetationCover': _lookup('IC46', inspection.vegecoveroutlet),
        'headwallStatus': _lookup('IC69', inspection.headwallstatusoutlet),
        'headwallExplanation': inspection.headwallexplainationoutlet,
        'wingwallStatus': _lookup('IC68', inspection.wingwallstatusoutlet),
        'wingwallExplanation': inspection.wingwallexplanationoutlet,
        'sumpStatus': _lookup('IC67', inspection.sumpstatusoutlet),
        'sumpExplanation': inspection.sumpexplanationoutlet,
        'apronStatus': _lookup('IC66', inspection.apronstatusoutlet),
        'apronExplanation': inspection.apronexplanationoutlet,
        'outgoingDrainStatus': _lookup('IC71', inspection.incdrainstatusoutlet),
        'outgoingDrainExplanation': inspection.incdrainexplanationoutlet,
      },
      'summaries': <Map<String, dynamic>>[
        _summary(1, inspection.routinedefect1, inspection.otherdefect1),
        _summary(2, inspection.routinedefect2, inspection.otherdefect2),
        _summary(3, inspection.routinedefect3, inspection.otherdefect3),
        _summary(4, inspection.routinedefect4, inspection.otherdefect4),
        _summary(5, inspection.routinedefect5, inspection.otherdefect5),
      ],
      'photos': const <Map<String, dynamic>>[],
    };
  }

  static Map<String, dynamic> _summary(
    int sequenceNumber,
    String? defect,
    String? recommendation,
  ) =>
      <String, dynamic>{
        'sequenceNumber': sequenceNumber,
        'defect': _nullableLimited(defect, 50),
        'recommendation': _nullableLimited(recommendation, 50),
      };

  static int? _lookup(String category, String? label) {
    if (label == null || label.trim().isEmpty) return null;

    final key = '${category}_${label.trim().toUpperCase()}';
    const values = <String, int>{
      'IC43_OK': 861133684936,
      'IC43_>0.1D': 724353838070,
      'IC44_OK': 901008831599,
      'IC44_>0.1D': 751823233337,
      'IC45_OK': 765314297799,
      'IC45_>20%': 436076615635,
      'IC46_OK': 22472360037,
      'IC46_>20%': 639949065407,
      'IC47_OK': 333049351570,
      'IC47_DAMAGED': 864179041884,
      'IC48_OK': 971846888350,
      'IC48_DAMAGED': 921529805786,
      'IC49_OK': 796574890650,
      'IC49_DAMAGED': 163954758042,
      'IC50_OK': 68531288260,
      'IC50_DAMAGED': 244158165193,
      'IC51_OK': 959386012358,
      'IC51_DAMAGED': 12378858853,
      'IC66_OK': 936771854721,
      'IC66_DAMAGED': 103838204258,
      'IC67_OK': 772137244302,
      'IC67_DAMAGED': 325538439816,
      'IC68_OK': 68082399764,
      'IC68_DAMAGED': 817753256128,
      'IC69_OK': 715176114337,
      'IC69_DAMAGED': 184673016161,
      'IC71_OK': 229815938934,
      'IC71_DAMAGED': 846387321748,
    };

    final id = values[key];
    if (id == null) {
      throw DrainageApiException(
        'Unsupported value "$label" for lookup category $category.',
      );
    }
    return id;
  }

  static String _limit(String value, int maxLength) =>
      value.length <= maxLength ? value : value.substring(0, maxLength);

  static String? _nullableLimited(String? value, int maxLength) {
    final cleaned = value?.trim();
    if (cleaned == null || cleaned.isEmpty) return null;
    return _limit(cleaned, maxLength);
  }

  static String _connectionMessage(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return 'The MARS API request timed out.';
      case DioExceptionType.connectionError:
        return 'Cannot connect to the MARS API. Confirm that the API is running on port 5112.';
      default:
        return 'Unable to submit the inspection: ${error.message ?? 'unknown error'}';
    }
  }
}
