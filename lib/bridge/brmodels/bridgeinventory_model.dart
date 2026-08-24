// File: lib/models/bridgeinventory_model.dart

class BridgeinventoryModel {
  int? datacount;
  int? resultcount;
  String? page;
  List<Inventories>? rows;
  String? error;

  BridgeinventoryModel(
      {this.datacount, this.resultcount, this.page, this.rows});

  BridgeinventoryModel.withError(String errorMessage) {
    error = errorMessage;
  }

  BridgeinventoryModel.fromJson(Map<String, dynamic> json) {
    datacount = json['datacount'];
    resultcount = json['resultcount'];
    page = json['page'];
    if (json['rows'] != null) {
      rows = <Inventories>[];
      json['rows'].forEach((v) {
        rows!.add(Inventories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['datacount'] = datacount;
    data['resultcount'] = resultcount;
    data['page'] = page;
    if (rows != null) {
      data['rows'] = rows!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Inventories {
  String? bridgeid;
  int? id;
  String? bridgename;
  String? section;
  String? locoffeature;
  String? locoffeatureFname;
  String? route;
  String? routeFname;
  double? kmlocation;
  String? featurename;
  String? featurenameFname;
  String? bridgetype;
  String? bridgetypeFname;
  String? bridgeowner;
  num? yearopen;
  num? nospan;
  double? totalbridgelength;
  double? skewangle;
  String? clearance;

  Inventories(
      {this.bridgeid,
      this.id,
      this.bridgename,
      this.section,
      this.locoffeature,
      this.locoffeatureFname,
      this.route,
      this.routeFname,
      this.kmlocation,
      this.featurename,
      this.featurenameFname,
      this.bridgetype,
      this.bridgetypeFname,
      this.bridgeowner,
      this.yearopen,
      this.nospan,
      this.totalbridgelength,
      this.skewangle,
      this.clearance});

  Inventories.fromJson(Map<String, dynamic> json) {
    bridgeid = json['bridgeid'];

    // --- FIX: Parse 'id' safely ---
    id = (json['id'] != null) ? int.tryParse(json['id'].toString()) : null;
    // --- END OF FIX ---

    bridgename = json['bridgename'];
    section = json['section'];
    locoffeature = json['locoffeature'];
    locoffeatureFname = json['locoffeature_fname'];
    route = json['route'];
    routeFname = json['route_fname'];
    kmlocation = json['kmlocation'];
    featurename = json['featurename'];
    featurenameFname = json['featurename_fname'];
    bridgetype = json['bridgetype'];
    bridgetypeFname = json['bridgetype_fname'];
    bridgeowner = json['bridgeowner'];

    // --- FIX: Parse 'yearopen' safely ---
    yearopen = (json['yearopen'] != null) ? num.tryParse(json['yearopen'].toString()) : null;
    // --- END OF FIX ---

    // --- FIX: Parse 'nospan' safely ---
    nospan = (json['nospan'] != null) ? num.tryParse(json['nospan'].toString()) : null;
    // --- END OF FIX ---

    totalbridgelength = json['totalbridgelength'];
    skewangle = json['skewangle'];
    clearance = json['clearance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['bridgeid'] = bridgeid;
    data['id'] = id;
    data['bridgename'] = bridgename;
    data['section'] = section;
    data['locoffeature'] = locoffeature;
    data['locoffeature_fname'] = locoffeatureFname;
    data['route'] = route;
    data['route_fname'] = routeFname;
    data['kmlocation'] = kmlocation;
    data['featurename'] = featurename;
    data['featurename_fname'] = featurenameFname;
    data['bridgetype'] = bridgetype;
    data['bridgetype_fname'] = bridgetypeFname;
    data['bridgeowner'] = bridgeowner;
    data['yearopen'] = yearopen;
    data['nospan'] = nospan;
    data['totalbridgelength'] = totalbridgelength;
    data['skewangle'] = skewangle;
    data['clearance'] = clearance;
    return data;
  }
}