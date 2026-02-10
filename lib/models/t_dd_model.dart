class TDeckDrainageModel {
  String? id;
  String? dateofinspection;
  String? dateoflastinspection;
  String? deckStructureCondition;
  String? deckStructureSeverity;
  String? deckStructureExtent;
  String? deckStructureRemarks;
  String? deckServiceCondition;
  String? deckServiceSeverity;
  String? deckServiceExtent;
  String? deckServiceRemarks;
  String? deckOther;
  String? deckOtherCondition;
  String? deckOtherSeverity;
  String? deckOtherExtent;
  String? deckOtherRemarks;
  String? deckRating;

  String? error;

  TDeckDrainageModel(
      {this.id,
      this.dateofinspection,
      this.dateoflastinspection,
      this.deckStructureCondition,
      this.deckStructureSeverity,
      this.deckStructureExtent,
      this.deckStructureRemarks,
      this.deckServiceCondition,
      this.deckServiceSeverity,
      this.deckServiceExtent,
      this.deckServiceRemarks,
      this.deckOther,
      this.deckOtherCondition,
      this.deckOtherSeverity,
      this.deckOtherExtent,
      this.deckOtherRemarks,
      this.deckRating});

  TDeckDrainageModel.withError(String errorMessage) {
    error = errorMessage;
  }

  TDeckDrainageModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dateofinspection = json['dateofinspection'];
    dateoflastinspection = json['dateoflastinspection'];
    deckStructureCondition = json['deck_structure_condition'];
    deckStructureSeverity = json['deck_structure_severity'];
    deckStructureExtent = json['deck_structure_extent'];
    deckStructureRemarks = json['deck_structure_remarks'];
    deckServiceCondition = json['deck_service_condition'];
    deckServiceSeverity = json['deck_service_severity'];
    deckServiceExtent = json['deck_service_extent'];
    deckServiceRemarks = json['deck_service_remarks'];
    deckOther = json['deck_other'];
    deckOtherCondition = json['deck_other_condition'];
    deckOtherSeverity = json['deck_other_severity'];
    deckOtherExtent = json['deck_other_extent'];
    deckOtherRemarks = json['deck_other_remarks'];
    deckRating = json['deck_rating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['dateofinspection'] = dateofinspection;
    data['dateoflastinspection'] = dateoflastinspection;
    data['deck_structure_condition'] = deckStructureCondition;
    data['deck_structure_severity'] = deckStructureSeverity;
    data['deck_structure_extent'] = deckStructureExtent;
    data['deck_structure_remarks'] = deckStructureRemarks;
    data['deck_service_condition'] = deckServiceCondition;
    data['deck_service_severity'] = deckServiceSeverity;
    data['deck_service_extent'] = deckServiceExtent;
    data['deck_service_remarks'] = deckServiceRemarks;
    data['deck_other'] = deckOther;
    data['deck_other_condition'] = deckOtherCondition;
    data['deck_other_severity'] = deckOtherSeverity;
    data['deck_other_extent'] = deckOtherExtent;
    data['deck_other_remarks'] = deckOtherRemarks;
    data['deck_rating'] = deckRating;
    return data;
  }
}
