import 'dart:convert';

import 'package:flutter/gestures.dart';

class DRPostModel {
  final String id;
  final int? assetInternalId;

  // ===== drainage  =====
  final String? weathercondition;
  final String? siltationdiameterinlet;
  final String? siltationdiameteroutlet;
  final String? vegecoverinlet;
  final String? vegecoveroutlet;
  final String? headwallstatusinlet;
  final String? headwallexplainationinlet;
  final String? headwallstatusoutlet;
  final String? headwallexplainationoutlet;
  final String? wingwallstatusinlet;
  final String? wingwallexplanationinlet;
  final String? wingwallstatusoutlet;
  final String? wingwallexplanationoutlet;
  final String? sumpstatusinlet;
  final String? sumpexplanationinlet;
  final String? sumpstatusoutlet;
  final String? sumpexplanationoutlet;
  final String? apronstatusinlet;
  final String? apronexplanationinlet;
  final String? apronstatusoutlet;
  final String? apronexplanationoutlet;
  final String? incdrainstatusinlet;
  final String? incdrainexplanationinlet;
  final String? incdrainstatusoutlet;
  final String? incdrainexplanationoutlet;
  final String? routinedefect1;
  final String? otherdefect1;
  final String? routinedefect2;
  final String? otherdefect2;
  final String? routinedefect3;
  final String? otherdefect3;
  final String? routinedefect4;
  final String? otherdefect4;
  final String? routinedefect5;
  final String? otherdefect5;

  // ===== Meta =====
  final DateTime dateofinsp;
  final String inspectedby;
  final String maintainedby;

  // ===== Images =====
  final List<String>? images;
  final List<String>? images2;
  final List<String>? images3;
  final List<String>? images4;

  DRPostModel({
    required this.id,
    this.assetInternalId,

    this.weathercondition,
    this.siltationdiameterinlet,
    this.siltationdiameteroutlet,
    this.vegecoverinlet,
    this.vegecoveroutlet,
    this.headwallstatusinlet,
    this.headwallexplainationinlet,
    this.headwallstatusoutlet,
    this.headwallexplainationoutlet,
    this.wingwallstatusinlet,
    this.wingwallexplanationinlet,
    this.wingwallstatusoutlet,
    this.wingwallexplanationoutlet,
    this.sumpstatusinlet,
    this.sumpexplanationinlet,
    this.sumpstatusoutlet,
    this.sumpexplanationoutlet,
    this.apronstatusinlet,
    this.apronexplanationinlet,
    this.apronstatusoutlet,
    this.apronexplanationoutlet,
    this.incdrainstatusinlet,
    this.incdrainexplanationinlet,
    this.incdrainstatusoutlet,
    this.incdrainexplanationoutlet,
    this.routinedefect1,
    this.otherdefect1,
    this.routinedefect2,
    this.otherdefect2,
    this.routinedefect3,
    this.otherdefect3,
    this.routinedefect4,
    this.otherdefect4,
    this.routinedefect5,
    this.otherdefect5,

    required this.dateofinsp,
    required this.inspectedby,
    required this.maintainedby,

    this.images,
    this.images2,
    this.images3,
    this.images4,
  });

  // NOTE: This helper makes decoding old saved JSON safe.
  static String? _s(dynamic v) {
    if (v == null) return null;
    if (v == 'null') return null;
    final s = v.toString();
    if (s.isEmpty) return null;
    return s;
  }

  factory DRPostModel.fromJson(Map<String, dynamic> json) {
    final DateTime safeDate = () {
      final v = json['dateofinsp'];
      if (v == null) return DateTime.now();
      return DateTime.tryParse(v.toString()) ?? DateTime.now();
    }();

    return DRPostModel(
      id: (json['id'] ?? '').toString(),
      assetInternalId: int.tryParse(
        (json['assetInternalId'] ?? '').toString(),
      ),

      weathercondition:
          _s(json['weather_condition'] ?? json['weater_condition']),
      siltationdiameterinlet: _s(json['siltation_diameter_inlet']),
      siltationdiameteroutlet: _s(json['siltation_diameter_outlet']),
      vegecoverinlet: _s(json['vege_cover_inlet']),
      vegecoveroutlet: _s(json['vege_cover_outlet']),
      headwallstatusinlet: _s(json['headwall_status_inlet']),
      headwallexplainationinlet: _s(json['headwall_explanation_inlet']),
      headwallstatusoutlet: _s(json['headwall_status_outlet']),
      headwallexplainationoutlet: _s(json['headwall_explanation_outlet']),
      wingwallstatusinlet: _s(json['wingwall_status_inle']),
      wingwallexplanationinlet: _s(json['wingwall_explanation_inlet']),
      wingwallstatusoutlet: _s(json['wingwall_status_outlet']),
      wingwallexplanationoutlet: _s(json['wingwall_explanation_outlet']),
      sumpstatusinlet: _s(json['sump_status_inlet']),
      sumpexplanationinlet: _s(json['sump_explanation_inlet']),
      sumpstatusoutlet: _s(json['sump_status_outlet']),
      sumpexplanationoutlet: _s(json['sump_explanation_outlet']),
      apronstatusinlet: _s(json['apron_status_inlet']),
      apronexplanationinlet: _s(json['apron_explanation_inlet']),
      apronstatusoutlet: _s(json['apron_status_outlet']),
      apronexplanationoutlet: _s(json['apron_explanation_outlet']),
      incdrainstatusinlet: _s(json['incdrain_status_inlet']),
      incdrainexplanationinlet: _s(json['incdrain_explanation_inlet']),
      incdrainstatusoutlet: _s(json['incdrain_status_outlet']),
      incdrainexplanationoutlet: _s(json['incdrain_explanation_outlet']),
      routinedefect1: _s(json['routinedefect1']),
      otherdefect1: _s(json['otherdefect1']),
      routinedefect2: _s(json['routinedefect2']),
      otherdefect2: _s(json['otherdefect2']),
      routinedefect3: _s(json['routinedefect3']),
      otherdefect3: _s(json['otherdefect3']),
      routinedefect4: _s(json['routinedefect4']),
      otherdefect4: _s(json['otherdefect4']),
      routinedefect5: _s(json['routinedefect5']),
      otherdefect5: _s(json['otherdefect5']),

      dateofinsp: safeDate,
      inspectedby: (json['inspectedby'] ?? 'MobileUser').toString(),
      maintainedby: (json['maintainedby'] ?? 'PLUS').toString(),

      images: (json['images'] as List?)?.map((e) => e.toString()).toList(),
      images2: (json['images2'] as List?)?.map((e) => e.toString()).toList(),
      images3: (json['images3'] as List?)?.map((e) => e.toString()).toList(),
      images4: (json['images4'] as List?)?.map((e) => e.toString()).toList(),
    );
  }

  // This factory is used by your save logic (InspectionPage)
  factory DRPostModel.fromFormValues({
    required String id,
    int? assetInternalId,
    DateTime? dateofinsp,
    String? inspectedby,
    String? maintainedby,

    String? weathercondition,
    String? siltationdiameterinlet,
    String? siltationdiameteroutlet,
    String? vegecoverinlet,
    String? vegecoveroutlet,
    String? headwallstatusinlet,
    String? headwallexplainationinlet,
    String? headwallstatusoutlet,
    String? headwallexplainationoutlet,
    String? wingwallstatusinlet,
    String? wingwallexplanationinlet,
    String? wingwallstatusoutlet,
    String? wingwallexplanationoutlet,
    String? sumpstatusinlet,
    String? sumpexplanationinlet,
    String? sumpstatusoutlet,
    String? sumpexplanationoutlet,
    String? apronstatusinlet,
    String? apronexplanationinlet,
    String? apronstatusoutlet,
    String? apronexplanationoutlet,
    String? incdrainstatusinlet,
    String? incdrainexplanationinlet,
    String? incdrainstatusoutlet,
    String? incdrainexplanationoutlet,
    String? routinedefect1,
    String? otherdefect1,
    String? routinedefect2,
    String? otherdefect2,
    String? routinedefect3,
    String? otherdefect3,
    String? routinedefect4,
    String? otherdefect4,
    String? routinedefect5,
    String? otherdefect5,

    List<String>? images,
    List<String>? images2,
    List<String>? images3,
    List<String>? images4,
  }) {
    return DRPostModel(
      id: id,
      assetInternalId: assetInternalId,
      dateofinsp: dateofinsp ?? DateTime.now(),
      inspectedby: inspectedby ?? 'MobileUser',
      maintainedby: maintainedby ?? 'PLUS',

      weathercondition: weathercondition,
      siltationdiameterinlet: siltationdiameterinlet,
      siltationdiameteroutlet: siltationdiameteroutlet,
      vegecoverinlet: vegecoverinlet,
      vegecoveroutlet: vegecoveroutlet,
      headwallstatusinlet: headwallstatusinlet,
      headwallexplainationinlet: headwallexplainationinlet,
      headwallstatusoutlet: headwallstatusoutlet,
      headwallexplainationoutlet: headwallexplainationoutlet,
      wingwallstatusinlet: wingwallstatusinlet,
      wingwallexplanationinlet: wingwallexplanationinlet,
      wingwallstatusoutlet: wingwallstatusoutlet,
      wingwallexplanationoutlet: wingwallexplanationoutlet,
      sumpstatusinlet: sumpstatusinlet,
      sumpexplanationinlet: sumpexplanationinlet,
      sumpstatusoutlet: sumpstatusoutlet,
      sumpexplanationoutlet: sumpexplanationoutlet,
      apronstatusinlet: apronstatusinlet,
      apronexplanationinlet: apronexplanationinlet,
      apronstatusoutlet: apronstatusoutlet,
      apronexplanationoutlet: apronexplanationoutlet,
      incdrainstatusinlet: incdrainstatusinlet,
      incdrainexplanationinlet: incdrainexplanationinlet,
      incdrainstatusoutlet: incdrainstatusoutlet,
      incdrainexplanationoutlet: incdrainexplanationoutlet,
      routinedefect1: routinedefect1,
      otherdefect1: otherdefect1,
      routinedefect2: routinedefect2,
      otherdefect2: otherdefect2,
      routinedefect3: routinedefect3,
      otherdefect3: otherdefect3,
      routinedefect4: routinedefect4,
      otherdefect4: otherdefect4,
      routinedefect5: routinedefect5,
      otherdefect5: otherdefect5,


      images: images,
      images2: images2,
      images3: images3,
      images4: images4,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'assetInternalId': assetInternalId,
    'weather_condition': weathercondition,
    'siltation_diameter_inlet': siltationdiameterinlet,
    'siltation_diameter_outlet': siltationdiameteroutlet,
    'vege_cover_inlet': vegecoverinlet,
    'vege_cover_outlet': vegecoveroutlet,
    'headwall_status_inlet': headwallstatusinlet,
    'headwall_explanation_inlet': headwallexplainationinlet,
    'headwall_status_outlet': headwallstatusoutlet,
    'headwall_explanation_outlet': headwallexplainationoutlet,
    'wingwall_status_inlet': wingwallstatusinlet,
    'wingwall_explanation_inlet': wingwallexplanationinlet,
    'wingwall_status_outlet': wingwallstatusoutlet,
    'wingwall_explanation_outlet': wingwallexplanationoutlet,
    'sump_status_inlet': sumpstatusinlet,
    'sump_explanation_inlet': sumpexplanationinlet,
    'sump_status_outlet': sumpstatusoutlet,
    'sump_explanation_outlet': sumpexplanationoutlet,
    'apron_status_inlet': apronstatusinlet,
    'apron_explanation_inlet': apronexplanationinlet,
    'apron_status_outlet': apronstatusoutlet,
    'apron_explanation_outlet': apronexplanationoutlet,
    'incdrain_status_inlet': incdrainstatusinlet,
    'incdrain_explanation_inlet': incdrainexplanationinlet,
    'incdrain_status_outlet': incdrainstatusoutlet,
    'incdrain_explanation_outlet': incdrainexplanationoutlet,
    'routinedefect1':routinedefect1,
    'otherdefect1': otherdefect1,
    'routinedefect2': routinedefect2,
    'otherdefect2': otherdefect2,
    'routinedefect3': routinedefect3,
    'otherdefect3': otherdefect3,
    'routinedefect4': routinedefect4,
    'otherdefect4': otherdefect4,
    'routinedefect5': routinedefect5,
    'otherdefect5': otherdefect5,
    'dateofinsp': dateofinsp.toIso8601String(),
    'inspectedby': inspectedby,
    'maintainedby': maintainedby,
    'images': images,
    'images2': images2,
    'images3': images3,
    'images4': images4,
  };

  static String encode(List<DRPostModel> list) =>
      json.encode(list.map((e) => e.toJson()).toList());

  static List<DRPostModel> decode(String source) =>
      (json.decode(source) as List).map((e) => DRPostModel.fromJson(e)).toList();
}
