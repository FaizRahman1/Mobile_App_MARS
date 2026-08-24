import 'drpost_model.dart';

/// Previously: Bridge Superstructure Secondary model
/// Now: Drainage inspection wrapper model (keeps file name to minimize refactor)
class SupersecondaryModel {
  String? id; // asset id (drainage/culvert id)

  // Keep these for compatibility with your existing UI/pages
  String? dateofinspection;       // optional (string)
  String? dateoflastinspection;   // optional (string)
  String? inspectedby;            // optional
  String? summary;                // optional
  int? startinspect;              // optional
  int? endinspect;                // optional
  String? trafficflow;            // optional

  /// Drainage payload (main)
  DRPostModel? drainage;

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
    this.drainage,
  });

  SupersecondaryModel.withError(String errorMessage) {
    error = errorMessage;
  }

  SupersecondaryModel.fromJson(Map<String, dynamic> json) {
    id = (json['id'] ?? '').toString();

    dateofinspection = (json['dateofinspection'] ??
            json['dateofinsp'] ??
            json['date_of_inspection'] ??
            json['date_of_insp'])
        ?.toString();

    dateoflastinspection = (json['dateoflastinspection'] ??
            json['date_of_last_inspection'] ??
            json['dateoflastinsp'])
        ?.toString();

    inspectedby = (json['inspectedby'] ?? json['inspected_by'])?.toString();
    summary = json['summary']?.toString();
    startinspect = _toInt(json['startinspect']);
    endinspect = _toInt(json['endinspect']);
    trafficflow = json['trafficflow']?.toString();

    // Accept multiple possible keys so you won't crash if backend key differs
    final dynamic d = json['drainage'] ??
        json['dr'] ??
        json['dr_post'] ??
        json['inspection'] ??
        json['superstructure_secondary']; // fallback if old key is still used

    if (d is Map<String, dynamic>) {
      drainage = DRPostModel.fromJson(d);
    } else if (json.containsKey('siltation_diameter_inlet') ||
        json.containsKey('headwall_status_inlet') ||
        json.containsKey('routinedefect1')) {
      // In case API returns DR fields at root level (not nested)
      drainage = DRPostModel.fromJson(json);
    } else {
      drainage = null;
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['id'] = id;
    data['dateofinspection'] = dateofinspection;
    data['dateoflastinspection'] = dateoflastinspection;
    data['inspectedby'] = inspectedby;
    data['summary'] = summary;
    data['startinspect'] = startinspect;
    data['endinspect'] = endinspect;
    data['trafficflow'] = trafficflow;

    // Put drainage under a clean key
    if (drainage != null) {
      // If DRPostModel has toJson(), prefer using it.
      // If it doesn't, you can store the fields via sendmodel.dart conversion instead.
      data['drainage'] = drainageToJson(drainage!);
    }

    return data;
  }

  static int? _toInt(dynamic v) {
    if (v == null) return null;
    if (v is int) return v;
    return int.tryParse(v.toString());
  }

  /// In case DRPostModel doesn't have toJson() yet, we serialize it here.
  /// If you already have DRPostModel.toJson(), replace this with: `return m.toJson();`
  static Map<String, dynamic> drainageToJson(DRPostModel m) {
    return <String, dynamic>{
      'id': m.id,
      'dateofinsp': m.dateofinsp.toIso8601String(),
      'inspectedby': m.inspectedby,
      'maintainedby': m.maintainedby,

      'siltation_diameter_inlet': m.siltationdiameterinlet,
      'siltation_diameter_outlet': m.siltationdiameteroutlet,
      'vege_cover_inlet': m.vegecoverinlet,
      'vege_cover_outlet': m.vegecoveroutlet,

      'headwall_status_inlet': m.headwallstatusinlet,
      'headwall_explanation_inlet': m.headwallexplainationinlet,
      'headwall_status_outlet': m.headwallstatusoutlet,
      'headwall_explanation_outlet': m.headwallexplainationoutlet,

      'wingwall_status_inlet': m.wingwallstatusinlet,
      'wingwall_explanation_inlet': m.wingwallexplanationinlet,
      'wingwall_status_outlet': m.wingwallstatusoutlet,
      'wingwall_explanation_outlet': m.wingwallexplanationoutlet,

      'sump_status_inlet': m.sumpstatusinlet,
      'sump_explanation_inlet': m.sumpexplanationinlet,
      'sump_status_outlet': m.sumpstatusoutlet,
      'sump_explanation_outlet': m.sumpexplanationoutlet,

      'apron_status_inlet': m.apronstatusinlet,
      'apron_explanation_inlet': m.apronexplanationinlet,
      'apron_status_outlet': m.apronstatusoutlet,
      'apron_explanation_outlet': m.apronexplanationoutlet,

      'incdrain_status_inlet': m.incdrainstatusinlet,
      'incdrain_explanation_inlet': m.incdrainexplanationinlet,
      'incdrain_status_outlet': m.incdrainstatusoutlet,
      'incdrain_explanation_outlet': m.incdrainexplanationoutlet,

      'routinedefect1': m.routinedefect1,
      'otherdefect1': m.otherdefect1,
      'routinedefect2': m.routinedefect2,
      'otherdefect2': m.otherdefect2,
      'routinedefect3': m.routinedefect3,
      'otherdefect3': m.otherdefect3,
      'routinedefect4': m.routinedefect4,
      'otherdefect4': m.otherdefect4,
      'routinedefect5': m.routinedefect5,
      'otherdefect5': m.otherdefect5,

      'images': m.images,
      'images2': m.images2,
      'images3': m.images3,
      'images4': m.images4,
    };
  }
}