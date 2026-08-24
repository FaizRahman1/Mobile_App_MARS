
class DrainageinventoryModel {
  int? datacount;
  int? resultcount;
  String? page;
  List<Inventories>? rows;
  String? error;

  DrainageinventoryModel(
      {this.datacount, this.resultcount, this.page, this.rows});

  DrainageinventoryModel.withError(String errorMessage) {
    error = errorMessage;
  }

  DrainageinventoryModel.fromJson(Map<String, dynamic> json) {
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
  String? drainageid;
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
  String? purpose;

  Inventories(
      {this.drainageid,
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
      this.purpose});

  Inventories.fromJson(Map<String, dynamic> json) {
    drainageid = json['drainageid'];

    // --- FIX: Parse 'id' safely ---
    id = (json['id'] != null) ? int.tryParse(json['id'].toString()) : null;
    // --- END OF FIX ---

    section = json['section'];
    locoffeature = json['locoffeature'];
    locoffeatureFname = json['locoffeature_fname'];
    route = json['route'];
    routeFname = json['route_fname'];
    kmlocation = json['kmlocation'];
    featurename = json['featurename'];
    featurenameFname = json['featurename_fname'];
    
    purpose = json['purpose'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['drainageid'] = drainageid;
    data['id'] = id;
    
    data['section'] = section;
    data['locoffeature'] = locoffeature;
    data['locoffeature_fname'] = locoffeatureFname;
    data['route'] = route;
    data['route_fname'] = routeFname;
    data['kmlocation'] = kmlocation;
    data['featurename'] = featurename;
    data['featurename_fname'] = featurenameFname;
    data['purpose'] = purpose;
    return data;
  }
}