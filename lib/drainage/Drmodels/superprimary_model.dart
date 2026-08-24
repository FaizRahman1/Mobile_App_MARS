// class SuperprimaryModel {
//   String? id;
//   String? dateofinspection;
//   String? dateoflastinspection;
//   SuperstructurePrimary? superstructurePrimary;
//   String? error;

//   SuperprimaryModel(
//       {this.id,
//       this.dateofinspection,
//       this.dateoflastinspection,
//       this.superstructurePrimary});

//   SuperprimaryModel.withError(String errorMessage) {
//     error = errorMessage;
//   }

//   SuperprimaryModel.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     dateofinspection = json['dateofinspection'];
//     dateoflastinspection = json['dateoflastinspection'];
//     superstructurePrimary = json['superstructure_primary'] != null
//         ? SuperstructurePrimary.fromJson(json['superstructure_primary'])
//         : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['dateofinspection'] = dateofinspection;
//     data['dateoflastinspection'] = dateoflastinspection;
//     if (superstructurePrimary != null) {
//       data['superstructure_primary'] = superstructurePrimary!.toJson();
//     }
//     return data;
//   }
// }

// class SuperstructurePrimary {
//   String? topbdeckVertdisplaceCondition;
//   int? topbdeckVertdisplaceSeverity;
//   int? topbdeckVertdisplaceExtent;
//   String? topbdeckVertdisplaceRemarks;
//   String? topbdeckHorizdisplaceCondition;
//   int? topbdeckHorizdisplaceSeverity;
//   int? topbdeckHorizdisplaceExtent;
//   String? topbdeckHorizdisplaceRemarks;
//   String? topbdeckOthers;
//   String? topbdeckOthersCondition;
//   int? topbdeckOthersSeverity;
//   int? topbdeckOthersExtent;
//   String? topbdeckOthersRemarks;
//   int? topbdeckRating;
//   String? decksoffitCrackCondition;
//   int? decksoffitCrackSeverity;
//   int? decksoffitCrackExtent;
//   String? decksoffitCrackRemarks;
//   String? decksoffitSpallCondition;
//   int? decksoffitSpallSeverity;
//   int? decksoffitSpallExtent;
//   String? decksoffitSpallRemarks;
//   String? decksoffitCorrosionCondition;
//   int? decksoffitCorrosionSeverity;
//   int? decksoffitCorrosionExtent;
//   String? decksoffitCorrosionRemarks;
//   String? decksoffitLeakCondition;
//   int? decksoffitLeakSeverity;
//   int? decksoffitLeakExtent;
//   String? decksoffitLeakRemarks;
//   String? decksoffitStainCondition;
//   int? decksoffitStainSeverity;
//   int? decksoffitStainExtent;
//   String? decksoffitStainRemarks;
//   String? decksoffitOthers;
//   String? decksoffitOthersCondition;
//   int? decksoffitOthersSeverity;
//   int? decksoffitOthersExtent;
//   String? decksoffitOthersRemarks;
//   int? decksoffitRating;
//   String? girderNoiseCondition;
//   int? girderNoiseSeverity;
//   int? girderNoiseExtent;
//   String? girderNoiseRemarks;
//   String? girderCrackCondition;
//   int? girderCrackSeverity;
//   int? girderCrackExtent;
//   String? girderCrackRemarks;
//   String? girderSpallCondition;
//   int? girderSpallSeverity;
//   int? girderSpallExtent;
//   String? girderSpallRemarks;
//   String? girderCorrosionCondition;
//   int? girderCorrosionSeverity;
//   int? girderCorrosionExtent;
//   String? girderCorrosionRemarks;
//   String? girderLeakageCondition;
//   int? girderLeakageSeverity;
//   int? girderLeakageExtent;
//   String? girderLeakageRemarks;
//   String? girderStainCondition;
//   int? girderStainSeverity;
//   int? girderStainExtent;
//   String? girderStainRemarks;
//   String? girderOther;
//   String? girderOtherCondition;
//   int? girderOtherSeverity;
//   int? girderOtherExtent;
//   String? girderOtherRemarks;
//   int? girderRating;
//   String? diaphmNoiseCondition;
//   int? diaphmNoiseSeverity;
//   int? diaphmNoiseExtent;
//   String? diaphmNoiseRemarks;
//   String? diaphmCrackCondition;
//   int? diaphmCrackSeverity;
//   int? diaphmCrackExtent;
//   String? diaphmCrackRemarks;
//   String? diaphmSpallCondition;
//   int? diaphmSpallSeverity;
//   int? diaphmSpallExtent;
//   String? diaphmSpallRemarks;
//   String? diaphmCorrosionCondition;
//   int? diaphmCorrosionSeverity;
//   int? diaphmCorrosionExtent;
//   String? diaphmCorrosionRemarks;
//   String? diaphmOthers;
//   String? diaphmOthersCondition;
//   int? diaphmOthersSeverity;
//   int? diaphmOthersExtent;
//   String? diaphmOthersRemarks;
//   int? diaphmRating;
//   String? bearingDeformCondition;
//   int? bearingDeformSeverity;
//   int? bearingDeformExtent;
//   String? bearingDeformRemarks;
//   String? bearingCrackCondition;
//   int? bearingCrackSeverity;
//   int? bearingCrackExtent;
//   String? bearingCrackRemarks;
//   String? bearingSurfaceCondition;
//   int? bearingSurfaceSeverity;
//   int? bearingSurfaceExtent;
//   String? bearingSurfaceRemarks;
//   String? bearingAlignmentCondition;
//   int? bearingAlignmentSeverity;
//   int? bearingAlignmentExtent;
//   String? bearingAlignmentRemarks;
//   String? bearingPlinthCondition;
//   int? bearingPlinthSeverity;
//   int? bearingPlinthExtent;
//   String? bearingPlinthRemarks;
//   String? bearingOthers;
//   String? bearingOthersCondition;
//   int? bearingOthersSeverity;
//   int? bearingOthersExtent;
//   int? bearingOthersRemarks;
//   int? bearingRating;

//   SuperstructurePrimary(
//       {this.topbdeckVertdisplaceCondition,
//       this.topbdeckVertdisplaceSeverity,
//       this.topbdeckVertdisplaceExtent,
//       this.topbdeckVertdisplaceRemarks,
//       this.topbdeckHorizdisplaceCondition,
//       this.topbdeckHorizdisplaceSeverity,
//       this.topbdeckHorizdisplaceExtent,
//       this.topbdeckHorizdisplaceRemarks,
//       this.topbdeckOthers,
//       this.topbdeckOthersCondition,
//       this.topbdeckOthersSeverity,
//       this.topbdeckOthersExtent,
//       this.topbdeckOthersRemarks,
//       this.topbdeckRating,
//       this.decksoffitCrackCondition,
//       this.decksoffitCrackSeverity,
//       this.decksoffitCrackExtent,
//       this.decksoffitCrackRemarks,
//       this.decksoffitSpallCondition,
//       this.decksoffitSpallSeverity,
//       this.decksoffitSpallExtent,
//       this.decksoffitSpallRemarks,
//       this.decksoffitCorrosionCondition,
//       this.decksoffitCorrosionSeverity,
//       this.decksoffitCorrosionExtent,
//       this.decksoffitCorrosionRemarks,
//       this.decksoffitLeakCondition,
//       this.decksoffitLeakSeverity,
//       this.decksoffitLeakExtent,
//       this.decksoffitLeakRemarks,
//       this.decksoffitStainCondition,
//       this.decksoffitStainSeverity,
//       this.decksoffitStainExtent,
//       this.decksoffitStainRemarks,
//       this.decksoffitOthers,
//       this.decksoffitOthersCondition,
//       this.decksoffitOthersSeverity,
//       this.decksoffitOthersExtent,
//       this.decksoffitOthersRemarks,
//       this.decksoffitRating,
//       this.girderNoiseCondition,
//       this.girderNoiseSeverity,
//       this.girderNoiseExtent,
//       this.girderNoiseRemarks,
//       this.girderCrackCondition,
//       this.girderCrackSeverity,
//       this.girderCrackExtent,
//       this.girderCrackRemarks,
//       this.girderSpallCondition,
//       this.girderSpallSeverity,
//       this.girderSpallExtent,
//       this.girderSpallRemarks,
//       this.girderCorrosionCondition,
//       this.girderCorrosionSeverity,
//       this.girderCorrosionExtent,
//       this.girderCorrosionRemarks,
//       this.girderLeakageCondition,
//       this.girderLeakageSeverity,
//       this.girderLeakageExtent,
//       this.girderLeakageRemarks,
//       this.girderStainCondition,
//       this.girderStainSeverity,
//       this.girderStainExtent,
//       this.girderStainRemarks,
//       this.girderOther,
//       this.girderOtherCondition,
//       this.girderOtherSeverity,
//       this.girderOtherExtent,
//       this.girderOtherRemarks,
//       this.girderRating,
//       this.diaphmNoiseCondition,
//       this.diaphmNoiseSeverity,
//       this.diaphmNoiseExtent,
//       this.diaphmNoiseRemarks,
//       this.diaphmCrackCondition,
//       this.diaphmCrackSeverity,
//       this.diaphmCrackExtent,
//       this.diaphmCrackRemarks,
//       this.diaphmSpallCondition,
//       this.diaphmSpallSeverity,
//       this.diaphmSpallExtent,
//       this.diaphmSpallRemarks,
//       this.diaphmCorrosionCondition,
//       this.diaphmCorrosionSeverity,
//       this.diaphmCorrosionExtent,
//       this.diaphmCorrosionRemarks,
//       this.diaphmOthers,
//       this.diaphmOthersCondition,
//       this.diaphmOthersSeverity,
//       this.diaphmOthersExtent,
//       this.diaphmOthersRemarks,
//       this.diaphmRating,
//       this.bearingDeformCondition,
//       this.bearingDeformSeverity,
//       this.bearingDeformExtent,
//       this.bearingDeformRemarks,
//       this.bearingCrackCondition,
//       this.bearingCrackSeverity,
//       this.bearingCrackExtent,
//       this.bearingCrackRemarks,
//       this.bearingSurfaceCondition,
//       this.bearingSurfaceSeverity,
//       this.bearingSurfaceExtent,
//       this.bearingSurfaceRemarks,
//       this.bearingAlignmentCondition,
//       this.bearingAlignmentSeverity,
//       this.bearingAlignmentExtent,
//       this.bearingAlignmentRemarks,
//       this.bearingPlinthCondition,
//       this.bearingPlinthSeverity,
//       this.bearingPlinthExtent,
//       this.bearingPlinthRemarks,
//       this.bearingOthers,
//       this.bearingOthersCondition,
//       this.bearingOthersSeverity,
//       this.bearingOthersExtent,
//       this.bearingOthersRemarks,
//       this.bearingRating});

//   SuperstructurePrimary.fromJson(Map<String, dynamic> json) {
//     topbdeckVertdisplaceCondition = json['topbdeck_vertdisplace_condition'];
//     topbdeckVertdisplaceSeverity = json['topbdeck_vertdisplace_severity'];
//     topbdeckVertdisplaceExtent = json['topbdeck_vertdisplace_extent'];
//     topbdeckVertdisplaceRemarks = json['topbdeck_vertdisplace_remarks'];
//     topbdeckHorizdisplaceCondition = json['topbdeck_horizdisplace_condition'];
//     topbdeckHorizdisplaceSeverity = json['topbdeck_horizdisplace_severity'];
//     topbdeckHorizdisplaceExtent = json['topbdeck_horizdisplace_extent'];
//     topbdeckHorizdisplaceRemarks = json['topbdeck_horizdisplace_remarks'];
//     topbdeckOthers = json['topbdeck_others'];
//     topbdeckOthersCondition = json['topbdeck_others_condition'];
//     topbdeckOthersSeverity = json['topbdeck_others_severity'];
//     topbdeckOthersExtent = json['topbdeck_others_extent'];
//     topbdeckOthersRemarks = json['topbdeck_others_remarks'];
//     topbdeckRating = json['topbdeck_rating'];
//     decksoffitCrackCondition = json['decksoffit_crack_condition'];
//     decksoffitCrackSeverity = json['decksoffit_crack_severity'];
//     decksoffitCrackExtent = json['decksoffit_crack_extent'];
//     decksoffitCrackRemarks = json['decksoffit_crack_remarks'];
//     decksoffitSpallCondition = json['decksoffit_spall_condition'];
//     decksoffitSpallSeverity = json['decksoffit_spall_severity'];
//     decksoffitSpallExtent = json['decksoffit_spall_extent'];
//     decksoffitSpallRemarks = json['decksoffit_spall_remarks'];
//     decksoffitCorrosionCondition = json['decksoffit_corrosion_condition'];
//     decksoffitCorrosionSeverity = json['decksoffit_corrosion_severity'];
//     decksoffitCorrosionExtent = json['decksoffit_corrosion_extent'];
//     decksoffitCorrosionRemarks = json['decksoffit_corrosion_remarks'];
//     decksoffitLeakCondition = json['decksoffit_leak_condition'];
//     decksoffitLeakSeverity = json['decksoffit_leak_severity'];
//     decksoffitLeakExtent = json['decksoffit_leak_extent'];
//     decksoffitLeakRemarks = json['decksoffit_leak_remarks'];
//     decksoffitStainCondition = json['decksoffit_stain_condition'];
//     decksoffitStainSeverity = json['decksoffit_stain_severity'];
//     decksoffitStainExtent = json['decksoffit_stain_extent'];
//     decksoffitStainRemarks = json['decksoffit_stain_remarks'];
//     decksoffitOthers = json['decksoffit_others'];
//     decksoffitOthersCondition = json['decksoffit_others_condition'];
//     decksoffitOthersSeverity = json['decksoffit_others_severity'];
//     decksoffitOthersExtent = json['decksoffit_others_extent'];
//     decksoffitOthersRemarks = json['decksoffit_others_remarks'];
//     decksoffitRating = json['decksoffit_rating'];
//     girderNoiseCondition = json['girder_noise_condition'];
//     girderNoiseSeverity = json['girder_noise_severity'];
//     girderNoiseExtent = json['girder_noise_extent'];
//     girderNoiseRemarks = json['girder_noise_remarks'];
//     girderCrackCondition = json['girder_crack_condition'];
//     girderCrackSeverity = json['girder_crack_severity'];
//     girderCrackExtent = json['girder_crack_extent'];
//     girderCrackRemarks = json['girder_crack_remarks'];
//     girderSpallCondition = json['girder_spall_condition'];
//     girderSpallSeverity = json['girder_spall_severity'];
//     girderSpallExtent = json['girder_spall_extent'];
//     girderSpallRemarks = json['girder_spall_remarks'];
//     girderCorrosionCondition = json['girder_corrosion_condition'];
//     girderCorrosionSeverity = json['girder_corrosion_severity'];
//     girderCorrosionExtent = json['girder_corrosion_extent'];
//     girderCorrosionRemarks = json['girder_corrosion_remarks'];
//     girderLeakageCondition = json['girder_leakage_condition'];
//     girderLeakageSeverity = json['girder_leakage_severity'];
//     girderLeakageExtent = json['girder_leakage_extent'];
//     girderLeakageRemarks = json['girder_leakage_remarks'];
//     girderStainCondition = json['girder_stain_condition'];
//     girderStainSeverity = json['girder_stain_severity'];
//     girderStainExtent = json['girder_stain_extent'];
//     girderStainRemarks = json['girder_stain_remarks'];
//     girderOther = json['girder_other'];
//     girderOtherCondition = json['girder_other_condition'];
//     girderOtherSeverity = json['girder_other_severity'];
//     girderOtherExtent = json['girder_other_extent'];
//     girderOtherRemarks = json['girder_other_remarks'];
//     girderRating = json['girder_rating'];
//     diaphmNoiseCondition = json['diaphm_noise_condition'];
//     diaphmNoiseSeverity = json['diaphm_noise_severity'];
//     diaphmNoiseExtent = json['diaphm_noise_extent'];
//     diaphmNoiseRemarks = json['diaphm_noise_remarks'];
//     diaphmCrackCondition = json['diaphm_crack_condition'];
//     diaphmCrackSeverity = json['diaphm_crack_severity'];
//     diaphmCrackExtent = json['diaphm_crack_extent'];
//     diaphmCrackRemarks = json['diaphm_crack_remarks'];
//     diaphmSpallCondition = json['diaphm_spall_condition'];
//     diaphmSpallSeverity = json['diaphm_spall_severity'];
//     diaphmSpallExtent = json['diaphm_spall_extent'];
//     diaphmSpallRemarks = json['diaphm_spall_remarks'];
//     diaphmCorrosionCondition = json['diaphm_corrosion_condition'];
//     diaphmCorrosionSeverity = json['diaphm_corrosion_severity'];
//     diaphmCorrosionExtent = json['diaphm_corrosion_extent'];
//     diaphmCorrosionRemarks = json['diaphm_corrosion_remarks'];
//     diaphmOthers = json['diaphm_others'];
//     diaphmOthersCondition = json['diaphm_others_condition'];
//     diaphmOthersSeverity = json['diaphm_others_severity'];
//     diaphmOthersExtent = json['diaphm_others_extent'];
//     diaphmOthersRemarks = json['diaphm_others_remarks'];
//     diaphmRating = json['diaphm_rating'];
//     bearingDeformCondition = json['bearing_deform_condition'];
//     bearingDeformSeverity = json['bearing_deform_severity'];
//     bearingDeformExtent = json['bearing_deform_extent'];
//     bearingDeformRemarks = json['bearing_deform_remarks'];
//     bearingCrackCondition = json['bearing_crack_condition'];
//     bearingCrackSeverity = json['bearing_crack_severity'];
//     bearingCrackExtent = json['bearing_crack_extent'];
//     bearingCrackRemarks = json['bearing_crack_remarks'];
//     bearingSurfaceCondition = json['bearing_surface_condition'];
//     bearingSurfaceSeverity = json['bearing_surface_severity'];
//     bearingSurfaceExtent = json['bearing_surface_extent'];
//     bearingSurfaceRemarks = json['bearing_surface_remarks'];
//     bearingAlignmentCondition = json['bearing_alignment_condition'];
//     bearingAlignmentSeverity = json['bearing_alignment_severity'];
//     bearingAlignmentExtent = json['bearing_alignment_extent'];
//     bearingAlignmentRemarks = json['bearing_alignment_remarks'];
//     bearingPlinthCondition = json['bearing_plinth_condition'];
//     bearingPlinthSeverity = json['bearing_plinth_severity'];
//     bearingPlinthExtent = json['bearing_plinth_extent'];
//     bearingPlinthRemarks = json['bearing_plinth_remarks'];
//     bearingOthers = json['bearing_others'];
//     bearingOthersCondition = json['bearing_others_condition'];
//     bearingOthersSeverity = json['bearing_others_severity'];
//     bearingOthersExtent = json['bearing_others_extent'];
//     bearingOthersRemarks = json['bearing_others_remarks'];
//     bearingRating = json['bearing_rating'];
//   }

//   Map<String, dynamic> toJson() {
//     //final Map<String, dynamic> data = new Map<String, dynamic>();
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['topbdeck_vertdisplace_condition'] = topbdeckVertdisplaceCondition;
//     data['topbdeck_vertdisplace_severity'] = topbdeckVertdisplaceSeverity;
//     data['topbdeck_vertdisplace_extent'] = topbdeckVertdisplaceExtent;
//     data['topbdeck_vertdisplace_remarks'] = topbdeckVertdisplaceRemarks;
//     data['topbdeck_horizdisplace_condition'] = topbdeckHorizdisplaceCondition;
//     data['topbdeck_horizdisplace_severity'] = topbdeckHorizdisplaceSeverity;
//     data['topbdeck_horizdisplace_extent'] = topbdeckHorizdisplaceExtent;
//     data['topbdeck_horizdisplace_remarks'] = topbdeckHorizdisplaceRemarks;
//     data['topbdeck_others'] = topbdeckOthers;
//     data['topbdeck_others_condition'] = topbdeckOthersCondition;
//     data['topbdeck_others_severity'] = topbdeckOthersSeverity;
//     data['topbdeck_others_extent'] = topbdeckOthersExtent;
//     data['topbdeck_others_remarks'] = topbdeckOthersRemarks;
//     data['topbdeck_rating'] = topbdeckRating;
//     data['decksoffit_crack_condition'] = decksoffitCrackCondition;
//     data['decksoffit_crack_severity'] = decksoffitCrackSeverity;
//     data['decksoffit_crack_extent'] = decksoffitCrackExtent;
//     data['decksoffit_crack_remarks'] = decksoffitCrackRemarks;
//     data['decksoffit_spall_condition'] = decksoffitSpallCondition;
//     data['decksoffit_spall_severity'] = decksoffitSpallSeverity;
//     data['decksoffit_spall_extent'] = decksoffitSpallExtent;
//     data['decksoffit_spall_remarks'] = decksoffitSpallRemarks;
//     data['decksoffit_corrosion_condition'] = decksoffitCorrosionCondition;
//     data['decksoffit_corrosion_severity'] = decksoffitCorrosionSeverity;
//     data['decksoffit_corrosion_extent'] = decksoffitCorrosionExtent;
//     data['decksoffit_corrosion_remarks'] = decksoffitCorrosionRemarks;
//     data['decksoffit_leak_condition'] = decksoffitLeakCondition;
//     data['decksoffit_leak_severity'] = decksoffitLeakSeverity;
//     data['decksoffit_leak_extent'] = decksoffitLeakExtent;
//     data['decksoffit_leak_remarks'] = decksoffitLeakRemarks;
//     data['decksoffit_stain_condition'] = decksoffitStainCondition;
//     data['decksoffit_stain_severity'] = decksoffitStainSeverity;
//     data['decksoffit_stain_extent'] = decksoffitStainExtent;
//     data['decksoffit_stain_remarks'] = decksoffitStainRemarks;
//     data['decksoffit_others'] = decksoffitOthers;
//     data['decksoffit_others_condition'] = decksoffitOthersCondition;
//     data['decksoffit_others_severity'] = decksoffitOthersSeverity;
//     data['decksoffit_others_extent'] = decksoffitOthersExtent;
//     data['decksoffit_others_remarks'] = decksoffitOthersRemarks;
//     data['decksoffit_rating'] = decksoffitRating;
//     data['girder_noise_condition'] = girderNoiseCondition;
//     data['girder_noise_severity'] = girderNoiseSeverity;
//     data['girder_noise_extent'] = girderNoiseExtent;
//     data['girder_noise_remarks'] = girderNoiseRemarks;
//     data['girder_crack_condition'] = girderCrackCondition;
//     data['girder_crack_severity'] = girderCrackSeverity;
//     data['girder_crack_extent'] = girderCrackExtent;
//     data['girder_crack_remarks'] = girderCrackRemarks;
//     data['girder_spall_condition'] = girderSpallCondition;
//     data['girder_spall_severity'] = girderSpallSeverity;
//     data['girder_spall_extent'] = girderSpallExtent;
//     data['girder_spall_remarks'] = girderSpallRemarks;
//     data['girder_corrosion_condition'] = girderCorrosionCondition;
//     data['girder_corrosion_severity'] = girderCorrosionSeverity;
//     data['girder_corrosion_extent'] = girderCorrosionExtent;
//     data['girder_corrosion_remarks'] = girderCorrosionRemarks;
//     data['girder_leakage_condition'] = girderLeakageCondition;
//     data['girder_leakage_severity'] = girderLeakageSeverity;
//     data['girder_leakage_extent'] = girderLeakageExtent;
//     data['girder_leakage_remarks'] = girderLeakageRemarks;
//     data['girder_stain_condition'] = girderStainCondition;
//     data['girder_stain_severity'] = girderStainSeverity;
//     data['girder_stain_extent'] = girderStainExtent;
//     data['girder_stain_remarks'] = girderStainRemarks;
//     data['girder_other'] = girderOther;
//     data['girder_other_condition'] = girderOtherCondition;
//     data['girder_other_severity'] = girderOtherSeverity;
//     data['girder_other_extent'] = girderOtherExtent;
//     data['girder_other_remarks'] = girderOtherRemarks;
//     data['girder_rating'] = girderRating;
//     data['diaphm_noise_condition'] = diaphmNoiseCondition;
//     data['diaphm_noise_severity'] = diaphmNoiseSeverity;
//     data['diaphm_noise_extent'] = diaphmNoiseExtent;
//     data['diaphm_noise_remarks'] = diaphmNoiseRemarks;
//     data['diaphm_crack_condition'] = diaphmCrackCondition;
//     data['diaphm_crack_severity'] = diaphmCrackSeverity;
//     data['diaphm_crack_extent'] = diaphmCrackExtent;
//     data['diaphm_crack_remarks'] = diaphmCrackRemarks;
//     data['diaphm_spall_condition'] = diaphmSpallCondition;
//     data['diaphm_spall_severity'] = diaphmSpallSeverity;
//     data['diaphm_spall_extent'] = diaphmSpallExtent;
//     data['diaphm_spall_remarks'] = diaphmSpallRemarks;
//     data['diaphm_corrosion_condition'] = diaphmCorrosionCondition;
//     data['diaphm_corrosion_severity'] = diaphmCorrosionSeverity;
//     data['diaphm_corrosion_extent'] = diaphmCorrosionExtent;
//     data['diaphm_corrosion_remarks'] = diaphmCorrosionRemarks;
//     data['diaphm_others'] = diaphmOthers;
//     data['diaphm_others_condition'] = diaphmOthersCondition;
//     data['diaphm_others_severity'] = diaphmOthersSeverity;
//     data['diaphm_others_extent'] = diaphmOthersExtent;
//     data['diaphm_others_remarks'] = diaphmOthersRemarks;
//     data['diaphm_rating'] = diaphmRating;
//     data['bearing_deform_condition'] = bearingDeformCondition;
//     data['bearing_deform_severity'] = bearingDeformSeverity;
//     data['bearing_deform_extent'] = bearingDeformExtent;
//     data['bearing_deform_remarks'] = bearingDeformRemarks;
//     data['bearing_crack_condition'] = bearingCrackCondition;
//     data['bearing_crack_severity'] = bearingCrackSeverity;
//     data['bearing_crack_extent'] = bearingCrackExtent;
//     data['bearing_crack_remarks'] = bearingCrackRemarks;
//     data['bearing_surface_condition'] = bearingSurfaceCondition;
//     data['bearing_surface_severity'] = bearingSurfaceSeverity;
//     data['bearing_surface_extent'] = bearingSurfaceExtent;
//     data['bearing_surface_remarks'] = bearingSurfaceRemarks;
//     data['bearing_alignment_condition'] = bearingAlignmentCondition;
//     data['bearing_alignment_severity'] = bearingAlignmentSeverity;
//     data['bearing_alignment_extent'] = bearingAlignmentExtent;
//     data['bearing_alignment_remarks'] = bearingAlignmentRemarks;
//     data['bearing_plinth_condition'] = bearingPlinthCondition;
//     data['bearing_plinth_severity'] = bearingPlinthSeverity;
//     data['bearing_plinth_extent'] = bearingPlinthExtent;
//     data['bearing_plinth_remarks'] = bearingPlinthRemarks;
//     data['bearing_others'] = bearingOthers;
//     data['bearing_others_condition'] = bearingOthersCondition;
//     data['bearing_others_severity'] = bearingOthersSeverity;
//     data['bearing_others_extent'] = bearingOthersExtent;
//     data['bearing_others_remarks'] = bearingOthersRemarks;
//     data['bearing_rating'] = bearingRating;
//     return data;
//   }
// }
