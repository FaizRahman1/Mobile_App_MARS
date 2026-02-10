class SubstructureModel {
  String? id;
  String? dateofinspection;
  String? dateoflastinspection;
  //Substructure? Substructure;
  //Substructure? Substructure;
  Substructure? substructure;
  String? error;

  SubstructureModel(
      {this.id,
      this.dateofinspection,
      this.dateoflastinspection,
      //this.Substructure,
      //this.Substructure
      this.substructure});

  SubstructureModel.withError(String errorMessage) {
    error = errorMessage;
  }

  SubstructureModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dateofinspection = json['dateofinspection'];
    dateoflastinspection = json['dateoflastinspection'];

    /*
    Substructure = json['superstructure_primary2'] != null
        ? new Substructure.fromJson(json['superstructure_primary2'])
        : null;
    Substructure = json['superstructure_primary3'] != null
        ? new Substructure.fromJson(json['superstructure_primary3'])
        : null;
    */
    substructure = json['substructure'] != null
        ? Substructure.fromJson(json['substructure'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['dateofinspection'] = dateofinspection;
    data['dateoflastinspection'] = dateoflastinspection;

    /*
    if (this.Substructure != null) {
      data['superstructure_primary2'] = this.Substructure!.toJson();
    }
    if (this.Substructure != null) {
      data['superstructure_primary3'] = this.Substructure!.toJson();
    }
    */

    if (substructure != null) {
      data['substructure'] = substructure!.toJson();
    }
    return data;
  }
}

class Substructure {
  String? abutmentfoundationSoilCondition;
  int? abutmentfoundationSoilAlignmentSeverity;
  int? abutmentfoundationSoilAlignmentExtent;
  String? abutmentfoundationSoilAlignmentRemarks;
  String? abutmentfoundationDisplacementCondition;
  int? abutmentfoundationDisplacementSeverity;
  int? abutmentfoundationDisplacementExtent;
  String? abutmentfoundationDisplacementRemarks;
  String? abutmentfoundationCrackCondition;
  int? abutmentfoundationCrackSeverity;
  int? abutmentfoundationCrackExtent;
  String? abutmentfoundationCrackRemarks;
  String? abutmentfoundationSpallCondition;
  int? abutmentfoundationSpallSeverity;
  int? abutmentfoundationSpallExtent;
  String? abutmentfoundationSpallRemarks;
  String? abutmentfoundationCorrosionCondition;
  int? abutmentfoundationCorrosionSeverity;
  int? abutmentfoundationCorrosionExtent;
  String? abutmentfoundationCorrosionRemarks;
  String? abutmentfoundationDegradeCondition;
  int? abutmentfoundationDegradeSeverity;
  int? abutmentfoundationDegradeExtent;
  String? abutmentfoundationDegradeRemarks;
  String? abutmentfoundationOthers;
  String? abutmentfoundationOthersCondition;
  int? abutmentfoundationOthersSeverity;
  int? abutmentfoundationOthersExtent;
  String? abutmentfoundationOthersRemarks;

  String? abutmentwingwallDisplaceCondition;
  int? abutmentwingwallDisplaceSeverity;
  int? abutmentwingwallDisplaceExtent;
  String? abutmentwingwallDisplaceRemarks;
  String? abutmentwingwallCrackCondition;
  int? abutmentwingwallCrackSeverity;
  int? abutmentwingwallCrackExtent;
  String? abutmentwingwallCrackRemarks;
  String? abutmentwingwallSpallCondition;
  int? abutmentwingwallSpallSeverity;
  int? abutmentwingwallSpallExtent;
  String? abutmentwingwallSpallRemarks;
  String? abutmentwingwallCorrosionCondition;
  int? abutmentwingwallCorrosionSeverity;
  int? abutmentwingwallCorrosionExtent;
  String? abutmentwingwallCorrosionRemarks;
  String? abutmentwingwallDegradeCondition;
  int? abutmentwingwallDegradeSeverity;
  int? abutmentwingwallDegradeExtent;
  String? abutmentwingwallDegradeRemarks;
  String? abutmentwingwallWeepholesCondition;
  int? abutmentwingwallWeepholesSeverity;
  int? abutmentwingwallWeepholesExtent;
  String? abutmentwingwallWeepholesRemarks;
  String? abutmentwingwallOthers;
  String? abutmentwingwallOthersCondition;
  int? abutmentwingwallOthersSeverity;
  int? abutmentwingwallOthersExtent;
  String? abutmentwingwallOthersRemarks;
  int? abutmentwingwallRating;
  String? pierpilecapSoilCondition;
  int? pierpilecapSoilSeverity;
  int? pierpilecapSoilExtent;
  String? pierpilecapSoilRemarks;
  String? pierpilecapDisplacementCondition;
  int? pierpilecapDisplacementSeverity;
  int? pierpilecapDisplacementExtent;
  String? pierpilecapDisplacementRemarks;
  String? pierpilecapCrackCondition;
  int? pierpilecapCrackSeverity;
  int? pierpilecapCrackExtent;
  String? pierpilecapCrackRemarks;
  String? pierpilecapSpallCondition;
  int? pierpilecapSpallSeverity;
  int? pierpilecapSpallExtent;
  String? pierpilecapSpallRemarks;
  String? pierpilecapCorrosionCondition;
  int? pierpilecapCorrosionSeverity;
  int? pierpilecapCorrosionExtent;
  String? pierpilecapCorrosionRemarks;
  String? pierpilecapDegradeCondition;
  int? pierpilecapDegradeSeverity;
  int? pierpilecapDegradeExtent;
  String? pierpilecapDegradeRemarks;
  String? pierpilecapOthers;
  String? pierpilecapOthersCondition;
  int? pierpilecapOthersSeverity;
  int? pierpilecapOthersExtent;
  String? pierpilecapOthersRemarks;
  int? pierpilecapRating;
  String? pierDisplaceCondition;
  int? pierDisplaceSeverity;
  int? pierDisplaceExtent;
  String? pierDisplaceRemarks;
  String? pierCrackCondition;
  int? pierCrackSeverity;
  int? pierCrackExtent;
  String? pierCrackRemarks;
  String? pierSpallCondition;
  int? pierSpallSeverity;
  int? pierSpallExtent;
  String? pierSpallRemarks;
  String? pierCorrosionCondition;
  int? pierCorrosionSeverity;
  int? pierCorrosionExtent;
  String? pierCorrosionRemarks;
  String? pierDegradeCondition;
  int? pierDegradeSeverity;
  int? pierDegradeExtent;
  String? pierDegradeRemarks;
  String? pierOthers;
  String? pierOthersCondition;
  int? pierOthersSeverity;
  int? pierOthersExtent;
  String? pierOthersRemarks;
  int? pierOthersRating;

  String? pierriverScourCondition;
  int? pierriverScourSeverity;
  int? pierriverScourExtent;
  String? pierriverScourRemarks;
  String? pierriverDebrisCondition;
  int? pierriverDebrisSeverity;
  int? pierriverDebrisExtent;
  String? pierriverDebrisRemarks;
  String? pierriverCrackCondition;
  int? pierriverCrackSeverity;
  int? pierriverCrackExtent;
  String? pierriverCrackRemarks;
  String? pierriverSpallCondition;
  int? pierriverSpallSeverity;
  int? pierriverSpallExtent;
  String? pierriverSpallRemarks;
  String? pierriverCorrosionCondition;
  int? pierriverCorrosionSeverity;
  int? pierriverCorrosionExtent;
  String? pierriverCorrosionRemarks;
  String? pierriverDegradeCondition;
  int? pierriverDegradeSeverity;
  int? pierriverDegradeExtent;
  String? pierriverDegradeRemarks;
  String? pierriverOthers;
  String? pierriverOthersCondition;
  int? pierriverOthersSeverity;
  int? pierriverOthersExtent;
  String? pierriverOthersRemarks;
  int? pierriverRating;
  String? slopeprotectionDisintegrationCondition;
  int? slopeprotectionDisintegrationSeverity;
  int? slopeprotectionDisintegrationExtent;
  String? slopeprotectionDisintegrationRemarks;
  String? slopeprotectionScouringCondition;
  int? slopeprotectionScouringSeverity;
  int? slopeprotectionScouringExtent;
  String? slopeprotectionScouringRemarks;
  String? slopeprotectionErosionCondition;
  int? slopeprotectionErosionSeverity;
  int? slopeprotectionErosionExtent;
  String? slopeprotectionErosionRemarks;
  String? slopeprotectionOthers;
  String? slopeprotectionOthersCondition;
  int? slopeprotectionOthersSeverity;
  int? slopeprotectionOthersExtent;
  String? slopeprotectionOthersRemarks;
  int? slopeprotectionRating;
  String? pierprotectionCrackCondition;
  int? pierprotectionCrackSeverity;
  int? pierprotectionCrackExtent;
  String? pierprotectionCrackRemarks;
  String? pierprotectionSpallCondition;
  int? pierprotectionSpallSeverity;
  int? pierprotectionSpallExtent;
  String? pierprotectionSpallRemarks;
  String? pierprotectionCorrosionCondition;
  int? pierprotectionCorrosionSeverity;
  int? pierprotectionCorrosionExtent;
  String? pierprotectionCorrosionRemarks;
  String? pierprotectionOthers;
  String? pierprotectionOthersCondition;
  int? pierprotectionOthersSeverity;
  int? pierprotectionOthersExtent;
  String? pierprotectionOthersRemarks;
  int? pierprotectionRating;

  String? riverBlockageCondition;
  int? riverBlockageCorrosionSeverity;
  int? riverBlockageCorrosionExtent;
  String? riverBlockageCorrosionRemarks;
  String? riverOthers;
  String? riverOthersCondition;
  int? riverOthersCorrosionSeverity;
  int? riverOthersCorrosionExtent;
  String? riverOthersCorrosionRemarks;
  int? riverRating;

  Substructure(
      {this.abutmentfoundationSoilCondition,
      this.abutmentfoundationSoilAlignmentSeverity,
      this.abutmentfoundationSoilAlignmentExtent,
      this.abutmentfoundationSoilAlignmentRemarks,
      this.abutmentfoundationDisplacementCondition,
      this.abutmentfoundationDisplacementSeverity,
      this.abutmentfoundationDisplacementExtent,
      this.abutmentfoundationDisplacementRemarks,
      this.abutmentfoundationCrackCondition,
      this.abutmentfoundationCrackSeverity,
      this.abutmentfoundationCrackExtent,
      this.abutmentfoundationCrackRemarks,
      this.abutmentfoundationSpallCondition,
      this.abutmentfoundationSpallSeverity,
      this.abutmentfoundationSpallExtent,
      this.abutmentfoundationSpallRemarks,
      this.abutmentfoundationCorrosionCondition,
      this.abutmentfoundationCorrosionSeverity,
      this.abutmentfoundationCorrosionExtent,
      this.abutmentfoundationCorrosionRemarks,
      this.abutmentfoundationDegradeCondition,
      this.abutmentfoundationDegradeSeverity,
      this.abutmentfoundationDegradeExtent,
      this.abutmentfoundationDegradeRemarks,
      this.abutmentfoundationOthers,
      this.abutmentfoundationOthersCondition,
      this.abutmentfoundationOthersSeverity,
      this.abutmentfoundationOthersExtent,
      this.abutmentfoundationOthersRemarks,
      this.abutmentwingwallDisplaceCondition,
      this.abutmentwingwallDisplaceSeverity,
      this.abutmentwingwallDisplaceExtent,
      this.abutmentwingwallDisplaceRemarks,
      this.abutmentwingwallCrackCondition,
      this.abutmentwingwallCrackSeverity,
      this.abutmentwingwallCrackExtent,
      this.abutmentwingwallCrackRemarks,
      this.abutmentwingwallSpallCondition,
      this.abutmentwingwallSpallSeverity,
      this.abutmentwingwallSpallExtent,
      this.abutmentwingwallSpallRemarks,
      this.abutmentwingwallCorrosionCondition,
      this.abutmentwingwallCorrosionSeverity,
      this.abutmentwingwallCorrosionExtent,
      this.abutmentwingwallCorrosionRemarks,
      this.abutmentwingwallDegradeCondition,
      this.abutmentwingwallDegradeSeverity,
      this.abutmentwingwallDegradeExtent,
      this.abutmentwingwallDegradeRemarks,
      this.abutmentwingwallWeepholesCondition,
      this.abutmentwingwallWeepholesSeverity,
      this.abutmentwingwallWeepholesExtent,
      this.abutmentwingwallWeepholesRemarks,
      this.abutmentwingwallOthers,
      this.abutmentwingwallOthersCondition,
      this.abutmentwingwallOthersSeverity,
      this.abutmentwingwallOthersExtent,
      this.abutmentwingwallOthersRemarks,
      this.abutmentwingwallRating,
      this.pierpilecapSoilCondition,
      this.pierpilecapSoilSeverity,
      this.pierpilecapSoilExtent,
      this.pierpilecapSoilRemarks,
      this.pierpilecapDisplacementCondition,
      this.pierpilecapDisplacementSeverity,
      this.pierpilecapDisplacementExtent,
      this.pierpilecapDisplacementRemarks,
      this.pierpilecapCrackCondition,
      this.pierpilecapCrackSeverity,
      this.pierpilecapCrackExtent,
      this.pierpilecapCrackRemarks,
      this.pierpilecapSpallCondition,
      this.pierpilecapSpallSeverity,
      this.pierpilecapSpallExtent,
      this.pierpilecapSpallRemarks,
      this.pierpilecapCorrosionCondition,
      this.pierpilecapCorrosionSeverity,
      this.pierpilecapCorrosionExtent,
      this.pierpilecapCorrosionRemarks,
      this.pierpilecapDegradeCondition,
      this.pierpilecapDegradeSeverity,
      this.pierpilecapDegradeExtent,
      this.pierpilecapDegradeRemarks,
      this.pierpilecapOthers,
      this.pierpilecapOthersCondition,
      this.pierpilecapOthersSeverity,
      this.pierpilecapOthersExtent,
      this.pierpilecapOthersRemarks,
      this.pierpilecapRating,
      this.pierDisplaceCondition,
      this.pierDisplaceSeverity,
      this.pierDisplaceExtent,
      this.pierDisplaceRemarks,
      this.pierCrackCondition,
      this.pierCrackSeverity,
      this.pierCrackExtent,
      this.pierCrackRemarks,
      this.pierSpallCondition,
      this.pierSpallSeverity,
      this.pierSpallExtent,
      this.pierSpallRemarks,
      this.pierCorrosionCondition,
      this.pierCorrosionSeverity,
      this.pierCorrosionExtent,
      this.pierCorrosionRemarks,
      this.pierDegradeCondition,
      this.pierDegradeSeverity,
      this.pierDegradeExtent,
      this.pierDegradeRemarks,
      this.pierOthers,
      this.pierOthersCondition,
      this.pierOthersSeverity,
      this.pierOthersExtent,
      this.pierOthersRemarks,
      this.pierOthersRating,
      this.pierriverScourCondition,
      this.pierriverScourSeverity,
      this.pierriverScourExtent,
      this.pierriverScourRemarks,
      this.pierriverDebrisCondition,
      this.pierriverDebrisSeverity,
      this.pierriverDebrisExtent,
      this.pierriverDebrisRemarks,
      this.pierriverCrackCondition,
      this.pierriverCrackSeverity,
      this.pierriverCrackExtent,
      this.pierriverCrackRemarks,
      this.pierriverSpallCondition,
      this.pierriverSpallSeverity,
      this.pierriverSpallExtent,
      this.pierriverSpallRemarks,
      this.pierriverCorrosionCondition,
      this.pierriverCorrosionSeverity,
      this.pierriverCorrosionExtent,
      this.pierriverCorrosionRemarks,
      this.pierriverDegradeCondition,
      this.pierriverDegradeSeverity,
      this.pierriverDegradeExtent,
      this.pierriverDegradeRemarks,
      this.pierriverOthers,
      this.pierriverOthersCondition,
      this.pierriverOthersSeverity,
      this.pierriverOthersExtent,
      this.pierriverOthersRemarks,
      this.pierriverRating,
      this.slopeprotectionDisintegrationCondition,
      this.slopeprotectionDisintegrationSeverity,
      this.slopeprotectionDisintegrationExtent,
      this.slopeprotectionDisintegrationRemarks,
      this.slopeprotectionScouringCondition,
      this.slopeprotectionScouringSeverity,
      this.slopeprotectionScouringExtent,
      this.slopeprotectionScouringRemarks,
      this.slopeprotectionErosionCondition,
      this.slopeprotectionErosionSeverity,
      this.slopeprotectionErosionExtent,
      this.slopeprotectionErosionRemarks,
      this.slopeprotectionOthers,
      this.slopeprotectionOthersCondition,
      this.slopeprotectionOthersSeverity,
      this.slopeprotectionOthersExtent,
      this.slopeprotectionOthersRemarks,
      this.slopeprotectionRating,
      this.pierprotectionCrackCondition,
      this.pierprotectionCrackSeverity,
      this.pierprotectionCrackExtent,
      this.pierprotectionCrackRemarks,
      this.pierprotectionSpallCondition,
      this.pierprotectionSpallSeverity,
      this.pierprotectionSpallExtent,
      this.pierprotectionSpallRemarks,
      this.pierprotectionCorrosionCondition,
      this.pierprotectionCorrosionSeverity,
      this.pierprotectionCorrosionExtent,
      this.pierprotectionCorrosionRemarks,
      this.pierprotectionOthers,
      this.pierprotectionOthersCondition,
      this.pierprotectionOthersSeverity,
      this.pierprotectionOthersExtent,
      this.pierprotectionOthersRemarks,
      this.pierprotectionRating,
      this.riverBlockageCondition,
      this.riverBlockageCorrosionSeverity,
      this.riverBlockageCorrosionExtent,
      this.riverBlockageCorrosionRemarks,
      this.riverOthers,
      this.riverOthersCondition,
      this.riverOthersCorrosionSeverity,
      this.riverOthersCorrosionExtent,
      this.riverOthersCorrosionRemarks,
      this.riverRating});

  Substructure.fromJson(Map<String, dynamic> json) {
    abutmentfoundationSoilCondition = json['abutmentfoundation_soil_condition'];
    abutmentfoundationSoilAlignmentSeverity =
        json['abutmentfoundation_soil_alignment_severity'];
    abutmentfoundationSoilAlignmentExtent =
        json['abutmentfoundation_soil_alignment_extent'];
    abutmentfoundationSoilAlignmentRemarks =
        json['abutmentfoundation_soil_alignment_remarks'];
    abutmentfoundationDisplacementCondition =
        json['abutmentfoundation_displacement_condition'];
    abutmentfoundationDisplacementSeverity =
        json['abutmentfoundation_displacement_severity'];
    abutmentfoundationDisplacementExtent =
        json['abutmentfoundation_displacement_extent'];
    abutmentfoundationDisplacementRemarks =
        json['abutmentfoundation_displacement_remarks'];
    abutmentfoundationCrackCondition =
        json['abutmentfoundation_crack_condition'];
    abutmentfoundationCrackSeverity = json['abutmentfoundation_crack_severity'];
    abutmentfoundationCrackExtent = json['abutmentfoundation_crack_extent'];
    abutmentfoundationCrackRemarks = json['abutmentfoundation_crack_remarks'];
    abutmentfoundationSpallCondition =
        json['abutmentfoundation_spall_condition'];
    abutmentfoundationSpallSeverity = json['abutmentfoundation_spall_severity'];
    abutmentfoundationSpallExtent = json['abutmentfoundation_spall_extent'];
    abutmentfoundationSpallRemarks = json['abutmentfoundation_spall_remarks'];
    abutmentfoundationCorrosionCondition =
        json['abutmentfoundation_corrosion_condition'];
    abutmentfoundationCorrosionSeverity =
        json['abutmentfoundation_corrosion_severity'];
    abutmentfoundationCorrosionExtent =
        json['abutmentfoundation_corrosion_extent'];
    abutmentfoundationCorrosionRemarks =
        json['abutmentfoundation_corrosion_remarks'];
    abutmentfoundationDegradeCondition =
        json['abutmentfoundation_degrade_condition'];
    abutmentfoundationDegradeSeverity =
        json['abutmentfoundation_degrade_severity'];
    abutmentfoundationDegradeExtent = json['abutmentfoundation_degrade_extent'];
    abutmentfoundationDegradeRemarks =
        json['abutmentfoundation_degrade_remarks'];
    abutmentfoundationOthers = json['abutmentfoundation_others'];
    abutmentfoundationOthersCondition =
        json['abutmentfoundation_others_condition'];
    abutmentfoundationOthersSeverity =
        json['abutmentfoundation_others_severity'];
    abutmentfoundationOthersExtent = json['abutmentfoundation_others_extent'];
    abutmentfoundationOthersRemarks = json['abutmentfoundation_others_remarks'];
    abutmentwingwallDisplaceCondition =
        json['abutmentwingwall_displace_condition'];
    abutmentwingwallDisplaceSeverity =
        json['abutmentwingwall_displace_severity'];
    abutmentwingwallDisplaceExtent = json['abutmentwingwall_displace_extent'];
    abutmentwingwallDisplaceRemarks = json['abutmentwingwall_displace_remarks'];
    abutmentwingwallCrackCondition = json['abutmentwingwall_crack_condition'];
    abutmentwingwallCrackSeverity = json['abutmentwingwall_crack_severity'];
    abutmentwingwallCrackExtent = json['abutmentwingwall_crack_extent'];
    abutmentwingwallCrackRemarks = json['abutmentwingwall_crack_remarks'];
    abutmentwingwallSpallCondition = json['abutmentwingwall_spall_condition'];
    abutmentwingwallSpallSeverity = json['abutmentwingwall_spall_severity'];
    abutmentwingwallSpallExtent = json['abutmentwingwall_spall_extent'];
    abutmentwingwallSpallRemarks = json['abutmentwingwall_spall_remarks'];
    abutmentwingwallCorrosionCondition =
        json['abutmentwingwall_corrosion_condition'];
    abutmentwingwallCorrosionSeverity =
        json['abutmentwingwall_corrosion_severity'];
    abutmentwingwallCorrosionExtent = json['abutmentwingwall_corrosion_extent'];
    abutmentwingwallCorrosionRemarks =
        json['abutmentwingwall_corrosion_remarks'];
    abutmentwingwallDegradeCondition =
        json['abutmentwingwall_degrade_condition'];
    abutmentwingwallDegradeSeverity = json['abutmentwingwall_degrade_severity'];
    abutmentwingwallDegradeExtent = json['abutmentwingwall_degrade_extent'];
    abutmentwingwallDegradeRemarks = json['abutmentwingwall_degrade_remarks'];
    abutmentwingwallWeepholesCondition =
        json['abutmentwingwall_weepholes_condition'];
    abutmentwingwallWeepholesSeverity =
        json['abutmentwingwall_weepholes_severity'];
    abutmentwingwallWeepholesExtent = json['abutmentwingwall_weepholes_extent'];
    abutmentwingwallWeepholesRemarks =
        json['abutmentwingwall_weepholes_remarks'];
    abutmentwingwallOthers = json['abutmentwingwall_others'];
    abutmentwingwallOthersCondition = json['abutmentwingwall_others_condition'];
    abutmentwingwallOthersSeverity = json['abutmentwingwall_others_severity'];
    abutmentwingwallOthersExtent = json['abutmentwingwall_others_extent'];
    abutmentwingwallOthersRemarks = json['abutmentwingwall_others_remarks'];
    abutmentwingwallRating = json['abutmentwingwall_rating'];
    pierpilecapSoilCondition = json['pierpilecap_soil_condition'];
    pierpilecapSoilSeverity = json['pierpilecap_soil_severity'];
    pierpilecapSoilExtent = json['pierpilecap_soil_extent'];
    pierpilecapSoilRemarks = json['pierpilecap_soil_remarks'];
    pierpilecapDisplacementCondition =
        json['pierpilecap_displacement_condition'];
    pierpilecapDisplacementSeverity = json['pierpilecap_displacement_severity'];
    pierpilecapDisplacementExtent = json['pierpilecap_displacement_extent'];
    pierpilecapDisplacementRemarks = json['pierpilecap_displacement_remarks'];
    pierpilecapCrackCondition = json['pierpilecap_crack_condition'];
    pierpilecapCrackSeverity = json['pierpilecap_crack_severity'];
    pierpilecapCrackExtent = json['pierpilecap_crack_extent'];
    pierpilecapCrackRemarks = json['pierpilecap_crack_remarks'];
    pierpilecapSpallCondition = json['pierpilecap_spall_condition'];
    pierpilecapSpallSeverity = json['pierpilecap_spall_severity'];
    pierpilecapSpallExtent = json['pierpilecap_spall_extent'];
    pierpilecapSpallRemarks = json['pierpilecap_spall_remarks'];
    pierpilecapCorrosionCondition = json['pierpilecap_corrosion_condition'];
    pierpilecapCorrosionSeverity = json['pierpilecap_corrosion_severity'];
    pierpilecapCorrosionExtent = json['pierpilecap_corrosion_extent'];
    pierpilecapCorrosionRemarks = json['pierpilecap_corrosion_remarks'];
    pierpilecapDegradeCondition = json['pierpilecap_degrade_condition'];
    pierpilecapDegradeSeverity = json['pierpilecap_degrade_severity'];
    pierpilecapDegradeExtent = json['pierpilecap_degrade_extent'];
    pierpilecapDegradeRemarks = json['pierpilecap_degrade_remarks'];
    pierpilecapOthers = json['pierpilecap_others'];
    pierpilecapOthersCondition = json['pierpilecap_others_condition'];
    pierpilecapOthersSeverity = json['pierpilecap_others_severity'];
    pierpilecapOthersExtent = json['pierpilecap_others_extent'];
    pierpilecapOthersRemarks = json['pierpilecap_others_remarks'];
    pierpilecapRating = json['pierpilecap_rating'];
    pierDisplaceCondition = json['pier_displace_condition'];
    pierDisplaceSeverity = json['pier_displace_severity'];
    pierDisplaceExtent = json['pier_displace_extent'];
    pierDisplaceRemarks = json['pier_displace_remarks'];
    pierCrackCondition = json['pier_crack_condition'];
    pierCrackSeverity = json['pier_crack_severity'];
    pierCrackExtent = json['pier_crack_extent'];
    pierCrackRemarks = json['pier_crack_remarks'];
    pierSpallCondition = json['pier_spall_condition'];
    pierSpallSeverity = json['pier_spall_severity'];
    pierSpallExtent = json['pier_spall_extent'];
    pierSpallRemarks = json['pier_spall_remarks'];
    pierCorrosionCondition = json['pier_corrosion_condition'];
    pierCorrosionSeverity = json['pier_corrosion_severity'];
    pierCorrosionExtent = json['pier_corrosion_extent'];
    pierCorrosionRemarks = json['pier_corrosion_remarks'];
    pierDegradeCondition = json['pier_degrade_condition'];
    pierDegradeSeverity = json['pier_degrade_severity'];
    pierDegradeExtent = json['pier_degrade_extent'];
    pierDegradeRemarks = json['pier_degrade_remarks'];
    pierOthers = json['pier_others'];
    pierOthersCondition = json['pier_others_condition'];
    pierOthersSeverity = json['pier_others_severity'];
    pierOthersExtent = json['pier_others_extent'];
    pierOthersRemarks = json['pier_others_remarks'];
    pierOthersRating = json['pier_others_rating'];
    pierriverScourCondition = json['pierriver_scour_condition'];
    pierriverScourSeverity = json['pierriver_scour_severity'];
    pierriverScourExtent = json['pierriver_scour_extent'];
    pierriverScourRemarks = json['pierriver_scour_remarks'];
    pierriverDebrisCondition = json['pierriver_debris_condition'];
    pierriverDebrisSeverity = json['pierriver_debris_severity'];
    pierriverDebrisExtent = json['pierriver_debris_extent'];
    pierriverDebrisRemarks = json['pierriver_debris_remarks'];
    pierriverCrackCondition = json['pierriver_crack_condition'];
    pierriverCrackSeverity = json['pierriver_crack_severity'];
    pierriverCrackExtent = json['pierriver_crack_extent'];
    pierriverCrackRemarks = json['pierriver_crack_remarks'];
    pierriverSpallCondition = json['pierriver_spall_condition'];
    pierriverSpallSeverity = json['pierriver_spall_severity'];
    pierriverSpallExtent = json['pierriver_spall_extent'];
    pierriverSpallRemarks = json['pierriver_spall_remarks'];
    pierriverCorrosionCondition = json['pierriver_corrosion_condition'];
    pierriverCorrosionSeverity = json['pierriver_corrosion_severity'];
    pierriverCorrosionExtent = json['pierriver_corrosion_extent'];
    pierriverCorrosionRemarks = json['pierriver_corrosion_remarks'];
    pierriverDegradeCondition = json['pierriver_degrade_condition'];
    pierriverDegradeSeverity = json['pierriver_degrade_severity'];
    pierriverDegradeExtent = json['pierriver_degrade_extent'];
    pierriverDegradeRemarks = json['pierriver_degrade_remarks'];
    pierriverOthers = json['pierriver_others'];
    pierriverOthersCondition = json['pierriver_others_condition'];
    pierriverOthersSeverity = json['pierriver_others_severity'];
    pierriverOthersExtent = json['pierriver_others_extent'];
    pierriverOthersRemarks = json['pierriver_others_remarks'];
    pierriverRating = json['pierriver_rating'];
    slopeprotectionDisintegrationCondition =
        json['slopeprotection_disintegration_condition'];
    slopeprotectionDisintegrationSeverity =
        json['slopeprotection_disintegration_severity'];
    slopeprotectionDisintegrationExtent =
        json['slopeprotection_disintegration_extent'];
    slopeprotectionDisintegrationRemarks =
        json['slopeprotection_disintegration_remarks'];
    slopeprotectionScouringCondition =
        json['slopeprotection_scouring_condition'];
    slopeprotectionScouringSeverity = json['slopeprotection_scouring_severity'];
    slopeprotectionScouringExtent = json['slopeprotection_scouring_extent'];
    slopeprotectionScouringRemarks = json['slopeprotection_scouring_remarks'];
    slopeprotectionErosionCondition = json['slopeprotection_erosion_condition'];
    slopeprotectionErosionSeverity = json['slopeprotection_erosion_severity'];
    slopeprotectionErosionExtent = json['slopeprotection_erosion_extent'];
    slopeprotectionErosionRemarks = json['slopeprotection_erosion_remarks'];
    slopeprotectionOthers = json['slopeprotection_others'];
    slopeprotectionOthersCondition = json['slopeprotection_others_condition'];
    slopeprotectionOthersSeverity = json['slopeprotection_others_severity'];
    slopeprotectionOthersExtent = json['slopeprotection_others_extent'];
    slopeprotectionOthersRemarks = json['slopeprotection_others_remarks'];
    slopeprotectionRating = json['slopeprotection_rating'];
    pierprotectionCrackCondition = json['pierprotection_crack_condition'];
    pierprotectionCrackSeverity = json['pierprotection_crack_severity'];
    pierprotectionCrackExtent = json['pierprotection_crack_extent'];
    pierprotectionCrackRemarks = json['pierprotection_crack_remarks'];
    pierprotectionSpallCondition = json['pierprotection_spall_condition'];
    pierprotectionSpallSeverity = json['pierprotection_spall_severity'];
    pierprotectionSpallExtent = json['pierprotection_spall_extent'];
    pierprotectionSpallRemarks = json['pierprotection_spall_remarks'];
    pierprotectionCorrosionCondition =
        json['pierprotection_corrosion_condition'];
    pierprotectionCorrosionSeverity = json['pierprotection_corrosion_severity'];
    pierprotectionCorrosionExtent = json['pierprotection_corrosion_extent'];
    pierprotectionCorrosionRemarks = json['pierprotection_corrosion_remarks'];
    pierprotectionOthers = json['pierprotection_others'];
    pierprotectionOthersCondition = json['pierprotection_others_condition'];
    pierprotectionOthersSeverity = json['pierprotection_others_severity'];
    pierprotectionOthersExtent = json['pierprotection_others_extent'];
    pierprotectionOthersRemarks = json['pierprotection_others_remarks'];
    pierprotectionRating = json['pierprotection_rating'];

    riverBlockageCondition = json['river_blockage_condition'];
    riverBlockageCorrosionSeverity = json['river_blockage_corrosion_severity'];
    riverBlockageCorrosionExtent = json['river_blockage_corrosion_extent'];
    riverBlockageCorrosionRemarks = json['river_blockage_corrosion_remarks'];
    riverOthers = json['river_others'];
    riverOthersCondition = json['river_others_condition'];
    riverOthersCorrosionSeverity = json['river_others_corrosion_severity'];
    riverOthersCorrosionExtent = json['river_others_corrosion_extent'];
    riverOthersCorrosionRemarks = json['river_others_corrosion_remarks'];
    riverRating = json['river_rating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['abutmentfoundation_soil_condition'] = abutmentfoundationSoilCondition;
    data['abutmentfoundation_soil_alignment_severity'] =
        abutmentfoundationSoilAlignmentSeverity;
    data['abutmentfoundation_soil_alignment_extent'] =
        abutmentfoundationSoilAlignmentExtent;
    data['abutmentfoundation_soil_alignment_remarks'] =
        abutmentfoundationSoilAlignmentRemarks;
    data['abutmentfoundation_displacement_condition'] =
        abutmentfoundationDisplacementCondition;
    data['abutmentfoundation_displacement_severity'] =
        abutmentfoundationDisplacementSeverity;
    data['abutmentfoundation_displacement_extent'] =
        abutmentfoundationDisplacementExtent;
    data['abutmentfoundation_displacement_remarks'] =
        abutmentfoundationDisplacementRemarks;
    data['abutmentfoundation_crack_condition'] =
        abutmentfoundationCrackCondition;
    data['abutmentfoundation_crack_severity'] = abutmentfoundationCrackSeverity;
    data['abutmentfoundation_crack_extent'] = abutmentfoundationCrackExtent;
    data['abutmentfoundation_crack_remarks'] = abutmentfoundationCrackRemarks;
    data['abutmentfoundation_spall_condition'] =
        abutmentfoundationSpallCondition;
    data['abutmentfoundation_spall_severity'] = abutmentfoundationSpallSeverity;
    data['abutmentfoundation_spall_extent'] = abutmentfoundationSpallExtent;
    data['abutmentfoundation_spall_remarks'] = abutmentfoundationSpallRemarks;
    data['abutmentfoundation_corrosion_condition'] =
        abutmentfoundationCorrosionCondition;
    data['abutmentfoundation_corrosion_severity'] =
        abutmentfoundationCorrosionSeverity;
    data['abutmentfoundation_corrosion_extent'] =
        abutmentfoundationCorrosionExtent;
    data['abutmentfoundation_corrosion_remarks'] =
        abutmentfoundationCorrosionRemarks;
    data['abutmentfoundation_degrade_condition'] =
        abutmentfoundationDegradeCondition;
    data['abutmentfoundation_degrade_severity'] =
        abutmentfoundationDegradeSeverity;
    data['abutmentfoundation_degrade_extent'] = abutmentfoundationDegradeExtent;
    data['abutmentfoundation_degrade_remarks'] =
        abutmentfoundationDegradeRemarks;
    data['abutmentfoundation_others'] = abutmentfoundationOthers;
    data['abutmentfoundation_others_condition'] =
        abutmentfoundationOthersCondition;
    data['abutmentfoundation_others_severity'] =
        abutmentfoundationOthersSeverity;
    data['abutmentfoundation_others_extent'] = abutmentfoundationOthersExtent;
    data['abutmentfoundation_others_remarks'] = abutmentfoundationOthersRemarks;
    data['abutmentwingwall_displace_condition'] =
        abutmentwingwallDisplaceCondition;
    data['abutmentwingwall_displace_severity'] =
        abutmentwingwallDisplaceSeverity;
    data['abutmentwingwall_displace_extent'] = abutmentwingwallDisplaceExtent;
    data['abutmentwingwall_displace_remarks'] = abutmentwingwallDisplaceRemarks;
    data['abutmentwingwall_crack_condition'] = abutmentwingwallCrackCondition;
    data['abutmentwingwall_crack_severity'] = abutmentwingwallCrackSeverity;
    data['abutmentwingwall_crack_extent'] = abutmentwingwallCrackExtent;
    data['abutmentwingwall_crack_remarks'] = abutmentwingwallCrackRemarks;
    data['abutmentwingwall_spall_condition'] = abutmentwingwallSpallCondition;
    data['abutmentwingwall_spall_severity'] = abutmentwingwallSpallSeverity;
    data['abutmentwingwall_spall_extent'] = abutmentwingwallSpallExtent;
    data['abutmentwingwall_spall_remarks'] = abutmentwingwallSpallRemarks;
    data['abutmentwingwall_corrosion_condition'] =
        abutmentwingwallCorrosionCondition;
    data['abutmentwingwall_corrosion_severity'] =
        abutmentwingwallCorrosionSeverity;
    data['abutmentwingwall_corrosion_extent'] = abutmentwingwallCorrosionExtent;
    data['abutmentwingwall_corrosion_remarks'] =
        abutmentwingwallCorrosionRemarks;
    data['abutmentwingwall_degrade_condition'] =
        abutmentwingwallDegradeCondition;
    data['abutmentwingwall_degrade_severity'] = abutmentwingwallDegradeSeverity;
    data['abutmentwingwall_degrade_extent'] = abutmentwingwallDegradeExtent;
    data['abutmentwingwall_degrade_remarks'] = abutmentwingwallDegradeRemarks;
    data['abutmentwingwall_weepholes_condition'] =
        abutmentwingwallWeepholesCondition;
    data['abutmentwingwall_weepholes_severity'] =
        abutmentwingwallWeepholesSeverity;
    data['abutmentwingwall_weepholes_extent'] = abutmentwingwallWeepholesExtent;
    data['abutmentwingwall_weepholes_remarks'] =
        abutmentwingwallWeepholesRemarks;
    data['abutmentwingwall_others'] = abutmentwingwallOthers;
    data['abutmentwingwall_others_condition'] = abutmentwingwallOthersCondition;
    data['abutmentwingwall_others_severity'] = abutmentwingwallOthersSeverity;
    data['abutmentwingwall_others_extent'] = abutmentwingwallOthersExtent;
    data['abutmentwingwall_others_remarks'] = abutmentwingwallOthersRemarks;
    data['abutmentwingwall_rating'] = abutmentwingwallRating;
    data['pierpilecap_soil_condition'] = pierpilecapSoilCondition;
    data['pierpilecap_soil_severity'] = pierpilecapSoilSeverity;
    data['pierpilecap_soil_extent'] = pierpilecapSoilExtent;
    data['pierpilecap_soil_remarks'] = pierpilecapSoilRemarks;
    data['pierpilecap_displacement_condition'] =
        pierpilecapDisplacementCondition;
    data['pierpilecap_displacement_severity'] = pierpilecapDisplacementSeverity;
    data['pierpilecap_displacement_extent'] = pierpilecapDisplacementExtent;
    data['pierpilecap_displacement_remarks'] = pierpilecapDisplacementRemarks;
    data['pierpilecap_crack_condition'] = pierpilecapCrackCondition;
    data['pierpilecap_crack_severity'] = pierpilecapCrackSeverity;
    data['pierpilecap_crack_extent'] = pierpilecapCrackExtent;
    data['pierpilecap_crack_remarks'] = pierpilecapCrackRemarks;
    data['pierpilecap_spall_condition'] = pierpilecapSpallCondition;
    data['pierpilecap_spall_severity'] = pierpilecapSpallSeverity;
    data['pierpilecap_spall_extent'] = pierpilecapSpallExtent;
    data['pierpilecap_spall_remarks'] = pierpilecapSpallRemarks;
    data['pierpilecap_corrosion_condition'] = pierpilecapCorrosionCondition;
    data['pierpilecap_corrosion_severity'] = pierpilecapCorrosionSeverity;
    data['pierpilecap_corrosion_extent'] = pierpilecapCorrosionExtent;
    data['pierpilecap_corrosion_remarks'] = pierpilecapCorrosionRemarks;
    data['pierpilecap_degrade_condition'] = pierpilecapDegradeCondition;
    data['pierpilecap_degrade_severity'] = pierpilecapDegradeSeverity;
    data['pierpilecap_degrade_extent'] = pierpilecapDegradeExtent;
    data['pierpilecap_degrade_remarks'] = pierpilecapDegradeRemarks;
    data['pierpilecap_others'] = pierpilecapOthers;
    data['pierpilecap_others_condition'] = pierpilecapOthersCondition;
    data['pierpilecap_others_severity'] = pierpilecapOthersSeverity;
    data['pierpilecap_others_extent'] = pierpilecapOthersExtent;
    data['pierpilecap_others_remarks'] = pierpilecapOthersRemarks;
    data['pierpilecap_rating'] = pierpilecapRating;
    data['pier_displace_condition'] = pierDisplaceCondition;
    data['pier_displace_severity'] = pierDisplaceSeverity;
    data['pier_displace_extent'] = pierDisplaceExtent;
    data['pier_displace_remarks'] = pierDisplaceRemarks;
    data['pier_crack_condition'] = pierCrackCondition;
    data['pier_crack_severity'] = pierCrackSeverity;
    data['pier_crack_extent'] = pierCrackExtent;
    data['pier_crack_remarks'] = pierCrackRemarks;
    data['pier_spall_condition'] = pierSpallCondition;
    data['pier_spall_severity'] = pierSpallSeverity;
    data['pier_spall_extent'] = pierSpallExtent;
    data['pier_spall_remarks'] = pierSpallRemarks;
    data['pier_corrosion_condition'] = pierCorrosionCondition;
    data['pier_corrosion_severity'] = pierCorrosionSeverity;
    data['pier_corrosion_extent'] = pierCorrosionExtent;
    data['pier_corrosion_remarks'] = pierCorrosionRemarks;
    data['pier_degrade_condition'] = pierDegradeCondition;
    data['pier_degrade_severity'] = pierDegradeSeverity;
    data['pier_degrade_extent'] = pierDegradeExtent;
    data['pier_degrade_remarks'] = pierDegradeRemarks;
    data['pier_others'] = pierOthers;
    data['pier_others_condition'] = pierOthersCondition;
    data['pier_others_severity'] = pierOthersSeverity;
    data['pier_others_extent'] = pierOthersExtent;
    data['pier_others_remarks'] = pierOthersRemarks;
    data['pier_others_rating'] = pierOthersRating;
    data['pierriver_scour_condition'] = pierriverScourCondition;
    data['pierriver_scour_severity'] = pierriverScourSeverity;
    data['pierriver_scour_extent'] = pierriverScourExtent;
    data['pierriver_scour_remarks'] = pierriverScourRemarks;
    data['pierriver_debris_condition'] = pierriverDebrisCondition;
    data['pierriver_debris_severity'] = pierriverDebrisSeverity;
    data['pierriver_debris_extent'] = pierriverDebrisExtent;
    data['pierriver_debris_remarks'] = pierriverDebrisRemarks;
    data['pierriver_crack_condition'] = pierriverCrackCondition;
    data['pierriver_crack_severity'] = pierriverCrackSeverity;
    data['pierriver_crack_extent'] = pierriverCrackExtent;
    data['pierriver_crack_remarks'] = pierriverCrackRemarks;
    data['pierriver_spall_condition'] = pierriverSpallCondition;
    data['pierriver_spall_severity'] = pierriverSpallSeverity;
    data['pierriver_spall_extent'] = pierriverSpallExtent;
    data['pierriver_spall_remarks'] = pierriverSpallRemarks;
    data['pierriver_corrosion_condition'] = pierriverCorrosionCondition;
    data['pierriver_corrosion_severity'] = pierriverCorrosionSeverity;
    data['pierriver_corrosion_extent'] = pierriverCorrosionExtent;
    data['pierriver_corrosion_remarks'] = pierriverCorrosionRemarks;
    data['pierriver_degrade_condition'] = pierriverDegradeCondition;
    data['pierriver_degrade_severity'] = pierriverDegradeSeverity;
    data['pierriver_degrade_extent'] = pierriverDegradeExtent;
    data['pierriver_degrade_remarks'] = pierriverDegradeRemarks;
    data['pierriver_others'] = pierriverOthers;
    data['pierriver_others_condition'] = pierriverOthersCondition;
    data['pierriver_others_severity'] = pierriverOthersSeverity;
    data['pierriver_others_extent'] = pierriverOthersExtent;
    data['pierriver_others_remarks'] = pierriverOthersRemarks;
    data['pierriver_rating'] = pierriverRating;
    data['slopeprotection_disintegration_condition'] =
        slopeprotectionDisintegrationCondition;
    data['slopeprotection_disintegration_severity'] =
        slopeprotectionDisintegrationSeverity;
    data['slopeprotection_disintegration_extent'] =
        slopeprotectionDisintegrationExtent;
    data['slopeprotection_disintegration_remarks'] =
        slopeprotectionDisintegrationRemarks;
    data['slopeprotection_scouring_condition'] =
        slopeprotectionScouringCondition;
    data['slopeprotection_scouring_severity'] = slopeprotectionScouringSeverity;
    data['slopeprotection_scouring_extent'] = slopeprotectionScouringExtent;
    data['slopeprotection_scouring_remarks'] = slopeprotectionScouringRemarks;
    data['slopeprotection_erosion_condition'] = slopeprotectionErosionCondition;
    data['slopeprotection_erosion_severity'] = slopeprotectionErosionSeverity;
    data['slopeprotection_erosion_extent'] = slopeprotectionErosionExtent;
    data['slopeprotection_erosion_remarks'] = slopeprotectionErosionRemarks;
    data['slopeprotection_others'] = slopeprotectionOthers;
    data['slopeprotection_others_condition'] = slopeprotectionOthersCondition;
    data['slopeprotection_others_severity'] = slopeprotectionOthersSeverity;
    data['slopeprotection_others_extent'] = slopeprotectionOthersExtent;
    data['slopeprotection_others_remarks'] = slopeprotectionOthersRemarks;
    data['slopeprotection_rating'] = slopeprotectionRating;
    data['pierprotection_crack_condition'] = pierprotectionCrackCondition;
    data['pierprotection_crack_severity'] = pierprotectionCrackSeverity;
    data['pierprotection_crack_extent'] = pierprotectionCrackExtent;
    data['pierprotection_crack_remarks'] = pierprotectionCrackRemarks;
    data['pierprotection_spall_condition'] = pierprotectionSpallCondition;
    data['pierprotection_spall_severity'] = pierprotectionSpallSeverity;
    data['pierprotection_spall_extent'] = pierprotectionSpallExtent;
    data['pierprotection_spall_remarks'] = pierprotectionSpallRemarks;
    data['pierprotection_corrosion_condition'] =
        pierprotectionCorrosionCondition;
    data['pierprotection_corrosion_severity'] = pierprotectionCorrosionSeverity;
    data['pierprotection_corrosion_extent'] = pierprotectionCorrosionExtent;
    data['pierprotection_corrosion_remarks'] = pierprotectionCorrosionRemarks;
    data['pierprotection_others'] = pierprotectionOthers;
    data['pierprotection_others_condition'] = pierprotectionOthersCondition;
    data['pierprotection_others_severity'] = pierprotectionOthersSeverity;
    data['pierprotection_others_extent'] = pierprotectionOthersExtent;
    data['pierprotection_others_remarks'] = pierprotectionOthersRemarks;
    data['pierprotection_rating'] = pierprotectionRating;

    data['river_blockage_condition'] = riverBlockageCondition;
    data['river_blockage_corrosion_severity'] = riverBlockageCorrosionSeverity;
    data['river_blockage_corrosion_extent'] = riverBlockageCorrosionExtent;
    data['river_blockage_corrosion_remarks'] = riverBlockageCorrosionRemarks;
    data['river_others'] = riverOthers;
    data['river_others_condition'] = riverOthersCondition;
    data['river_others_corrosion_severity'] = riverOthersCorrosionSeverity;
    data['river_others_corrosion_extent'] = riverOthersCorrosionExtent;
    data['river_others_corrosion_remarks'] = riverOthersCorrosionRemarks;
    data['river_rating'] = riverRating;

    return data;
  }
}

/*
class Substructure {
  Null? riverBlockageCondition;
  Null? riverBlockageCorrosionSeverity;
  Null? riverBlockageCorrosionExtent;
  Null? riverBlockageCorrosionRemarks;
  Null? riverOthers;
  Null? riverOthersCondition;
  Null? riverOthersCorrosionSeverity;
  Null? riverOthersCorrosionExtent;
  Null? riverOthersCorrosionRemarks;
  Null? riverRating;

  Substructure(
      {this.riverBlockageCondition,
      this.riverBlockageCorrosionSeverity,
      this.riverBlockageCorrosionExtent,
      this.riverBlockageCorrosionRemarks,
      this.riverOthers,
      this.riverOthersCondition,
      this.riverOthersCorrosionSeverity,
      this.riverOthersCorrosionExtent,
      this.riverOthersCorrosionRemarks,
      this.riverRating});

  Substructure.fromJson(Map<String, dynamic> json) {
    riverBlockageCondition = json['river_blockage_condition'];
    riverBlockageCorrosionSeverity = json['river_blockage_corrosion_severity'];
    riverBlockageCorrosionExtent = json['river_blockage_corrosion_extent'];
    riverBlockageCorrosionRemarks = json['river_blockage_corrosion_remarks'];
    riverOthers = json['river_others'];
    riverOthersCondition = json['river_others_condition'];
    riverOthersCorrosionSeverity = json['river_others_corrosion_severity'];
    riverOthersCorrosionExtent = json['river_others_corrosion_extent'];
    riverOthersCorrosionRemarks = json['river_others_corrosion_remarks'];
    riverRating = json['river_rating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['river_blockage_condition'] = this.riverBlockageCondition;
    data['river_blockage_corrosion_severity'] =
        this.riverBlockageCorrosionSeverity;
    data['river_blockage_corrosion_extent'] = this.riverBlockageCorrosionExtent;
    data['river_blockage_corrosion_remarks'] =
        this.riverBlockageCorrosionRemarks;
    data['river_others'] = this.riverOthers;
    data['river_others_condition'] = this.riverOthersCondition;
    data['river_others_corrosion_severity'] = this.riverOthersCorrosionSeverity;
    data['river_others_corrosion_extent'] = this.riverOthersCorrosionExtent;
    data['river_others_corrosion_remarks'] = this.riverOthersCorrosionRemarks;
    data['river_rating'] = this.riverRating;
    return data;
  }
}
*/