class SlopeModel {
  String? id;

  /// Keep same naming style as your old model (string dates)
  /// (If your API uses different keys, fromJson handles it)
  String? dateofinspection;
  String? dateoflastinspection;

  Slope? slope;
  String? error;

  SlopeModel({
    this.id,
    this.dateofinspection,
    this.dateoflastinspection,
    this.slope,
  });

  SlopeModel.withError(String errorMessage) {
    error = errorMessage;
  }

  SlopeModel.fromJson(Map<String, dynamic> json) {
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

    // Accept a few possible keys depending on backend
    final dynamic d = json['slope'] ?? json['dr'] ?? json['substructure'];
    slope = (d is Map<String, dynamic>) ? Slope.fromJson(d) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['dateofinspection'] = dateofinspection;
    data['dateoflastinspection'] = dateoflastinspection;

    if (slope != null) {
      data['drainage'] = slope!.toJson();
    }
    return data;
  }
}

class Slope {
  // ===== Drainage fields =====
  String? siltationdiameterinlet;
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

  // ===== Routine defects =====
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

  // ===== Images (if your API returns inside this object) =====
  List<String>? images;
  List<String>? images2;
  List<String>? images3;
  List<String>? images4;

  Slope({
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
    this.images,
    this.images2,
    this.images3,
    this.images4,
  });

  static String? _s(dynamic v) {
    if (v == null) return null;
    final s = v.toString();
    if (s.isEmpty || s == 'null') return null;
    return s;
  }

  static List<String>? _list(dynamic v) {
    if (v is List) return v.map((e) => e.toString()).toList();
    return null;
  }

  factory Slope.fromJson(Map<String, dynamic> json) {
    return Slope(
      siltationdiameterinlet: _s(json['siltation_diameter_inlet']),
      siltationdiameteroutlet: _s(json['siltation_diameter_outlet']),
      vegecoverinlet: _s(json['vege_cover_inlet']),
      vegecoveroutlet: _s(json['vege_cover_outlet']),

      headwallstatusinlet: _s(json['headwall_status_inlet']),
      headwallexplainationinlet: _s(json['headwall_explanation_inlet']),
      headwallstatusoutlet: _s(json['headwall_status_outlet']),
      headwallexplainationoutlet: _s(json['headwall_explanation_outlet']),

      wingwallstatusinlet: _s(json['wingwall_status_inlet']),
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

      images: _list(json['images']),
      images2: _list(json['images2']),
      images3: _list(json['images3']),
      images4: _list(json['images4']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['siltation_diameter_inlet'] = siltationdiameterinlet;
    data['siltation_diameter_outlet'] = siltationdiameteroutlet;
    data['vege_cover_inlet'] = vegecoverinlet;
    data['vege_cover_outlet'] = vegecoveroutlet;

    data['headwall_status_inlet'] = headwallstatusinlet;
    data['headwall_explanation_inlet'] = headwallexplainationinlet;
    data['headwall_status_outlet'] = headwallstatusoutlet;
    data['headwall_explanation_outlet'] = headwallexplainationoutlet;

    data['wingwall_status_inlet'] = wingwallstatusinlet;
    data['wingwall_explanation_inlet'] = wingwallexplanationinlet;
    data['wingwall_status_outlet'] = wingwallstatusoutlet;
    data['wingwall_explanation_outlet'] = wingwallexplanationoutlet;

    data['sump_status_inlet'] = sumpstatusinlet;
    data['sump_explanation_inlet'] = sumpexplanationinlet;
    data['sump_status_outlet'] = sumpstatusoutlet;
    data['sump_explanation_outlet'] = sumpexplanationoutlet;

    data['apron_status_inlet'] = apronstatusinlet;
    data['apron_explanation_inlet'] = apronexplanationinlet;
    data['apron_status_outlet'] = apronstatusoutlet;
    data['apron_explanation_outlet'] = apronexplanationoutlet;

    data['incdrain_status_inlet'] = incdrainstatusinlet;
    data['incdrain_explanation_inlet'] = incdrainexplanationinlet;
    data['incdrain_status_outlet'] = incdrainstatusoutlet;
    data['incdrain_explanation_outlet'] = incdrainexplanationoutlet;

    data['routinedefect1'] = routinedefect1;
    data['otherdefect1'] = otherdefect1;
    data['routinedefect2'] = routinedefect2;
    data['otherdefect2'] = otherdefect2;
    data['routinedefect3'] = routinedefect3;
    data['otherdefect3'] = otherdefect3;
    data['routinedefect4'] = routinedefect4;
    data['otherdefect4'] = otherdefect4;
    data['routinedefect5'] = routinedefect5;
    data['otherdefect5'] = otherdefect5;

    data['images'] = images;
    data['images2'] = images2;
    data['images3'] = images3;
    data['images4'] = images4;

    return data;
  }
}