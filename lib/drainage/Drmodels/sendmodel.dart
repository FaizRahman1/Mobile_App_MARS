// File: lib/models/sendmodel.dart
// Drainage version (refers to DRPostModel)

import 'drpost_model.dart';

class SendInfo {
  final String id;
  final int? assetInternalId;

  // ===== Drainage fields =====
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

  // ===== Routine defects =====
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

  // ===== Meta (match DRPostModel) =====
  final DateTime? dateofinsp;
  final String? inspectedby;
  final String? maintainedby;

  // ===== Images =====
  final List<String>? images;
  final List<String>? images2;
  final List<String>? images3;
  final List<String>? images4;

  const SendInfo({
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

    this.dateofinsp,
    this.inspectedby,
    this.maintainedby,

    this.images,
    this.images2,
    this.images3,
    this.images4,
  });

  /// Create SendInfo from DRPostModel
  factory SendInfo.fromDRPostModel(DRPostModel m) {
    return SendInfo(
      id: m.id,
      assetInternalId: m.assetInternalId,

      weathercondition: m.weathercondition,
      siltationdiameterinlet: m.siltationdiameterinlet,
      siltationdiameteroutlet: m.siltationdiameteroutlet,
      vegecoverinlet: m.vegecoverinlet,
      vegecoveroutlet: m.vegecoveroutlet,
      headwallstatusinlet: m.headwallstatusinlet,
      headwallexplainationinlet: m.headwallexplainationinlet,
      headwallstatusoutlet: m.headwallstatusoutlet,
      headwallexplainationoutlet: m.headwallexplainationoutlet,
      wingwallstatusinlet: m.wingwallstatusinlet,
      wingwallexplanationinlet: m.wingwallexplanationinlet,
      wingwallstatusoutlet: m.wingwallstatusoutlet,
      wingwallexplanationoutlet: m.wingwallexplanationoutlet,
      sumpstatusinlet: m.sumpstatusinlet,
      sumpexplanationinlet: m.sumpexplanationinlet,
      sumpstatusoutlet: m.sumpstatusoutlet,
      sumpexplanationoutlet: m.sumpexplanationoutlet,
      apronstatusinlet: m.apronstatusinlet,
      apronexplanationinlet: m.apronexplanationinlet,
      apronstatusoutlet: m.apronstatusoutlet,
      apronexplanationoutlet: m.apronexplanationoutlet,
      incdrainstatusinlet: m.incdrainstatusinlet,
      incdrainexplanationinlet: m.incdrainexplanationinlet,
      incdrainstatusoutlet: m.incdrainstatusoutlet,
      incdrainexplanationoutlet: m.incdrainexplanationoutlet,

      routinedefect1: m.routinedefect1,
      otherdefect1: m.otherdefect1,
      routinedefect2: m.routinedefect2,
      otherdefect2: m.otherdefect2,
      routinedefect3: m.routinedefect3,
      otherdefect3: m.otherdefect3,
      routinedefect4: m.routinedefect4,
      otherdefect4: m.otherdefect4,
      routinedefect5: m.routinedefect5,
      otherdefect5: m.otherdefect5,

      dateofinsp: m.dateofinsp,
      inspectedby: m.inspectedby,
      maintainedby: m.maintainedby,

      images: m.images,
      images2: m.images2,
      images3: m.images3,
      images4: m.images4,
    );
  }

  /// Convert SendInfo to DRPostModel (for API submit / save)
  DRPostModel toDRPostModel() {
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
}
