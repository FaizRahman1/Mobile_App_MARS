// File: lib/models/bridgeidlist_model.dart
import 'dart:convert';

class BridgeidlistModel {
  String? bridgeid;
  int? datacount;
  int? resultcount;
  String? page;
  List<Rows>? rows;
  String? error;

  BridgeidlistModel({
    this.bridgeid,
    this.datacount,
    this.resultcount,
    this.page,
    this.rows,
  });

  BridgeidlistModel.withError(String errorMessage) {
    error = errorMessage;
  }

  // --- REMOVED SORTING FROM HERE ---
  BridgeidlistModel.fromJson(Map<String, dynamic> json) {
    bridgeid = json['bridgeid'];
    datacount = json['datacount'];
    resultcount = json['resultcount'];
    page = json['page'];

    if (json['rows'] != null) {
      rows = (json['rows'] as List)
          .map((e) => Rows.fromJson(e as Map<String, dynamic>))
          .toList();

      // Sorting is now handled in ApiProviderBridgeidlist using compute()
      // rows!.sort((a, b) { ... }); // This line is removed
    }
  }
  // --- END OF REMOVAL ---

  factory BridgeidlistModel.fromJsonn(Map<dynamic, dynamic> json) {
    List<Rows> rows = [];

    if (json['rows'] != null) {
      rows = (json['rows'] as List)
          .map((e) => Rows.fromJson(e as Map<String, dynamic>))
          .toList();

      // This factory also performs sorting synchronously if used directly.
      // Consider removing sorting from here too if it's also called on the main thread.
      rows.sort((a, b) {
        final aDate = a.dateofinsp;
        final bDate = b.dateofinsp;

        if (aDate == null && bDate == null) return 0;
        if (aDate == null) return 1;
        if (bDate == null) return -1;

        return bDate.compareTo(aDate);
      });
    }

    return BridgeidlistModel(
      bridgeid: json['bridgeid'],
      datacount: json['datacount'],
      resultcount: json['resultcount'],
      page: json['page'],
      rows: rows,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'bridgeid': bridgeid,
      'datacount': datacount,
      'resultcount': resultcount,
      'page': page,
      'rows': rows?.map((v) => v.toJson()).toList(),
    };
  }

  static Map<String, dynamic> toMap(BridgeidlistModel model) => {
        'datacount': model.datacount,
        'bridgeid': model.bridgeid,
        'page': model.page,
        'resultcount': model.resultcount,
        'rows': model.rows?.map((e) => e.toJson()).toList(),
      };

  static String encode(List<BridgeidlistModel>? list) => json.encode(
        list!
            .map<Map<String, dynamic>>(
                (model) => BridgeidlistModel.toMap(model))
            .toList(),
      );

  static List<BridgeidlistModel> decode(String list) =>
      (json.decode(list) as List<dynamic>)
          .map<BridgeidlistModel>(
              (item) => BridgeidlistModel.fromJson(item)) // Uses the modified fromJson
          .toList();
}

/// -------------------------------
/// ROWS MODEL
/// -------------------------------
class Rows {
  String? id;
  DateTime? dateoflastinsp;
  DateTime? dateofinsp;
  String? inspby;

  Rows({this.id, this.dateoflastinsp, this.dateofinsp, this.inspby});

  Rows.fromJson(Map<String, dynamic> json) {
    id = json['id'];

    final lastInsp = json['dateoflastinsp'];
    dateoflastinsp =
        lastInsp != null ? DateTime.tryParse(lastInsp) : null;

    final insp = json['dateofinsp'];
    dateofinsp = insp != null ? DateTime.tryParse(insp) : null;

    inspby = json['inspby'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'dateoflastinsp': dateoflastinsp?.toIso8601String(),
      'dateofinsp': dateofinsp?.toIso8601String(),
      'inspby': inspby,
    };
  }

  /// Restore this so your old pages won't break
  static Map<String, dynamic> toMap(Rows item) => {
        'id': item.id,
        'dateoflastinsp': item.dateoflastinsp?.toIso8601String(),
        'dateofinsp': item.dateofinsp?.toIso8601String(),
        'inspby': item.inspby,
      };

  /// You requested this to be restored
  static String encode(List<Rows>? list) => json.encode(
        list!
            .map<Map<String, dynamic>>((item) => Rows.toMap(item))
            .toList(),
      );

  static List<Rows> decode(String list) =>
      (json.decode(list) as List<dynamic>)
          .map<Rows>((item) => Rows.fromJson(item))
          .toList();
}