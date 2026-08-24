class SlopeinspectionModel {
  String? id;
  String? dateofinspection;
  String? dateoflastinspection;
  String? inspectedby;
  SlopeElement? drainageelement;
  List<SummaryItem>? summary;
  String? error;

  SlopeinspectionModel({
    this.id,
    this.dateofinspection,
    this.dateoflastinspection,
    this.inspectedby,
    this.drainageelement,
    this.summary,
  });

  SlopeinspectionModel.withError(String errorMessage) {
    error = errorMessage;
  }

  factory SlopeinspectionModel.fromJson(Map<String, dynamic> json) {
    return SlopeinspectionModel(
      id: json['id'],
      dateofinspection: json['dateofinspection'],
      dateoflastinspection: json['dateoflastinspection'],
      inspectedby: json['inspectedby'],
      drainageelement: json['bridgeelement'] != null
          ? SlopeElement.fromJson(json['bridgeelement'] as Map<String, dynamic>)
          : null,
      summary: (json['summary'] as List?)
          ?.map((e) => SummaryItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['dateofinspection'] = dateofinspection;
    data['dateoflastinspection'] = dateoflastinspection;
    data['inspectedby'] = inspectedby;
    if (drainageelement != null) {
      data['drainageelement'] = drainageelement!.toJson();
    }
    if (summary != null) {
      data['summary'] = summary!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SlopeElement {
  String? siltationdiameterinlet;
  String? weathercondition;
  String? siltationdiameteroutlet;
  String? vegecoverinlet;
  String? vegecoveroutlet;
  String? headwallstatusinlet;
  String? headwallexplainationinlet;
  String? headwallstatusoutlet;
  String? headwallexplainationoutlet;
  String? wingwallstatusinlet;
  String? wingwallexplanationinlet;
  String? wingwallstatusoutlet;
  String? wingwallexplanationoutlet;
  String? sumpstatusinlet;
  String? sumpexplanationinlet;
  String? sumpstatusoutlet;
  String? sumpexplanationoutlet;
  String? apronstatusinlet;
  String? apronexplanationinlet;
  String? apronstatusoutlet;
  String? apronexplanationoutlet;
  String? incdrainstatusinlet;
  String? incdrainexplanationinlet;
  String? incdrainstatusoutlet;
  String? incdrainexplanationoutlet;
  String? routinedefect1;
  String? otherdefect1;
  String? routinedefect2;
  String? otherdefect2;
  String? routinedefect3;
  String? otherdefect3;
  String? routinedefect4;
  String? otherdefect4;
  String? routinedefect5;
  String? otherdefect5;



  SlopeElement({
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
  });

  factory SlopeElement.fromJson(Map<String, dynamic> json) {
    return SlopeElement(
      weathercondition: json['weather_condition'],
      siltationdiameterinlet: json['siltation_diameter_inlet'],
      siltationdiameteroutlet: json['siltation_diameter_outlet'],
      vegecoverinlet: json['vege_cover_inlet'],
      vegecoveroutlet: json['vege_cover_outlet'],
      headwallstatusinlet: json['headwall_status_inlet'],
      headwallexplainationinlet: json['headwall_explanation_inlet'],
      headwallstatusoutlet: json['headwall_status_outlet'],
      headwallexplainationoutlet: json['headwall_explanation_outlet'],
      wingwallstatusinlet: json['wingwall_status_inlet'],
      wingwallexplanationinlet: json['wingwall_explanation_inlet'],
      wingwallstatusoutlet: json['wingwall_status_outlet'],
      wingwallexplanationoutlet: json["wingwall_explanation_outlet"],
      sumpstatusinlet: json["sump_status_inlet"],
      sumpexplanationinlet: json["sump_explanation_inlet"],
      sumpstatusoutlet: json["sump_status_outlet"],
      sumpexplanationoutlet: json["sump_explanation_outlet"],
      apronstatusinlet: json["apron_status_inlet"],
      apronexplanationinlet: json["apron_explanation_inlet"],
      apronstatusoutlet: json["apron_status_outlet"],
      apronexplanationoutlet: json["apron_explanation_outlet"],
      incdrainstatusinlet: json["incdrain_status_inlet"],
      incdrainexplanationinlet: json["incdrain_explanation_inlet"],
      incdrainstatusoutlet: json["incdrain_status_outlet"],
      incdrainexplanationoutlet: json["incdrain_explanation_outlet"],
      routinedefect1: json["routinedefect"],
      otherdefect1: json["otherdefect"],
      routinedefect2: json["routinedefect2"],
      otherdefect2: json["otherdefect2"],
      routinedefect3: json["routinedefect3"],
      otherdefect3: json["otherdefect3"],
      routinedefect4: json["routinedefect4"],
      otherdefect4: json["otherdefect4"],
      routinedefect5: json["routinedefect5"],
      otherdefect5: json["otherdefect5"],

    );
  }

  Map<String, dynamic> toJson() {
    return {
      'weather_condition' : weathercondition,
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
      
    };
  }
}

class SummaryItem {
  String? routinedefect;
  String? otherdefect;

  SummaryItem({this.routinedefect, this.otherdefect});

  factory SummaryItem.fromJson(Map<String, dynamic> json) {
    return SummaryItem(
      routinedefect: json['routinedefect'],
      otherdefect: json['otherdefect'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'routinedefect': routinedefect,
      'otherdefect': otherdefect,
    };
  }
}