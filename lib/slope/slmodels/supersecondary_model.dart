import 'slopepost_model.dart';

/// Wrapper model for Slope inspection data.
///
/// The class name is retained to minimize refactoring in existing pages.
class SupersecondaryModel {
  String? id;

  // Existing wrapper metadata retained for compatibility.
  String? dateofinspection;
  String? dateoflastinspection;
  String? inspectedby;
  String? summary;
  int? startinspect;
  int? endinspect;
  String? trafficflow;

  /// Main Slope inspection payload.
  SLPostModel? slope;

  String? error;

  SupersecondaryModel({
    this.id,
    this.dateofinspection,
    this.dateoflastinspection,
    this.inspectedby,
    this.summary,
    this.startinspect,
    this.endinspect,
    this.trafficflow,
    this.slope,
  });

  SupersecondaryModel.withError(String errorMessage) {
    error = errorMessage;
  }

  factory SupersecondaryModel.fromJson(Map<String, dynamic> json) {
    final model = SupersecondaryModel(
      id: _asString(json['id']),
      dateofinspection: _asString(
        json['Date of Inspection'] ??
            json['dateofinspection'] ??
            json['dateofinsp'] ??
            json['date_of_inspection'] ??
            json['date_of_insp'],
      ),
      dateoflastinspection: _asString(
        json['Date of Last Inspection'] ??
            json['dateoflastinspection'] ??
            json['date_of_last_inspection'] ??
            json['dateoflastinsp'],
      ),
      inspectedby: _asString(
        json['Inspected By'] ??
            json['inspectedby'] ??
            json['inspected_by'],
      ),
      summary: _asString(json['summary']),
      startinspect: _toInt(json['startinspect']),
      endinspect: _toInt(json['endinspect']),
      trafficflow: _asString(json['trafficflow']),
    );

    final dynamic slopeData =
        json['slope'] ??
        json['slope_inspection'] ??
        json['inspection'] ??
        json['superstructure_secondary'];

    if (slopeData is Map) {
      model.slope = SLPostModel.fromJson(
        Map<String, dynamic>.from(slopeData),
      );
    } else if (_containsSlopeFields(json)) {
      // Supports API responses where the Slope fields are returned at root level.
      model.slope = SLPostModel.fromJson(json);
    }

    return model;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'dateofinspection': dateofinspection,
      'dateoflastinspection': dateoflastinspection,
      'inspectedby': inspectedby,
      'summary': summary,
      'startinspect': startinspect,
      'endinspect': endinspect,
      'trafficflow': trafficflow,
      if (slope != null) 'slope': slope!.toJson(),
    };
  }

  SupersecondaryModel copyWith({
    String? id,
    String? dateofinspection,
    String? dateoflastinspection,
    String? inspectedby,
    String? summary,
    int? startinspect,
    int? endinspect,
    String? trafficflow,
    SLPostModel? slope,
    String? error,
  }) {
    final model = SupersecondaryModel(
      id: id ?? this.id,
      dateofinspection:
          dateofinspection ?? this.dateofinspection,
      dateoflastinspection:
          dateoflastinspection ?? this.dateoflastinspection,
      inspectedby: inspectedby ?? this.inspectedby,
      summary: summary ?? this.summary,
      startinspect: startinspect ?? this.startinspect,
      endinspect: endinspect ?? this.endinspect,
      trafficflow: trafficflow ?? this.trafficflow,
      slope: slope ?? this.slope,
    );

    model.error = error ?? this.error;
    return model;
  }

  static bool _containsSlopeFields(Map<String, dynamic> json) {
    return json.containsKey('Disk/Film No') ||
        json.containsKey('diskfilmno') ||
        json.containsKey('Photo No') ||
        json.containsKey('photono') ||
        json.containsKey('Interface Location') ||
        json.containsKey('interfacelocation') ||
        json.containsKey('Accessibility') ||
        json.containsKey('accessibility') ||
        json.containsKey('Vegetation Control Form') ||
        json.containsKey('vegetationControlForm') ||
        json.containsKey('Drain Cleaning Form') ||
        json.containsKey('drainCleaningForm') ||
        json.containsKey('Status RM') ||
        json.containsKey('statusrm');
  }

  static String? _asString(dynamic value) {
    if (value == null) return null;

    final text = value.toString().trim();

    if (text.isEmpty || text.toLowerCase() == 'null') {
      return null;
    }

    return text;
  }

  static int? _toInt(dynamic value) {
    if (value == null) return null;
    if (value is int) return value;

    return int.tryParse(value.toString());
  }
}
