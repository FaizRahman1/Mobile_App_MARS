import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class StructureSecondaryForm extends FormBloc<String, String> {
  // DECK DRAINAGE -- STRUCTURE
  final cond_surfacebridge_blockage_bound = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['NB', 'SB'],
    initialValue: 'NB',
  );
  final cond_others_bound = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['BB', 'EB', 'NB', 'SB', 'WB'],
    initialValue: 'NB',
  );
  final cond_surfacebridge_others = TextFieldBloc();
  final cond_parapet_others = TextFieldBloc();

  final cond_others_remarks = TextFieldBloc();
//parape
  final cond_impact_bound = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['BB', 'EB', 'NB', 'SB', 'WB'],
    initialValue: 'NB',
  );
  final cond_impact_remarks = TextFieldBloc();

  final cond_corrosion_bound = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['BB', 'EB', 'NB', 'SB', 'WB'],
    initialValue: 'NB',
  );

  final remarkscorrosion = TextFieldBloc();

  final cond_crack_bound = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['BB', 'EB', 'NB', 'SB', 'WB'],
    initialValue: 'NB',
  );
  final remarkscrack = TextFieldBloc();

  final cond_spall_bound = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['BB', 'EB', 'NB', 'SB', 'WB'],
    initialValue: 'NB',
  );
  final remarksspalling = TextFieldBloc();

  // ignore: non_constant_identifier_names
  final cond_parapet_others_bound = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['BB', 'EB', 'NB', 'SB', 'WB'],
    initialValue: 'NB',
  );
  final cond_joint_remarks = TextFieldBloc();
  final cond_parapet_remarks = TextFieldBloc();

  final joint_description = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['Crack', 'Split', 'Tear', 'Hole'],
    initialValue: 'Crack',
  );
  final cond_joint_bound = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['BB', 'EB', 'NB', 'SB', 'WB'],
    initialValue: 'NB',
  );
  final remarksJoint = TextFieldBloc();

  final cond_fixity_bound = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['BB', 'EB', 'NB', 'SB', 'WB'],
    initialValue: 'NB',
  );
  final remarksFixity = TextFieldBloc();

  final cond_leakage_bound = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['BB', 'EB', 'NB', 'SB', 'WB'],
    initialValue: 'NB',
  );
  final remarksWaterLeakage = TextFieldBloc();

  final cond_joint_others_bound = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['BB', 'EB', 'NB', 'SB', 'WB'],
    initialValue: 'NB',
  );
  final remarksjointOthers = TextFieldBloc();
  final joint_others = TextFieldBloc();

  final cond_pavement_bound = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['BB', 'EB', 'NB', 'SB', 'WB'],
    initialValue: 'NB',
  );
  final cond_pavement_remarks = TextFieldBloc();

  final cond_abutmentapproach_others_bound = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['BB', 'EB', 'NB', 'SB', 'WB'],
    initialValue: 'NB',
  );
  final abutmentapproach_others_remarks = TextFieldBloc();
  final cond_abutmentapproach_others = TextFieldBloc();

  final cond_beam_corrosion_bound = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['BB', 'EB', 'NB', 'SB', 'WB'],
    initialValue: 'NB',
  );
  final cond_beam_corrosion_remarks = TextFieldBloc();

  final cond_beam_crack_bound = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['BB', 'EB', 'NB', 'SB', 'WB'],
    initialValue: 'NB',
  );
  final cond_beam_crack_remarks = TextFieldBloc();

  final cond_beam_spalling_bound = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['BB', 'EB', 'NB', 'SB', 'WB'],
    initialValue: 'NB',
  );
  final cond_beam_spalling_remarks = TextFieldBloc();

  final cond_beam_others_bound = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['BB', 'EB', 'NB', 'SB', 'WB'],
    initialValue: 'NB',
  );
  final cond_beam_others_remarks = TextFieldBloc();
  final cond_beam_others = TextFieldBloc();

  final cond_decksoffit_crack_bound = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['BB', 'EB', 'NB', 'SB', 'WB'],
    initialValue: 'NB',
  );
  final cond_decksoffit_spall_remarks = TextFieldBloc();

  final cond_decksoffit_spall_bound = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['BB', 'EB', 'NB', 'SB', 'WB'],
    initialValue: 'NB',
  );
  final cond_decksoffit_crack_remarks = TextFieldBloc();

  final cond_decksoffit_others_bound = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['BB', 'EB', 'NB', 'SB', 'WB'],
    initialValue: 'NB',
  );
  final cond_decksoffit_others_remarks = TextFieldBloc();
  final cond_decksoffit_others = TextFieldBloc();

  final cond_abutmentwingwall_movement_bound = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['BB', 'EB', 'NB', 'SB', 'WB'],
    initialValue: 'NB',
  );
  final cond_abutmentwingwall_movement_remarks = TextFieldBloc();

  final cond_abutmentwingwall_crack_bound = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['BB', 'EB', 'NB', 'SB', 'WB'],
    initialValue: 'NB',
  );
  final cond_abutmentwingwall_crack_remarks = TextFieldBloc();

  final cond_abutmentwingwall_spall_bound = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['BB', 'EB', 'NB', 'SB', 'WB'],
    initialValue: 'NB',
  );
  final cond_abutmentwingwall_spall_remarks = TextFieldBloc();

  final cond_abutmentwingwall_others = TextFieldBloc();

  final cond_abutmentwingwall_others_bound = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['BB', 'EB', 'NB', 'SB', 'WB'],
    initialValue: 'NB',
  );
  final cond_abutmentwingwall_others_remarks = TextFieldBloc();

  final cond_pier_movement_bound = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['BB', 'EB', 'NB', 'SB', 'WB'],
    initialValue: 'NB',
  );
  final cond_pier_movement_remarks = TextFieldBloc();

  final cond_pier_scour_bound = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['BB', 'EB', 'NB', 'SB', 'WB'],
    initialValue: 'NB',
  );
  final cond_pier_scour_remarks = TextFieldBloc();

  final cond_pier_debris_bound = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['BB', 'EB', 'NB', 'SB', 'WB'],
    initialValue: 'NB',
  );
  final cond_pier_debris_remarks = TextFieldBloc();

  final cond_pier_crack_bound = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['BB', 'EB', 'NB', 'SB', 'WB'],
    initialValue: 'NB',
  );
  final cond_pier_crack_remarks = TextFieldBloc();

  final cond_pier_spall_bound = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['BB', 'EB', 'NB', 'SB', 'WB'],
    initialValue: 'NB',
  );
  final cond_pier_spall_remarks = TextFieldBloc();

  final cond_pier_others_bound = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['BB', 'EB', 'NB', 'SB', 'WB'],
    initialValue: 'NB',
  );
  final cond_pier_others_remarks = TextFieldBloc();

  final cond_pier_others = TextFieldBloc();

  final cond_slopeprotection_damage_bound = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['BB', 'EB', 'NB', 'SB', 'WB'],
    initialValue: 'NB',
  );
  final cond_slopeprotection_damage_remarks = TextFieldBloc();

  final cond_slopeprotection_scouring_bound = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['BB', 'EB', 'NB', 'SB', 'WB'],
    initialValue: 'NB',
  );
  final cond_slopeprotection_scouring_remarks = TextFieldBloc();

  final cond_slopeprotection_erosion_bound = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['BB', 'EB', 'NB', 'SB', 'WB'],
    initialValue: 'NB',
  );
  final cond_slopeprotection_erosion_remarks = TextFieldBloc();

  final cond_slopeprotection_vege_bound = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['BB', 'EB', 'NB', 'SB', 'WB'],
    initialValue: 'NB',
  );
  final cond_slopeprotection_vege_remarks = TextFieldBloc();

  final cond_slopeprotection_silt_bound = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['BB', 'EB', 'NB', 'SB', 'WB'],
    initialValue: 'NB',
  );
  final cond_slopeprotection_silt_remarks = TextFieldBloc();

  final cond_slopeprotection_others_bound = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['BB', 'EB', 'NB', 'SB', 'WB'],
    initialValue: 'NB',
  );
    final cond_bearing_others_bound = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['BB', 'EB', 'NB', 'SB', 'WB'],
    initialValue: 'NB',
  );
    final cond_otherselem1_bound = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['BB', 'EB', 'NB', 'SB', 'WB'],
    initialValue: 'NB',
  );
    final cond_otherselem2_bound = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['BB', 'EB', 'NB', 'SB', 'WB'],
    initialValue: 'NB',
  );
  
  final cond_slopeprotection_others_remarks = TextFieldBloc();
  final cond_bearing_others_remarks = TextFieldBloc();
  final cond_otherselem1_remarks = TextFieldBloc();
  final cond_otherselem2_remarks = TextFieldBloc();
  final cond_otherselem1_description = TextFieldBloc();
  final cond_otherselem2_description = TextFieldBloc();
  final cond_routinedefect1 = TextFieldBloc();
  final cond_routinedefect2 = TextFieldBloc();
  final cond_routinedefect3 = TextFieldBloc();
  final cond_routinedefect4 = TextFieldBloc();
  final cond_otherdefect1 = TextFieldBloc();
  final cond_otherdefect2 = TextFieldBloc();
  final cond_otherdefect3 = TextFieldBloc();
  final cond_otherdefect4 = TextFieldBloc();
  final cond_slopeprotection_others = TextFieldBloc();
   final cond_bearing_others = TextFieldBloc();

  final cond_bearing_deform_bound = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['BB', 'EB', 'NB', 'SB', 'WB'],
    initialValue: 'NB',
  );
  final cond_bearing_deform_remarks = TextFieldBloc();

  final cond_bearing_debris_bound = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['BB', 'EB', 'NB', 'SB', 'WB'],
    initialValue: 'NB',
  );
  final cond_bearing_debris_remarks = TextFieldBloc();

  final cond_bearing_seating_bound = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['BB', 'EB', 'NB', 'SB', 'WB'],
    initialValue: 'NB',
  );

    final cond_bearing_plinth_bound = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['BB', 'EB', 'NB', 'SB', 'WB'],
    initialValue: 'NB',
  );
  final cond_bearing_seating_remarks = TextFieldBloc();

  final cond_bearing_plinth_remarks = TextFieldBloc();

  final severityLevelDrStructure = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['0', '1', '2', '3'],
    initialValue: '0',
  );
  final extendedSvLevelDrStructure = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['0', '1', '2', '3'],
    initialValue: '0',
  );
  // ignore: non_constant_identifier_names
  final cond_surfacebridge_blockage_remarks = TextFieldBloc();

  //  DECK DRAINAGE - SERVICEABILITY
  // ignore: non_constant_identifier_names
  final cond_ponding_bound = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['BB', 'EB', 'NB', 'SB', 'WB'],
    initialValue: 'BB',
  );
  final severityLevelDrServiceability = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['0', '1', '2', '3'],
    initialValue: '0',
  );
  final extendedSvLevelDrServiceability = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['0', '1', '2', '3'],
    initialValue: '0',
  );
  final remarksDrServiceability = TextFieldBloc();

  // DECK DRAINAGE - OTHERS , ELEMENT RATING
  final cond_blockage_status = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['No', 'Yes'],
    initialValue: 'No',
  );
  final cond_ponding_status = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['No', 'Yes'],
    initialValue: 'No',
  );
  final cond_surfacebridge_Status = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['No', 'Yes'],
    initialValue: 'No',
  );
  final cond_impact_status = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['No', 'Yes'],
    initialValue: 'No',
  );
  final cond_corrosion_status = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['No', 'Yes'],
    initialValue: 'No',
  );
  final cond_crack_status = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['No', 'Yes'],
    initialValue: 'No',
  );

  final cond_spall_status = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['No', 'Yes'],
    initialValue: 'No',
  );
  final cond_parapet_others_status = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['No', 'Yes'],
    initialValue: 'No',
  );
  final cond_joint_status = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['No', 'Yes'],
    initialValue: 'No',
  );
  final cond_fixity_status = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['No', 'Yes'],
    initialValue: 'No',
  );

  final cond_leakage_status = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['No', 'Yes'],
    initialValue: 'No',
  );
  final cond_joint_others_status = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['No', 'Yes'],
    initialValue: 'No',
  );
  final cond_pavement_status = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['No', 'Yes'],
    initialValue: 'No',
  );
  final cond_abutmentapproach_others_status = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['No', 'Yes'],
    initialValue: 'No',
  );
  final cond_beam_corrosion_status = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['No', 'Yes'],
    initialValue: 'No',
  );
  final cond_beam_crack_status = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['No', 'Yes'],
    initialValue: 'No',
  );
  final cond_beam_spalling_status = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['No', 'Yes'],
    initialValue: 'No',
  );
  final cond_beam_others_status = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['No', 'Yes'],
    initialValue: 'No',
  );
  final cond_decksoffit_crack_status = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['No', 'Yes'],
    initialValue: 'No',
  );
  final cond_decksoffit_spall_status = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['No', 'Yes'],
    initialValue: 'No',
  );
  final cond_decksoffit_others_status = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['No', 'Yes'],
    initialValue: 'No',
  );
  final cond_abutmentwingwall_movement_status = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['No', 'Yes'],
    initialValue: 'No',
  );
  final cond_abutmentwingwall_crack_status = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['No', 'Yes'],
    initialValue: 'No',
  );
  final cond_abutmentwingwall_spall_status = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['No', 'Yes'],
    initialValue: 'No',
  );
  final cond_abutmentwingwall_others_status = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['No', 'Yes'],
    initialValue: 'No',
  );
  final cond_pier_movement_status = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['No', 'Yes'],
    initialValue: 'No',
  );
  final cond_pier_scour_status = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['No', 'Yes'],
    initialValue: 'No',
  );
  final cond_pier_debris_status = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['No', 'Yes'],
    initialValue: 'No',
  );
  final cond_pier_crack_status = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['No', 'Yes'],
    initialValue: 'No',
  );

  final cond_pier_spall_status = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['No', 'Yes'],
    initialValue: 'No',
  );

  final cond_pier_others_status = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['No', 'Yes'],
    initialValue: 'No',
  );

  final cond_slopeprotection_damage_status = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['No', 'Yes'],
    initialValue: 'No',
  );

  final cond_slopeprotection_scouring_status = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['No', 'Yes'],
    initialValue: 'No',
  );

  final cond_slopeprotection_erosion_status = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['No', 'Yes'],
    initialValue: 'No',
  );

  final cond_slopeprotection_vege_status = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['No', 'Yes'],
    initialValue: 'No',
  );

  final cond_slopeprotection_silt_status = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['No', 'Yes'],
    initialValue: 'No',
  );

  final cond_slopeprotection_others_status = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['No', 'Yes'],
    initialValue: 'No',
  );

    final cond_bearing_others_status = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['No', 'Yes'],
    initialValue: 'No',
  );
    final cond_otherselem1_status = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['No', 'Yes'],
    initialValue: 'No',
  );

    final cond_otherselem2_status = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['No', 'Yes'],
    initialValue: 'No',
  );
  
  final cond_bearing_deform_status = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['No', 'Yes'],
    initialValue: 'No',
  );

  final cond_bearing_debris_status = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['No', 'Yes'],
    initialValue: 'No',
  );

  final cond_bearing_seating_status = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['No', 'Yes'],
    initialValue: 'No',
  );
    final cond_bearing_plinth_status = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['No', 'Yes'],
    initialValue: 'No',
  );
  final conditionDeckDrainageOthers = TextFieldBloc();

  final severityLevelDeckDrainageOthers = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['0', '1', '2', '3'],
    initialValue: '0',
  );
  final extendedSvLevelDeckDrainageOthers = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['0', '1', '2', '3'],
    initialValue: '0',
  );
  final remarksDeckDrainageOthers = TextFieldBloc();

  final elementRatingDeckDrainage = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['0', '1', '2', '3'],
    initialValue: '0',
  );
  // </DECK DRAINANGE>

  // PR - IMPACT DAMAGE
  final conditionImpDamage = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['None', 'Minor', 'Moderate', 'Severe'],
    initialValue: 'None',
  );
  final severityLevelImpDamage = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['0', '1', '2', '3'],
    initialValue: '0',
  );
  final extendedSvLevelImpDamage = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['0', '1', '2', '3'],
    initialValue: '0',
  );
  final cond_ponding_remarks = TextFieldBloc();

  // PR - BASE FIXITY/STABILITY
  final conditionBaseFix = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['None', 'Minor', 'Moderate', 'Severe'],
    initialValue: 'None',
  );
  final severityLevelBaseFix = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['0', '1', '2', '3'],
    initialValue: '0',
  );
  final extendedSvLevelBaseFix = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['0', '1', '2', '3'],
    initialValue: '0',
  );
  final remarksBaseFix = TextFieldBloc();

  // PR - CORROSION
  final conditionCorrosion = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['None', 'Minor', 'Moderate', 'Severe'],
    initialValue: 'None',
  );
  final severityLevelCorrosion = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['0', '1', '2', '3'],
    initialValue: '0',
  );
  final extendedSvLevelCorrosion = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['0', '1', '2', '3'],
    initialValue: '0',
  );
  final remarksCorrosion = TextFieldBloc();

  // PR - CRACKING
  final conditionCracking = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['None', 'Minor', 'Moderate', 'Severe'],
    initialValue: 'None',
  );
  final severityLevelCracking = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['0', '1', '2', '3'],
    initialValue: '0',
  );
  final extendedSvLevelCracking = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['0', '1', '2', '3'],
    initialValue: '0',
  );
  final remarksCracking = TextFieldBloc();

  // PR - SPALLING
  final conditionSpalling = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['None', 'Misnor', 'Moderate', 'Severe'],
    initialValue: 'None',
  );
  final severityLevelSpalling = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['0', '1', '2', '3'],
    initialValue: '0',
  );
  final extendedSvLevelSpalling = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['0', '1', '2', '3'],
    initialValue: '0',
  );
  final remarksSpalling = TextFieldBloc();

  // PR - OTHERS, ELEMENT RATING
  final parapetRailingOthers = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['No', 'Yes'],
    initialValue: 'No',
  );
  final conditionParapetRailingOthers = TextFieldBloc();

  final severityLevelParapetRailingOthers = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['0', '1', '2', '3'],
    initialValue: '0',
  );
  final extendedSvLevelParapetRailingOthers = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['0', '1', '2', '3'],
    initialValue: '0',
  );
  final remarksParapetRailingOthers = TextFieldBloc();

  final elementRatingParapetRailing = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['0', '1', '2', '3'],
    initialValue: '0',
  );
  //  </PARAPET OR RAILING>

  // JOINTS - CRACKS/SPLITS/TEARS/HOLES
  final jointType = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['None', 'Cracks', 'Splits', 'Tears', 'Holes'],
    initialValue: 'None',
  );
  final conditionJointCrackSplit = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['None', 'Minor', 'Moderate', 'Severe'],
    initialValue: 'None',
  );
  final severityLevelJointCrackSplit = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['0', '1', '2', '3'],
    initialValue: '0',
  );
  final extendedSvLevelJointCrackSplit = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['0', '1', '2', '3'],
    initialValue: '0',
  );
  final remarksJointCrackSplit = TextFieldBloc();

  // JOINTS - FIXITY/ABNORMAL NOISE
  final conditionJointFixity = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['None', 'Detected'],
    initialValue: 'None',
  );
  final severityLevelJointFixity = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['0', '1', '2', '3'],
    initialValue: '0',
  );
  final extendedSvLevelJointFixity = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['0', '1', '2', '3'],
    initialValue: '0',
  );
  final remarksJointFixity = TextFieldBloc();

  // JOINTS - ALIGNMENT
  final conditionJointAlignment = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['Ok', 'Displaced'],
    initialValue: 'Ok',
  );
  final severityLevelJointAlignment = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['0', '1', '2', '3'],
    initialValue: '0',
  );
  final extendedSvLevelJointAlignment = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['0', '1', '2', '3'],
    initialValue: '0',
  );
  final remarksJointAlignment = TextFieldBloc();

  // JOINTS - WATER LEAKAGE
  final conditionJointWaterLeakage = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['None', 'Minor', 'Moderate', 'Severe'],
    initialValue: 'None',
  );
  final severityLevelJointWaterLeakage = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['0', '1', '2', '3'],
    initialValue: '0',
  );
  final extendedSvLevelJointWaterLeakage = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['0', '1', '2', '3'],
    initialValue: '0',
  );
  final remarksJointWaterLeakage = TextFieldBloc();

  // JOINTS - OTHERS, ELEMENT RATING
  final jointsOthers = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['No', 'Yes'],
    initialValue: 'No',
  );
  final conditionJointsOthers = TextFieldBloc();

  final severityLevelJointsOthers = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['0', '1', '2', '3'],
    initialValue: '0',
  );
  final extendedSvLevelJointsOthers = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['0', '1', '2', '3'],
    initialValue: '0',
  );
  final remarksJointsOthers = TextFieldBloc();

  final elementRatingJoints = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['0', '1', '2', '3'],
    initialValue: '0',
  );
  //  </JOINTS>

  // ABUTMENT APPROACH - PAVEMENT DEPRESSION
  final conditionPavementDep = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['None', 'Minor', 'Moderate', 'Severe'],
    initialValue: 'None',
  );
  final severityLevelPavementDep = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['0', '1', '2', '3'],
    initialValue: '0',
  );
  final extendedSvLevelPavementDep = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['0', '1', '2', '3'],
    initialValue: '0',
  );
  final remarksPavementDep = TextFieldBloc();

  // ABUTMENT APPROACH - OTHERS, ELEMENT RATING
  final abutmentAppOthers = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['No', 'Yes'],
    initialValue: 'No',
  );
  final conditionAbutmentAppOthers = TextFieldBloc();

  final severityLevelAbutmentAppOthers = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['0', '1', '2', '3'],
    initialValue: '0',
  );
  final extendedSvLevelAbutmentAppOthers = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['0', '1', '2', '3'],
    initialValue: '0',
  );
  final remarksAbutmentAppOthers = TextFieldBloc();

  final elementRatingAbutmentApp = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['0', '1', '2', '3'],
    initialValue: '0',
  );
  //</ABUTMENT APPROACH>

  // ROAD FURNITURE - HIGH CLEARANCE (SIGNAGE)
  final conditionHighClear = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['None', 'Minor', 'Moderate', 'Severe'],
    initialValue: 'None',
  );
  final severityLevelHighClear = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['0', '1', '2', '3'],
    initialValue: '0',
  );
  final extendedSvLevelHighClear = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['0', '1', '2', '3'],
    initialValue: '0',
  );
  final remarksHighClear = TextFieldBloc();

  // ROAD FURNITURE - OTHERS, ELEMENT RATING
  final roadFurnitureOthers = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['No', 'Yes'],
    initialValue: 'No',
  );
  final conditionRoadFurnitureOthers = TextFieldBloc();

  final severityLevelRoadFurnitureOthers = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['0', '1', '2', '3'],
    initialValue: '0',
  );
  final extendedSvLevelRoadFurnitureOthers = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['0', '1', '2', '3'],
    initialValue: '0',
  );
  final remarksRoadFurnitureOthers = TextFieldBloc();

  final elementRatingRoadFurniture = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['0', '1', '2', '3'],
    initialValue: '0',
  );
  //</ROAD FURNITURE>

  final showSecretField = BooleanFieldBloc();

  final secretField = TextFieldBloc(validators: [FieldBlocValidators.required]);

  StructureSecondaryForm() {
    addFieldBlocs(
      //akan tambah container reflects to its parameter
      fieldBlocs: [
        cond_bearing_seating_status,
        cond_abutmentwingwall_others,
        cond_beam_others,
        cond_slopeprotection_others,
        cond_pier_others,
        cond_decksoffit_others,
        cond_bearing_others,
        cond_bearing_others_status,
        cond_otherselem2_remarks,
        joint_others,
        cond_abutmentapproach_others,
        cond_surfacebridge_others,
        cond_bearing_seating_remarks,
        cond_bearing_plinth_bound,
        cond_bearing_seating_bound,
        cond_bearing_debris_status,
        cond_bearing_debris_remarks,
        cond_bearing_debris_bound,
        cond_bearing_deform_status,
        cond_bearing_deform_remarks,
        cond_bearing_deform_bound,
        cond_slopeprotection_others_status,
        cond_slopeprotection_others_remarks,
        cond_otherselem1_remarks,
        cond_slopeprotection_others_bound,
        cond_slopeprotection_silt_status,
        cond_slopeprotection_silt_remarks,
        cond_slopeprotection_silt_bound,
        cond_slopeprotection_vege_status,
        cond_slopeprotection_vege_remarks,
        cond_routinedefect2,
        cond_routinedefect3,
        cond_routinedefect4,
        cond_slopeprotection_vege_bound,
        cond_slopeprotection_erosion_status,
        cond_slopeprotection_erosion_remarks,
        cond_slopeprotection_erosion_bound,
        cond_slopeprotection_scouring_status,
        cond_slopeprotection_scouring_remarks,
        cond_slopeprotection_scouring_bound,
        cond_slopeprotection_damage_status,
        cond_slopeprotection_damage_remarks,
        cond_slopeprotection_damage_bound,
        cond_pier_others_status,
        cond_pier_others_remarks,
        cond_pier_others_bound,
        cond_pier_spall_status,
        cond_pier_spall_remarks,
        cond_pier_spall_bound,
        cond_pier_crack_status,
        cond_pier_crack_remarks,
        cond_pier_crack_bound,
        cond_otherselem1_bound,
        cond_pier_debris_status,
        cond_pier_debris_remarks,
        cond_pier_debris_bound,
        cond_pier_scour_status,
        cond_pier_scour_remarks,
        cond_pier_scour_bound,
        cond_bearing_others_remarks,
        cond_pier_movement_status,
        cond_routinedefect1,
        cond_pier_movement_remarks,
        cond_otherselem1_description,
        cond_pier_movement_bound,
        cond_abutmentwingwall_others_status,
        cond_abutmentwingwall_others_remarks,
        cond_abutmentwingwall_others_bound,
        cond_abutmentwingwall_spall_status,
        cond_abutmentwingwall_spall_remarks,
        cond_abutmentwingwall_spall_bound,
        cond_abutmentwingwall_crack_status,
        cond_abutmentwingwall_crack_remarks,
        cond_abutmentwingwall_crack_bound,
        cond_otherselem2_description,
        cond_abutmentwingwall_movement_status,
        cond_abutmentwingwall_movement_remarks,
        cond_abutmentwingwall_movement_bound,
        cond_decksoffit_others_status,
        cond_decksoffit_others_remarks,
        cond_decksoffit_others_bound,
        cond_decksoffit_spall_status,
        cond_decksoffit_spall_remarks,
        cond_decksoffit_spall_bound,
        cond_decksoffit_crack_status,
        cond_decksoffit_crack_remarks,
        cond_decksoffit_crack_bound,
        cond_otherselem2_bound,
        cond_beam_others_status,
        cond_beam_others_remarks,
        cond_otherselem2_status,
        cond_beam_others_bound,
        cond_beam_crack_status,
        cond_beam_crack_remarks,
        cond_otherdefect2,
        cond_otherdefect3,
        cond_otherdefect4,
        cond_beam_crack_bound,
        cond_beam_spalling_status,
        cond_beam_spalling_remarks,
        cond_beam_spalling_bound,
        cond_beam_corrosion_status,
        cond_beam_corrosion_remarks,
        cond_beam_corrosion_bound,
        cond_abutmentapproach_others_status,
        abutmentapproach_others_remarks,
        cond_abutmentapproach_others_bound,
        cond_pavement_status,
        cond_pavement_remarks,
        cond_otherselem1_status,
        cond_pavement_bound,
        cond_joint_others_status,
        remarksjointOthers,
        cond_joint_others_bound,
        cond_bearing_others_bound,
        cond_leakage_bound,
        remarksWaterLeakage,
        cond_otherdefect1,
        cond_leakage_status,
        cond_parapet_others,
        cond_bearing_plinth_status,
        cond_bearing_plinth_remarks,
        remarksFixity,
        cond_fixity_bound,
        cond_fixity_status,
        remarksJoint,
        cond_joint_bound,
        joint_description,
        cond_impact_remarks,
        remarkscorrosion,
        remarkscrack,
        remarksspalling,
        cond_joint_remarks,
        cond_parapet_remarks,
        cond_parapet_others_bound,
        cond_spall_bound,
        cond_crack_bound,
        cond_corrosion_bound,
        cond_impact_bound,
        cond_joint_status,
        cond_parapet_others_status,
        cond_spall_status,
        cond_crack_status,
        cond_corrosion_status,
        cond_impact_status,
        cond_surfacebridge_Status,
        cond_ponding_status,
        cond_ponding_remarks,
        cond_others_remarks,
        cond_others_bound,
        cond_surfacebridge_blockage_remarks,
        cond_surfacebridge_blockage_bound,
        cond_ponding_bound,
        cond_blockage_status,
        
        
     
      ],
    );

    cond_ponding_bound.onValueChanges(
      onData: (previous, current) async* {
        removeFieldBlocs(
          fieldBlocs: [
            severityLevelDrServiceability,
            extendedSvLevelDrServiceability,
            remarksDrServiceability,
          ],
        );

        if (current.value != 'Clear') {
          addFieldBlocs(
            fieldBlocs: [
              severityLevelDrServiceability,
              extendedSvLevelDrServiceability,
              remarksDrServiceability,
            ],
          );
        }
      },
    );

    cond_blockage_status.onValueChanges(
      onData: (previous, current) async* {
        removeFieldBlocs(
          fieldBlocs: [
            conditionDeckDrainageOthers,
            severityLevelDeckDrainageOthers,
            extendedSvLevelDeckDrainageOthers,
            remarksDeckDrainageOthers,
          ],
        );

        if (current.value != 'No') {
          addFieldBlocs(
            fieldBlocs: [
              conditionDeckDrainageOthers,
              severityLevelDeckDrainageOthers,
              extendedSvLevelDeckDrainageOthers,
              remarksDeckDrainageOthers,
            ],
          );
        }
      },
    );

    // --------------- Parapet/Railing --------------- //
    conditionImpDamage.onValueChanges(
      onData: (previous, current) async* {
        removeFieldBlocs(
          fieldBlocs: [
            severityLevelImpDamage,
            extendedSvLevelImpDamage,
            cond_ponding_remarks,
          ],
        );

        if (current.value != 'None') {
          addFieldBlocs(
            fieldBlocs: [
              severityLevelImpDamage,
              extendedSvLevelImpDamage,
              cond_ponding_remarks,
            ],
          );
        }
      },
    );

    conditionBaseFix.onValueChanges(
      onData: (previous, current) async* {
        removeFieldBlocs(
          fieldBlocs: [
            severityLevelBaseFix,
            extendedSvLevelBaseFix,
            remarksBaseFix,
          ],
        );

        if (current.value != 'None') {
          addFieldBlocs(
            fieldBlocs: [
              severityLevelBaseFix,
              extendedSvLevelBaseFix,
              remarksBaseFix,
            ],
          );
        }
      },
    );

    conditionCorrosion.onValueChanges(
      onData: (previous, current) async* {
        removeFieldBlocs(
          fieldBlocs: [
            severityLevelCorrosion,
            extendedSvLevelCorrosion,
            remarksCorrosion,
          ],
        );

        if (current.value != 'None') {
          addFieldBlocs(
            fieldBlocs: [
              severityLevelCorrosion,
              extendedSvLevelCorrosion,
              remarksCorrosion,
            ],
          );
        }
      },
    );

    conditionCracking.onValueChanges(
      onData: (previous, current) async* {
        removeFieldBlocs(
          fieldBlocs: [
            severityLevelCracking,
            extendedSvLevelCracking,
            remarksCracking,
          ],
        );

        if (current.value != 'None') {
          addFieldBlocs(
            fieldBlocs: [
              severityLevelCracking,
              extendedSvLevelCracking,
              remarksCracking,
            ],
          );
        }
      },
    );

    conditionSpalling.onValueChanges(
      onData: (previous, current) async* {
        removeFieldBlocs(
          fieldBlocs: [
            severityLevelSpalling,
            extendedSvLevelSpalling,
            remarksSpalling,
          ],
        );

        if (current.value != 'None') {
          addFieldBlocs(
            fieldBlocs: [
              severityLevelSpalling,
              extendedSvLevelSpalling,
              remarksSpalling,
            ],
          );
        }
      },
    );

    parapetRailingOthers.onValueChanges(
      onData: (previous, current) async* {
        removeFieldBlocs(
          fieldBlocs: [
            conditionParapetRailingOthers,
            severityLevelParapetRailingOthers,
            extendedSvLevelParapetRailingOthers,
            remarksParapetRailingOthers,
          ],
        );

        if (current.value != 'No') {
          addFieldBlocs(
            fieldBlocs: [
              conditionParapetRailingOthers,
              severityLevelParapetRailingOthers,
              extendedSvLevelParapetRailingOthers,
              remarksParapetRailingOthers,
            ],
          );
        }
      },
    );

    // --------------- Joints --------------- //
    jointType.onValueChanges(
      onData: (previous, current) async* {
        removeFieldBlocs(
          fieldBlocs: [
            conditionJointCrackSplit,
            severityLevelJointCrackSplit,
            extendedSvLevelJointCrackSplit,
            remarksJointCrackSplit,
          ],
        );

        if (current.value != 'None') {
          addFieldBlocs(
            fieldBlocs: [
              conditionJointCrackSplit,
              severityLevelJointCrackSplit,
              extendedSvLevelJointCrackSplit,
              remarksJointCrackSplit,
            ],
          );
        }
      },
    );
    /*
    conditionJointCrackSplit.onValueChanges(
      onData: (previous, current) async* {
        removeFieldBlocs(
          fieldBlocs: [
            severityLevelJointCrackSplit,
            extendedSvLevelJointCrackSplit,
            remarksJointCrackSplit,
          ],
        );

        if (current.value != 'None') {
          addFieldBlocs(fieldBlocs: [
            severityLevelJointCrackSplit,
            extendedSvLevelJointCrackSplit,
            remarksJointCrackSplit,
          ]);
        }
      },
    );
    */

    conditionJointFixity.onValueChanges(
      onData: (previous, current) async* {
        removeFieldBlocs(
          fieldBlocs: [
            severityLevelJointFixity,
            extendedSvLevelJointFixity,
            remarksJointFixity,
          ],
        );

        if (current.value != 'None') {
          addFieldBlocs(
            fieldBlocs: [
              severityLevelJointFixity,
              extendedSvLevelJointFixity,
              remarksJointFixity,
            ],
          );
        }
      },
    );
    conditionJointAlignment.onValueChanges(
      onData: (previous, current) async* {
        removeFieldBlocs(
          fieldBlocs: [
            severityLevelJointAlignment,
            extendedSvLevelJointAlignment,
            remarksJointAlignment,
          ],
        );

        if (current.value != 'Ok') {
          addFieldBlocs(
            fieldBlocs: [
              severityLevelJointAlignment,
              extendedSvLevelJointAlignment,
              remarksJointAlignment,
            ],
          );
        }
      },
    );
    conditionJointWaterLeakage.onValueChanges(
      onData: (previous, current) async* {
        removeFieldBlocs(
          fieldBlocs: [
            severityLevelJointWaterLeakage,
            extendedSvLevelJointWaterLeakage,
            remarksJointWaterLeakage,
          ],
        );

        if (current.value != 'None') {
          addFieldBlocs(
            fieldBlocs: [
              severityLevelJointWaterLeakage,
              extendedSvLevelJointWaterLeakage,
              remarksJointWaterLeakage,
            ],
          );
        }
      },
    );

    jointsOthers.onValueChanges(
      onData: (previous, current) async* {
        removeFieldBlocs(
          fieldBlocs: [
            conditionJointsOthers,
            severityLevelJointsOthers,
            extendedSvLevelJointsOthers,
            remarksJointsOthers,
          ],
        );

        if (current.value != 'No') {
          addFieldBlocs(
            fieldBlocs: [
              conditionJointsOthers,
              severityLevelJointsOthers,
              extendedSvLevelJointsOthers,
              remarksJointsOthers,
            ],
          );
        }
      },
    );
    // --------------- Abutment Approach --------------- //
    conditionPavementDep.onValueChanges(
      onData: (previous, current) async* {
        removeFieldBlocs(
          fieldBlocs: [
            severityLevelPavementDep,
            extendedSvLevelPavementDep,
            remarksPavementDep,
          ],
        );

        if (current.value != 'None') {
          addFieldBlocs(
            fieldBlocs: [
              severityLevelPavementDep,
              extendedSvLevelPavementDep,
              remarksPavementDep,
            ],
          );
        }
      },
    );

    abutmentAppOthers.onValueChanges(
      onData: (previous, current) async* {
        removeFieldBlocs(
          fieldBlocs: [
            conditionAbutmentAppOthers,
            severityLevelAbutmentAppOthers,
            extendedSvLevelAbutmentAppOthers,
            remarksAbutmentAppOthers,
          ],
        );

        if (current.value != 'No') {
          addFieldBlocs(
            fieldBlocs: [
              conditionAbutmentAppOthers,
              severityLevelAbutmentAppOthers,
              extendedSvLevelAbutmentAppOthers,
              remarksAbutmentAppOthers,
            ],
          );
        }
      },
    );
    // --------------- Road Furniture --------------- //
    conditionHighClear.onValueChanges(
      onData: (previous, current) async* {
        removeFieldBlocs(
          fieldBlocs: [
            severityLevelHighClear,
            extendedSvLevelHighClear,
            remarksHighClear,
          ],
        );

        if (current.value != 'None') {
          addFieldBlocs(
            fieldBlocs: [
              severityLevelHighClear,
              extendedSvLevelHighClear,
              remarksHighClear,
            ],
          );
        }
      },
    );

    roadFurnitureOthers.onValueChanges(
      onData: (previous, current) async* {
        removeFieldBlocs(
          fieldBlocs: [
            conditionRoadFurnitureOthers,
            severityLevelRoadFurnitureOthers,
            extendedSvLevelRoadFurnitureOthers,
            remarksRoadFurnitureOthers,
          ],
        );

        if (current.value != 'No') {
          addFieldBlocs(
            fieldBlocs: [
              conditionRoadFurnitureOthers,
              severityLevelRoadFurnitureOthers,
              extendedSvLevelRoadFurnitureOthers,
              remarksRoadFurnitureOthers,
            ],
          );
        }
      },
    );
  }

  @override
  Future<void> close() {
    // deck drainage
    cond_surfacebridge_blockage_remarks.close();
    remarksDrServiceability.close();
    remarksDeckDrainageOthers.close();
    // parapet railing
    cond_ponding_remarks.close();
    remarksBaseFix.close();
    remarksCorrosion.close();
    remarksCracking.close();
    remarksSpalling.close();
    remarksParapetRailingOthers.close();
    // joints
    remarksJointCrackSplit.close();
    remarksJointFixity.close();
    remarksJointAlignment.close();
    remarksJointWaterLeakage.close();
    remarksJointsOthers.close();
    // abutment approach
    remarksPavementDep.close();
    remarksAbutmentAppOthers.close();
    // road furniture
    remarksHighClear.close();
    remarksRoadFurnitureOthers.close();

    //elementRatingDeckDrainage.close();
    //conditionDrStructure.close();

    return super.close();
  }

  @override
  void onSubmitting() async {
    //blockage
    print(cond_blockage_status.value.toString());
    print(cond_surfacebridge_blockage_bound.value.toString());
    print(cond_surfacebridge_blockage_remarks.value.toString());
    //ponding 
    print(cond_ponding_status.value.toString());
    print(cond_ponding_bound.value.toString());
    print(cond_ponding_remarks.value.toString());
    //other(surface drg)
    print(cond_surfacebridge_Status.value.toString());
    print(cond_others_bound.value.toString());
    print(cond_surfacebridge_others.value.toString());
    print(cond_others_remarks.value.toString());
    //impact damage
    print(cond_impact_status.value.toString());
    print(cond_impact_bound.value.toString());
    print(cond_impact_bound.value.toString());
    //corrosion
    print(cond_corrosion_status.value.toString());
    print(cond_corrosion_bound.value.toString());
    print(remarksCorrosion.value.toString());

    //crack
    print(cond_crack_status.value.toString());
    print(cond_crack_bound.value.toString());
    print(remarksCracking.value.toString());

    //spalling
    print(cond_spall_status.value.toString());
    print(cond_spall_bound.value.toString());
    print(remarksSpalling.value.toString());

    //others(parapet)
    print(cond_parapet_others.value.toString());
    print(cond_parapet_others_status.value.toString());
    print(cond_parapet_others_bound.value.toString());
    print(cond_parapet_remarks.value.toString());

    //joint
     print(joint_description.value.toString());
     print(cond_joint_status.value.toString());
     print(cond_joint_bound.value.toString());
     print(cond_joint_remarks.value.toString());

    //fixity
    print(cond_fixity_status.value.toString());
    print(cond_fixity_bound.value.toString());

    //water leakage
    print(cond_leakage_status.value.toString());
    print(cond_leakage_bound.value.toString());

    //others(joint)
    print(joint_others.value.toString());
    print(cond_joint_others_status.value.toString());
    print(cond_joint_others_bound.value.toString());

    //Abutment approach
    print(cond_pavement_status.value.toString());
    print(cond_pavement_bound.value.toString());
    print(cond_pavement_remarks.value.toString());

    //others(abutment approach)
    print(cond_abutmentapproach_others.value.toString());
    print(cond_abutmentapproach_others_status.value.toString());
    print(cond_abutmentapproach_others_bound.value.toString());
    print(abutmentapproach_others_remarks.value.toString());  

    //Beam/Girder(corrosion)
    print(cond_beam_corrosion_status.value.toString());
    print(cond_beam_corrosion_bound.value.toString());
    print(cond_beam_corrosion_remarks.value.toString());

    //beam/Girder(crack)
    print(cond_beam_crack_status.value.toString());
    print(cond_beam_crack_bound.value.toString());
    print(cond_beam_crack_remarks.value.toString());

    //beam/girder(spalling)
    print(cond_beam_spalling_status.value.toString());
    print(cond_beam_spalling_bound.value.toString());
    print(cond_beam_spalling_remarks.value.toString());

    //beam/girder(others)
    print(cond_beam_others.value.toString());
    print(cond_beam_others_status.value.toString());
    print(cond_beam_others_bound.value.toString());
    print(cond_beam_others_remarks.value.toString());

    //Deck soflift(crack)
    print(cond_decksoffit_crack_status.value.toString());
    print(cond_decksoffit_crack_bound.value.toString());
    print(cond_decksoffit_crack_remarks.value.toString());

    //Dect softlift(spal)
    print(cond_decksoffit_spall_status.value.toString());
    print(cond_decksoffit_spall_bound.value.toString());
    print(cond_decksoffit_spall_remarks.value.toString());

    //Deck Soflift(others)
    print(cond_decksoffit_others.value.toString());
    print(cond_decksoffit_others_status.value.toString());
    print(cond_decksoffit_others_bound.value.toString());
    print(cond_decksoffit_others_remarks.value.toString());

    //abutmentwingwall(relative movement)
    print(cond_abutmentwingwall_movement_status.value.toString());
    print(cond_abutmentwingwall_movement_bound.value.toString());
    print(cond_abutmentwingwall_movement_remarks.value.toString());

    //abutment wingwall(crack)
    print(cond_abutmentwingwall_crack_status.value.toString());
    print(cond_abutmentwingwall_crack_bound.value.toString());
    print(cond_abutmentwingwall_crack_remarks.value.toString());

    //abutment wingwall(spalling)
    print(cond_abutmentwingwall_spall_status.value.toString());
    print(cond_abutmentwingwall_spall_bound.value.toString());
    print(cond_abutmentwingwall_spall_remarks.value.toString());

    //abutment wingwall(others)
    print(cond_abutmentwingwall_others.value.toString());
    print(cond_abutmentwingwall_others_status.value.toString());
    print(cond_abutmentwingwall_others_bound.value.toString());
    print(cond_abutmentwingwall_others_remarks.value.toString());

    //pier (movement)
    print(cond_pier_movement_status.value.toString());
    print(cond_pier_movement_bound.value.toString());
    print(cond_pier_movement_remarks.value.toString());

    //pier (scouring)
    print(cond_pier_scour_status.value.toString());
    print(cond_pier_scour_bound.value.toString());
    print(cond_pier_scour_remarks.value.toString());

    //pier (debris)
    print(cond_pier_debris_status.value.toString());
    print(cond_pier_debris_bound.value.toString());
    print(cond_pier_debris_remarks.value.toString());

    //pier (crack)
    print(cond_pier_crack_status.value.toString());
    print(cond_pier_crack_bound.value.toString());
    print(cond_pier_crack_remarks.value.toString());

    //pier (spalling)
    print(cond_pier_spall_status.value.toString());
    print(cond_pier_spall_bound.value.toString());
    print(cond_pier_spall_remarks.value.toString());
    
    //pier (others)
    print(cond_pier_others.value.toString());
    print(cond_pier_others_status.value.toString());
    print(cond_pier_others_bound.value.toString());
    print(cond_pier_others_remarks.value.toString());

    //Slope protection(damage of protection material)
    print(cond_slopeprotection_damage_status.value.toString());
    print(cond_slopeprotection_damage_bound.value.toString());
    print(cond_slopeprotection_damage_remarks.value.toString());

    //slope protection (scouring)
    print(cond_slopeprotection_scouring_status.value.toString());
    print(cond_slopeprotection_scouring_bound.value.toString());
    print(cond_slopeprotection_scouring_remarks.value.toString());

    //slope protection (Erosion)
    print(cond_slopeprotection_erosion_status.value.toString());
    print(cond_slopeprotection_erosion_bound.value.toString());
    print(cond_slopeprotection_erosion_remarks.value.toString());

    //slope protection (vege)
    print(cond_slopeprotection_vege_status.value.toString());
    print(cond_slopeprotection_vege_bound.value.toString());
    print(cond_slopeprotection_vege_remarks.value.toString());

    //slope protection (silt)
    print(cond_slopeprotection_silt_status.value.toString());
    print(cond_slopeprotection_silt_bound.value.toString());
    print(cond_slopeprotection_silt_remarks.value.toString());

    //slope protection (others)
    print(cond_slopeprotection_others.value.toString());
    print(cond_slopeprotection_others_status.value.toString());
    print(cond_slopeprotection_others_bound.value.toString());
    print(cond_slopeprotection_others_remarks.value.toString());

    // print(cond_blockage_status.value.toString());
    print(conditionDeckDrainageOthers.value.toString());
    print(severityLevelDeckDrainageOthers.value.toString());
    print(extendedSvLevelDeckDrainageOthers.value.toString());
    print(remarksDeckDrainageOthers.value.toString());

    //bearing (deformation)
    print(cond_bearing_deform_status.value.toString());
    print(cond_bearing_deform_bound.value.toString());
    print(cond_bearing_deform_remarks.value.toString());

    //bearing (debris)
    print(cond_bearing_debris_status.value.toString());
    print(cond_bearing_debris_bound.value.toString());
    print(cond_bearing_debris_remarks.value.toString());

    //bearing(seating)
    print(cond_bearing_seating_status.value.toString());
    print(cond_bearing_seating_bound.value.toString());
    print(cond_bearing_seating_remarks.value.toString());

    //bearing (plinth)
    print(cond_bearing_plinth_status.value.toString());
    print(cond_bearing_plinth_bound.value.toString());
    print(cond_bearing_plinth_remarks.value.toString());

    //bearing (others)
    print(cond_bearing_others.value.toString());
    print(cond_bearing_others_status.value.toString());
    print(cond_bearing_others_bound.value.toString());
    print(cond_bearing_others_remarks.value.toString());

    //others elements 1
    print(cond_otherselem1_description.value.toString());
    print(cond_otherselem1_status.value.toString());
    print(cond_otherselem1_bound.value.toString());
    print(cond_otherselem1_remarks.value.toString());

    //others element 2
    print(cond_otherselem2_description.value.toString());
    print(cond_otherselem2_status.value.toString());
    print(cond_otherselem2_bound.value.toString());
    print(cond_otherselem2_remarks.value.toString());

    //summary of inpection
    print(cond_routinedefect1.value.toString());
    print(cond_routinedefect2.value.toString());  
    print(cond_routinedefect3.value.toString()); 
    print(cond_routinedefect4.value.toString());
    print(cond_otherdefect1.value.toString());
    print(cond_otherdefect2.value.toString());
    print(cond_otherdefect3.value.toString());
    print(cond_otherdefect4.value.toString());

    print(elementRatingDeckDrainage.value.toString());
    //  deck drainage

    print(conditionImpDamage.value.toString());
    print(severityLevelImpDamage.value.toString());
    print(extendedSvLevelImpDamage.value.toString());
    print(cond_ponding_remarks.value.toString());

    print(conditionBaseFix.value.toString());
    print(severityLevelBaseFix.value.toString());
    print(extendedSvLevelBaseFix.value.toString());
    print(remarksBaseFix.value.toString());

    print(conditionCorrosion.value.toString());
    print(severityLevelCorrosion.value.toString());
    print(extendedSvLevelCorrosion.value.toString());
    

    print(conditionCracking.value.toString());
    print(severityLevelCracking.value.toString());
    print(extendedSvLevelCracking.value.toString());


    print(conditionSpalling.value.toString());
    print(severityLevelSpalling.value.toString());
    print(extendedSvLevelSpalling.value.toString());
   

    print(parapetRailingOthers.value.toString());
    print(conditionParapetRailingOthers.value.toString());
    print(severityLevelParapetRailingOthers.value.toString());
    print(extendedSvLevelParapetRailingOthers.value.toString());
    print(remarksParapetRailingOthers.value.toString());

    print(elementRatingParapetRailing.value.toString());

    //  parapet railing

   
    print(conditionJointCrackSplit.value.toString());
    print(severityLevelJointCrackSplit.value.toString());
    print(extendedSvLevelJointCrackSplit.value.toString());
    print(remarksJointCrackSplit.value.toString());

    print(conditionJointFixity.value.toString());
    print(severityLevelJointFixity.value.toString());
    print(extendedSvLevelJointFixity.value.toString());
    print(remarksJointFixity.value.toString());

    print(conditionJointAlignment.value.toString());
    print(severityLevelJointAlignment.value.toString());
    print(extendedSvLevelJointAlignment.value.toString());
    print(remarksJointAlignment.value.toString());

    print(conditionJointWaterLeakage.value.toString());
    print(severityLevelJointWaterLeakage.value.toString());
    print(extendedSvLevelJointWaterLeakage.value.toString());
    print(remarksJointWaterLeakage.value.toString());

    print(jointsOthers.value.toString());
    print(conditionJointsOthers.value.toString());
    print(severityLevelJointsOthers.value.toString());
    print(extendedSvLevelJointsOthers.value.toString());
    print(remarksJointsOthers.value.toString());

    print(elementRatingJoints.value.toString());
    //  joints

    print(conditionPavementDep.value.toString());
    print(severityLevelPavementDep.value.toString());
    print(extendedSvLevelPavementDep.value.toString());
    print(remarksPavementDep.value.toString());

    print(abutmentAppOthers.value.toString());
    print(conditionAbutmentAppOthers.value.toString());
    print(severityLevelAbutmentAppOthers.value.toString());
    print(extendedSvLevelAbutmentAppOthers.value.toString());
    print(remarksAbutmentAppOthers.value.toString());

    print(elementRatingAbutmentApp.value.toString());
    //  abutment approach

    print(conditionHighClear.value.toString());
    print(severityLevelHighClear.value.toString());
    print(extendedSvLevelHighClear.value.toString());
    print(remarksHighClear.value.toString());

    print(roadFurnitureOthers.value.toString());
    print(conditionRoadFurnitureOthers.value.toString());
    print(severityLevelRoadFurnitureOthers.value.toString());
    print(extendedSvLevelRoadFurnitureOthers.value.toString());
    print(remarksRoadFurnitureOthers.value.toString());

    print(elementRatingRoadFurniture.value.toString());

    //print('Bridge ID : ${widget.row}');
    //  road furniture

    // try {
    //   await Future<void>.delayed(const Duration(milliseconds: 500));
    //   emitSuccess();
    // } catch (e) {
    //   emitFailure();
    // }
  }
}

class SuperstructureSecondaryTab extends StatelessWidget {
  SuperstructureSecondaryTab({super.key});
  StructureSecondaryForm? formBloc;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 2000,
      child: BlocProvider(
        create: (context) => StructureSecondaryForm(),
        child: Builder(
          builder: (context) {
            final formBloc = BlocProvider.of<StructureSecondaryForm>(context);

            return Theme(
              data: Theme.of(context).copyWith(
                inputDecorationTheme: InputDecorationTheme(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              child: Scaffold(
                body: FormBlocListener<StructureSecondaryForm, String, String>(
                  child: SingleChildScrollView(
                    //physics: const ClampingScrollPhysics(),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          //  -------------------- <DECK Bridge> Structure, Services, Others -------------------- //
                          //Surface Drainaige(blockage)
                          const Text(
                            'Surface Drainage',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text('Blockage'),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.cond_blockage_status,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Defects',
                              prefixIcon: SizedBox(),
                            ),
                          ),

                          const SizedBox(height: 5.0),
                          const Text('Bound'),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.cond_surfacebridge_blockage_bound,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          TextFieldBlocBuilder(
                            textFieldBloc: formBloc.cond_surfacebridge_blockage_remarks,
                            keyboardType: TextInputType.multiline,
                            maxLines: 3,
                            decoration: const InputDecoration(
                              labelText: 'Remarks',
                              prefixIcon: Icon(Icons.note_alt_rounded),
                            ),
                          ),

                          const SizedBox(height: 15.0),
                        //Surface Drainaige(Ponding water)
                          const Text(
                            'Surface Drainage',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text('Ponding Water'),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.cond_ponding_status,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Defects',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          const SizedBox(height: 5.0),
                          const Text('Bound'),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.cond_ponding_bound,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          TextFieldBlocBuilder(
                            textFieldBloc: formBloc.cond_ponding_remarks,
                            keyboardType: TextInputType.multiline,
                            maxLines: 3,
                            decoration: const InputDecoration(
                              labelText: 'Remarks',
                              prefixIcon: Icon(Icons.note_alt_rounded),
                            ),
                          ),
                          //Surface Drainaige(others)
                          const Text(
                            'Surface Drainage',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                             TextFieldBlocBuilder(
                            textFieldBloc: formBloc.cond_surfacebridge_others,
                            keyboardType: TextInputType.multiline,
                            maxLines: 3,
                            decoration: const InputDecoration(
                              labelText: 'Others',
                              prefixIcon: Icon(Icons.note_alt_rounded),
                            ),
                          ),
                          const Text('Others'),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.cond_surfacebridge_Status,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Status',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          const SizedBox(height: 5.0),
                          const Text('Bound'),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.cond_others_bound,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Bound',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          TextFieldBlocBuilder(
                            textFieldBloc: formBloc.cond_others_remarks,
                            keyboardType: TextInputType.multiline,
                            maxLines: 3,
                            decoration: const InputDecoration(
                              labelText: 'Remarks',
                              prefixIcon: Icon(Icons.note_alt_rounded),
                            ),
                          ),
                          //Impact damage
                          const Text(
                            'Parapet',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text('Impact Damage'),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.cond_impact_status,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Status',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          const SizedBox(height: 5.0),
                          const Text('Bound'),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.cond_impact_bound,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Bound',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          TextFieldBlocBuilder(
                            textFieldBloc: formBloc.cond_impact_remarks,
                            keyboardType: TextInputType.multiline,
                            maxLines: 3,
                            decoration: const InputDecoration(
                              labelText: 'Remarks',
                              prefixIcon: Icon(Icons.note_alt_rounded),
                            ),
                          ),
                          //corrosion
                          // const Text(
                          //   'Parapet',
                          //   style: TextStyle(
                          //     fontSize: 20,
                          //     fontWeight: FontWeight.bold,
                          //   ),
                          // ),
                          const Text('Corrosion'),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.cond_corrosion_status,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Status',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          const SizedBox(height: 5.0),
                          const Text('Bound'),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.cond_corrosion_bound,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Bound',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          TextFieldBlocBuilder(
                            textFieldBloc: formBloc.remarkscorrosion,
                            keyboardType: TextInputType.multiline,
                            maxLines: 3,
                            decoration: const InputDecoration(
                              labelText: 'Remarks',
                              prefixIcon: Icon(Icons.note_alt_rounded),
                            ),
                          ),

                          const Text(
                            'Parapet',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text('Crack'),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.cond_crack_status,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Status',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          const SizedBox(height: 5.0),
                          const Text('Bound'),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.cond_crack_bound,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Bound',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          TextFieldBlocBuilder(
                            textFieldBloc: formBloc.remarkscrack,
                            keyboardType: TextInputType.multiline,
                            maxLines: 3,
                            decoration: const InputDecoration(
                              labelText: 'Remarks',
                              prefixIcon: Icon(Icons.note_alt_rounded),
                            ),
                          ),
                          //Spalling
                          const Text(
                            'Parapet',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text('Spalling'),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.cond_spall_status,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Status',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          const SizedBox(height: 5.0),
                          const Text('Bound'),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.cond_spall_bound,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Bound',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          TextFieldBlocBuilder(
                            textFieldBloc: formBloc.remarksspalling,
                            keyboardType: TextInputType.multiline,
                            maxLines: 3,
                            decoration: const InputDecoration(
                              labelText: 'Remarks',
                              prefixIcon: Icon(Icons.note_alt_rounded),
                            ),
                          ),

                          // const Text(
                          //   'Parapet',
                          //   style: TextStyle(
                          //     fontSize: 20,
                          //     fontWeight: FontWeight.bold,
                          //   ),
                          // ),
                          //others
                          TextFieldBlocBuilder(
                            textFieldBloc: formBloc.cond_parapet_others,
                            keyboardType: TextInputType.multiline,
                            maxLines: 3,
                            decoration: const InputDecoration(
                              labelText: 'Others:',
                              prefixIcon: Icon(Icons.note_alt_rounded),
                            ),
                          ),
                          const Text('Others'),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.cond_parapet_others_status,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Status',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          const SizedBox(height: 5.0),
                          const Text('Bound'),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.cond_parapet_others_bound,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Bound',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          TextFieldBlocBuilder(
                            textFieldBloc: formBloc.cond_parapet_remarks,
                            keyboardType: TextInputType.multiline,
                            maxLines: 3,
                            decoration: const InputDecoration(
                              labelText: 'Remarks',
                              prefixIcon: Icon(Icons.note_alt_rounded),
                            ),
                          ),

                          //joint
                          const Text(
                            'Joint',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        
                          const Text('Type'),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.joint_description,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: '',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          const Text('Status'),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.cond_joint_status,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          const SizedBox(height: 5.0),
                          const Text('Bound'),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.cond_joint_bound,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Bound',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          TextFieldBlocBuilder(
                            textFieldBloc: formBloc.cond_joint_remarks,
                            keyboardType: TextInputType.multiline,
                            maxLines: 3,
                            decoration: const InputDecoration(
                              labelText: 'Remarks',
                              prefixIcon: Icon(Icons.note_alt_rounded),
                            ),
                          ),

                          // const Text(
                          //   'Joint',
                          //   style: TextStyle(
                          //     fontSize: 20,
                          //     fontWeight: FontWeight.bold,
                          //   ),
                          // ),
                          //Fixity
                          const Text('Fixity'),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.cond_fixity_status,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Status',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          const SizedBox(height: 5.0),
                          const Text('Bound'),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.cond_fixity_bound,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Bound',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          TextFieldBlocBuilder(
                            textFieldBloc: formBloc.remarksFixity,
                            keyboardType: TextInputType.multiline,
                            maxLines: 3,
                            decoration: const InputDecoration(
                              labelText: 'Remarks',
                              prefixIcon: Icon(Icons.note_alt_rounded),
                            ),
                          ),

                          // const Text(
                          //   'Joint',
                          //   style: TextStyle(
                          //     fontSize: 20,
                          //     fontWeight: FontWeight.bold,
                          //   ),
                          // ),
                          //Water Leakage	
                          const Text('Water Leakage'),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.cond_leakage_status,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Status',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          const SizedBox(height: 5.0),
                          const Text('Bound'),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.cond_leakage_bound,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Bound',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          TextFieldBlocBuilder(
                            textFieldBloc: formBloc.remarksWaterLeakage,
                            keyboardType: TextInputType.multiline,
                            maxLines: 3,
                            decoration: const InputDecoration(
                              labelText: 'Remarks',
                              prefixIcon: Icon(Icons.note_alt_rounded),
                            ),
                          ),

                          //other(Joint)
                            TextFieldBlocBuilder(
                            textFieldBloc: formBloc.joint_others,
                            keyboardType: TextInputType.multiline,
                            maxLines: 3,
                            decoration: const InputDecoration(
                              labelText: 'Other:',
                              prefixIcon: Icon(Icons.note_alt_rounded),
                            ),
                          ),
                          
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.cond_joint_others_status,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Status',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          const SizedBox(height: 5.0),
                          const Text('Bound'),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.cond_joint_others_bound,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Bound',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          TextFieldBlocBuilder(
                            textFieldBloc: formBloc.remarksjointOthers,
                            keyboardType: TextInputType.multiline,
                            maxLines: 3,
                            decoration: const InputDecoration(
                              labelText: 'Remarks',
                              prefixIcon: Icon(Icons.note_alt_rounded),
                            ),
                          ),

                          const Text(
                            'Abutment Approach',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text('Pavement Depression'),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.cond_pavement_status,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Status',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          const SizedBox(height: 5.0),
                          const Text('Bound'),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc:
                                formBloc.cond_pavement_bound,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Bound',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          TextFieldBlocBuilder(
                            textFieldBloc: formBloc.cond_pavement_remarks,
                            keyboardType: TextInputType.multiline,
                            maxLines: 3,
                            decoration: const InputDecoration(
                              labelText: 'Remarks',
                              prefixIcon: Icon(Icons.note_alt_rounded),
                            ),
                          ),

                          // const Text(
                          //   'Abutment Approach',
                          //   style: TextStyle(
                          //     fontSize: 20,
                          //     fontWeight: FontWeight.bold,
                          //   ),
                          // ),
                          //Others (Abutment Approach)
                            TextFieldBlocBuilder(
                            textFieldBloc: formBloc.cond_abutmentapproach_others,
                            keyboardType: TextInputType.multiline,
                            maxLines: 3,
                            decoration: const InputDecoration(
                              labelText: 'Others',
                              prefixIcon: Icon(Icons.note_alt_rounded),
                            ),
                          ),
                          
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.cond_abutmentapproach_others_status,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Status',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          const SizedBox(height: 5.0),
                          const Text('Bound'),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.cond_abutmentapproach_others_bound,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Bound',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          TextFieldBlocBuilder(
                            textFieldBloc: formBloc.abutmentapproach_others_remarks,
                            keyboardType: TextInputType.multiline,
                            maxLines: 3,
                            decoration: const InputDecoration(
                              labelText: 'Remarks',
                              prefixIcon: Icon(Icons.note_alt_rounded),
                            ),
                          ),

                          const Text(
                            'Beam/Girder',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text('Corrosion'),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.cond_beam_corrosion_status,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Status',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          const SizedBox(height: 5.0),
                          const Text('Bound'),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.cond_beam_corrosion_bound,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Bound',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          TextFieldBlocBuilder(
                            textFieldBloc: formBloc.cond_beam_corrosion_remarks,
                            keyboardType: TextInputType.multiline,
                            maxLines: 3,
                            decoration: const InputDecoration(
                              labelText: 'Remarks',
                              prefixIcon: Icon(Icons.note_alt_rounded),
                            ),
                          ),

                          const Text(
                            'Beam/Girder',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text('Crack'),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.cond_beam_crack_status,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Status',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          const SizedBox(height: 5.0),
                          const Text('Bound'),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.cond_beam_crack_bound,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Bound',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          TextFieldBlocBuilder(
                            textFieldBloc: formBloc.cond_beam_crack_remarks,
                            keyboardType: TextInputType.multiline,
                            maxLines: 3,
                            decoration: const InputDecoration(
                              labelText: 'Remarks',
                              prefixIcon: Icon(Icons.note_alt_rounded),
                            ),
                          ),

                          const Text(
                            'Beam/Girder',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text('Spalling'),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.cond_beam_spalling_status,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Status',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          const SizedBox(height: 5.0),
                          const Text('Bound'),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.cond_beam_spalling_bound,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Bound',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          TextFieldBlocBuilder(
                            textFieldBloc: formBloc.cond_beam_spalling_remarks,
                            keyboardType: TextInputType.multiline,
                            maxLines: 3,
                            decoration: const InputDecoration(
                              labelText: 'Remarks',
                              prefixIcon: Icon(Icons.note_alt_rounded),
                            ),
                          ),
                          const Text(
                            'Beam/Girder',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text('Others'),
                           TextFieldBlocBuilder(
                            textFieldBloc: formBloc.cond_beam_others,
                            keyboardType: TextInputType.multiline,
                            maxLines: 3,
                            decoration: const InputDecoration(
                              labelText: 'Others',
                              prefixIcon: Icon(Icons.note_alt_rounded),
                            ),
                          ),
                          // const Text('Others'),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.cond_beam_others_status,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Status',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          const SizedBox(height: 5.0),
                          const Text('Bound'),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.cond_beam_others_bound,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Bound',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          TextFieldBlocBuilder(
                            textFieldBloc: formBloc.cond_beam_others_remarks,
                            keyboardType: TextInputType.multiline,
                            maxLines: 3,
                            decoration: const InputDecoration(
                              labelText: 'Remarks',
                              prefixIcon: Icon(Icons.note_alt_rounded),
                            ),
                          ),

                          const Text(
                            'Deck Soffit',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text('Crack'),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.cond_decksoffit_crack_status,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Status',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          const SizedBox(height: 5.0),
                          const Text('Bound'),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.cond_decksoffit_crack_bound,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Bound',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          TextFieldBlocBuilder(
                            textFieldBloc: formBloc.cond_decksoffit_crack_remarks,
                            keyboardType: TextInputType.multiline,
                            maxLines: 3,
                            decoration: const InputDecoration(
                              labelText: 'Remarks',
                              prefixIcon: Icon(Icons.note_alt_rounded),
                            ),
                          ),

                          const Text(
                            'Deck Soffit',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text('Spalling'),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.cond_decksoffit_spall_status,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Status',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          const SizedBox(height: 5.0),
                          const Text('Bound'),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.cond_decksoffit_spall_bound,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Bound',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          TextFieldBlocBuilder(
                            textFieldBloc: formBloc.cond_decksoffit_spall_remarks,
                            keyboardType: TextInputType.multiline,
                            maxLines: 3,
                            decoration: const InputDecoration(
                              labelText: 'Remarks',
                              prefixIcon: Icon(Icons.note_alt_rounded),
                            ),
                          ),

                          const Text(
                            'Deck Soffit',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          // const Text('Others'),
                            TextFieldBlocBuilder(
                            textFieldBloc: formBloc.cond_decksoffit_others,
                            keyboardType: TextInputType.multiline,
                            maxLines: 3,
                            decoration: const InputDecoration(
                              labelText: 'Others',
                              prefixIcon: Icon(Icons.note_alt_rounded),
                            ),
                          ),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.cond_decksoffit_others_status,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'status',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          const SizedBox(height: 5.0),
                          const Text('Bound'),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.cond_decksoffit_others_bound,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Bound',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          TextFieldBlocBuilder(
                            textFieldBloc: formBloc.cond_decksoffit_others_remarks,
                            keyboardType: TextInputType.multiline,
                            maxLines: 3,
                            decoration: const InputDecoration(
                              labelText: 'Remarks',
                              prefixIcon: Icon(Icons.note_alt_rounded),
                            ),
                          ),

                          const Text(
                            'Abutment/Wingwall',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text('Relative Movement'),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.cond_abutmentwingwall_movement_status,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Status',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          const SizedBox(height: 5.0),
                          const Text('Bound'),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.cond_abutmentwingwall_movement_bound,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              // labelText: 'Bound',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          TextFieldBlocBuilder(
                            textFieldBloc: formBloc.cond_abutmentwingwall_movement_remarks,
                            keyboardType: TextInputType.multiline,
                            maxLines: 3,
                            decoration: const InputDecoration(
                              labelText: 'Remarks',
                              prefixIcon: Icon(Icons.note_alt_rounded),
                            ),
                          ),
                          const Text(
                            'Abutment / Wingwall	',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text('Crack'),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.cond_abutmentwingwall_crack_status,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Status',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          const SizedBox(height: 5.0),
                          const Text('Bound'),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.cond_abutmentwingwall_crack_bound,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              // labelText: 'Bound',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          TextFieldBlocBuilder(
                            textFieldBloc: formBloc.cond_abutmentwingwall_crack_remarks,
                            keyboardType: TextInputType.multiline,
                            maxLines: 3,
                            decoration: const InputDecoration(
                              labelText: 'Remarks',
                              prefixIcon: Icon(Icons.note_alt_rounded),
                            ),
                          ),

                          // const Text(
                          //   'Pier',
                          //   style: TextStyle(
                          //     fontSize: 20,
                          //     fontWeight: FontWeight.bold,
                          //   ),
                          // ),
                          const Text('Spalling'),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.cond_abutmentwingwall_spall_status,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Status',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          const SizedBox(height: 5.0),
                          const Text('Bound'),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.cond_abutmentwingwall_spall_bound,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              // labelText: 'Bound',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          TextFieldBlocBuilder(
                            textFieldBloc: formBloc.cond_abutmentwingwall_spall_remarks,
                            keyboardType: TextInputType.multiline,
                            maxLines: 3,
                            decoration: const InputDecoration(
                              labelText: 'Remarks',
                              prefixIcon: Icon(Icons.note_alt_rounded),
                            ),
                          ),
                          const Text(
                            'Abutment / Wingwall',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                            TextFieldBlocBuilder(
                            textFieldBloc: formBloc.cond_abutmentwingwall_others,
                            keyboardType: TextInputType.multiline,
                            maxLines: 3,
                            decoration: const InputDecoration(
                              labelText: 'Others:',
                              prefixIcon: Icon(Icons.note_alt_rounded),
                            ),
                          ),
                          // const Text('Accumulation Of Debris'),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.cond_abutmentwingwall_others_status,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Status',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          const SizedBox(height: 5.0),
                          const Text('Bound'),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.cond_abutmentwingwall_others_bound,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              // labelText: 'Bound',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          TextFieldBlocBuilder(
                            textFieldBloc: formBloc.cond_abutmentwingwall_others_remarks,
                            keyboardType: TextInputType.multiline,
                            maxLines: 3,
                            decoration: const InputDecoration(
                              labelText: 'Remarks',
                              prefixIcon: Icon(Icons.note_alt_rounded),
                            ),
                          ),
                          const Text(
                            'Pier',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text('Relative Movement'),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.cond_pier_movement_status,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Status',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          const SizedBox(height: 5.0),
                          const Text('Bound'),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.cond_pier_movement_bound,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              // labelText: 'Bound',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          TextFieldBlocBuilder(
                            textFieldBloc: formBloc.cond_pier_movement_remarks,
                            keyboardType: TextInputType.multiline,
                            maxLines: 3,
                            decoration: const InputDecoration(
                              labelText: 'Remarks',
                              prefixIcon: Icon(Icons.note_alt_rounded),
                            ),
                          ),

                          const Text(
                            'Pier',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text('Scouring'),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.cond_pier_scour_status,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Status',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          const SizedBox(height: 5.0),
                          const Text('Bound'),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.cond_pier_scour_bound,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              // labelText: 'Bound',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          TextFieldBlocBuilder(
                            textFieldBloc: formBloc.cond_pier_scour_remarks,
                            keyboardType: TextInputType.multiline,
                            maxLines: 3,
                            decoration: const InputDecoration(
                              labelText: 'Remarks',
                              prefixIcon: Icon(Icons.note_alt_rounded),
                            ),
                          ),

                          const Text(
                            'Pier',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text('Accumulation of Debris'),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.cond_pier_debris_status,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Status',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          const SizedBox(height: 5.0),
                          const Text('Bound'),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.cond_pier_debris_bound,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              // labelText: 'Bound',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          TextFieldBlocBuilder(
                            textFieldBloc: formBloc.cond_pier_debris_remarks,
                            keyboardType: TextInputType.multiline,
                            maxLines: 3,
                            decoration: const InputDecoration(
                              labelText: 'Remarks',
                              prefixIcon: Icon(Icons.note_alt_rounded),
                            ),
                          ),

                          const Text(
                            'Pier',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text('Crack'),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.cond_pier_crack_status,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Status',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          const SizedBox(height: 5.0),
                          const Text('Bound'),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.cond_pier_crack_bound,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              // labelText: 'Bound',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          TextFieldBlocBuilder(
                            textFieldBloc: formBloc.cond_pier_crack_remarks,
                            keyboardType: TextInputType.multiline,
                            maxLines: 3,
                            decoration: const InputDecoration(
                              labelText: 'Remarks',
                              prefixIcon: Icon(Icons.note_alt_rounded),
                            ),
                          ),

                          // const Text(
                          //   'Slope Protection / River',
                          //   style: TextStyle(
                          //     fontSize: 20,
                          //     fontWeight: FontWeight.bold,
                          //   ),
                          // ),
                          const Text('Spalling'),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.cond_pier_spall_status,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Status',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          const SizedBox(height: 5.0),
                          const Text('Bound'),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.cond_pier_spall_bound,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              // labelText: 'Bound',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          TextFieldBlocBuilder(
                            textFieldBloc: formBloc.cond_pier_spall_remarks,
                            keyboardType: TextInputType.multiline,
                            maxLines: 3,
                            decoration: const InputDecoration(
                              labelText: 'Remarks',
                              prefixIcon: Icon(Icons.note_alt_rounded),
                            ),
                          ),
                            const Text('Others'),
                            TextFieldBlocBuilder(
                            textFieldBloc: formBloc.cond_pier_others,
                            keyboardType: TextInputType.multiline,
                            maxLines: 3,
                            decoration: const InputDecoration(
                              // labelText: 'Remarks',
                              prefixIcon: Icon(Icons.note_alt_rounded),
                            ),
                          ),
                          const Text('Status'),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.cond_pier_others_status,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              // labelText: 'Status',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          const SizedBox(height: 5.0),
                          const Text('Bound'),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.cond_pier_others_bound,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              // labelText: 'Bound',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          const Text('Remarks'),
                          TextFieldBlocBuilder(
                            textFieldBloc: formBloc.cond_pier_others_remarks,
                            keyboardType: TextInputType.multiline,
                            maxLines: 3,
                            decoration: const InputDecoration(
                              
                              prefixIcon: Icon(Icons.note_alt_rounded),
                            ),
                          ),

                          const Text(
                            'Slope Proctection / River Bank / Waterway',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text('Damage of Proctection Material'),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.cond_slopeprotection_damage_status,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Status',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          const SizedBox(height: 5.0),
                          const Text('Bound'),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.cond_slopeprotection_damage_bound,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              // labelText: 'Bound',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          TextFieldBlocBuilder(
                            textFieldBloc: formBloc.cond_slopeprotection_damage_remarks,
                            keyboardType: TextInputType.multiline,
                            maxLines: 3,
                            decoration: const InputDecoration(
                              labelText: 'Remarks',
                              prefixIcon: Icon(Icons.note_alt_rounded),
                            ),
                          ),

                          const Text(
                            'Slope Proctection / River Bank / Waterway',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text('Scouring'),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.cond_slopeprotection_scouring_status,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Status',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          const SizedBox(height: 5.0),
                          const Text('Bound'),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.cond_slopeprotection_scouring_bound,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              // labelText: 'Bound',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          TextFieldBlocBuilder(
                            textFieldBloc: formBloc.cond_slopeprotection_scouring_remarks,
                            keyboardType: TextInputType.multiline,
                            maxLines: 3,
                            decoration: const InputDecoration(
                              labelText: 'Remarks',
                              prefixIcon: Icon(Icons.note_alt_rounded),
                            ),
                          ),

                          // const Text(
                          //   'Slope Protection / River',
                          //   style: TextStyle(
                          //     fontSize: 20,
                          //     fontWeight: FontWeight.bold,
                          //   ),
                          // ),
                          const Text('Erosion'),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.cond_slopeprotection_erosion_status,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Status',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          const SizedBox(height: 5.0),
                          // const Text('Bound'),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.cond_slopeprotection_erosion_bound,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Bound',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          TextFieldBlocBuilder(
                            textFieldBloc: formBloc.cond_slopeprotection_erosion_remarks,
                            keyboardType: TextInputType.multiline,
                            maxLines: 3,
                            decoration: const InputDecoration(
                              labelText: 'Remarks',
                              prefixIcon: Icon(Icons.note_alt_rounded),
                            ),
                          ),

                          // const Text(
                          //   'Bearing',
                          //   style: TextStyle(
                          //     fontSize: 20,
                          //     fontWeight: FontWeight.bold,
                          //   ),
                          // ),
                          const Text('Vegetation'),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.cond_slopeprotection_vege_status,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Status',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          const SizedBox(height: 5.0),
                          const Text('Bound'),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.cond_slopeprotection_vege_bound,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              // labelText: 'Bound',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          TextFieldBlocBuilder(
                            textFieldBloc: formBloc.cond_slopeprotection_vege_remarks,
                            keyboardType: TextInputType.multiline,
                            maxLines: 3,
                            decoration: const InputDecoration(
                              labelText: 'Remarks',
                              prefixIcon: Icon(Icons.note_alt_rounded),
                            ),
                          ),

                          // const Text(
                          //   'Bearing',
                          //   style: TextStyle(
                          //     fontSize: 20,
                          //     fontWeight: FontWeight.bold,
                          //   ),
                          // ),
                          const Text('Siltation / Blockage of Waterway	'),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.cond_slopeprotection_silt_status,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Status',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          const SizedBox(height: 5.0),
                          const Text('Bound'),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc:
                                formBloc.cond_slopeprotection_silt_bound,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              // labelText: 'Bound',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          TextFieldBlocBuilder(
                            textFieldBloc: formBloc.cond_slopeprotection_silt_remarks,
                            keyboardType: TextInputType.multiline,
                            maxLines: 3,
                            decoration: const InputDecoration(
                              labelText: 'Remarks',
                              prefixIcon: Icon(Icons.note_alt_rounded),
                            ),
                          ),


                          const Text('Others'),
                            TextFieldBlocBuilder(
                            textFieldBloc: formBloc.cond_slopeprotection_others,
                            keyboardType: TextInputType.multiline,
                            maxLines: 3,
                            decoration: const InputDecoration(
                              // labelText: '',
                              prefixIcon: Icon(Icons.note_alt_rounded),
                            ),
                          ),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.cond_slopeprotection_others_status,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Status',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          const SizedBox(height: 5.0),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.cond_slopeprotection_others_bound,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Bound',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          TextFieldBlocBuilder(
                            textFieldBloc: formBloc.cond_slopeprotection_others_remarks,
                            keyboardType: TextInputType.multiline,
                            maxLines: 3,
                            decoration: const InputDecoration(
                              labelText: 'Remarks',
                              prefixIcon: Icon(Icons.note_alt_rounded),
                            ),
                          ),

                          const Text(
                            'Bearing',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text('Abnormal Deformation	'),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.cond_bearing_deform_status,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Status',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          const SizedBox(height: 5.0),
                          const Text('Bound'),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.cond_bearing_deform_bound,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              // labelText: 'Bound',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          TextFieldBlocBuilder(
                            textFieldBloc: formBloc.cond_bearing_deform_remarks,
                            keyboardType: TextInputType.multiline,
                            maxLines: 3,
                            decoration: const InputDecoration(
                              labelText: 'Remarks',
                              prefixIcon: Icon(Icons.note_alt_rounded),
                            ),
                          ),

                          const Text('Accumulation of Debris	'),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.cond_bearing_debris_status,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Status',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          const SizedBox(height: 5.0),
                          const Text('Bound'),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.cond_bearing_debris_bound,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                            
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          TextFieldBlocBuilder(
                            textFieldBloc: formBloc.cond_bearing_debris_remarks,
                            keyboardType: TextInputType.multiline,
                            maxLines: 3,
                            decoration: const InputDecoration(
                              labelText: 'Remarks',
                              prefixIcon: Icon(Icons.note_alt_rounded),
                            ),
                          ),

                          const Text('Alignment / Seating	'),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.cond_bearing_seating_status,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Status',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          const SizedBox(height: 5.0),
                          const Text('Bound'),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.cond_bearing_seating_bound,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Bound',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          TextFieldBlocBuilder(
                            textFieldBloc: formBloc.cond_bearing_seating_remarks,
                            keyboardType: TextInputType.multiline,
                            maxLines: 3,
                            decoration: const InputDecoration(
                              labelText: 'Remarks',
                              prefixIcon: Icon(Icons.note_alt_rounded),
                            ),
                          ),
                          const Text('Damage of Plinth'),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.cond_bearing_plinth_status,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Status',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          const SizedBox(height: 5.0),
                          const Text('Bound'),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.cond_bearing_plinth_bound,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Bound',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          TextFieldBlocBuilder(
                            textFieldBloc: formBloc.cond_bearing_plinth_remarks,
                            keyboardType: TextInputType.multiline,
                            maxLines: 3,
                            decoration: const InputDecoration(
                              labelText: 'Remarks',
                              prefixIcon: Icon(Icons.note_alt_rounded),
                            ),
                          ),
                          const Text('Others'),
                            TextFieldBlocBuilder(
                            textFieldBloc: formBloc.cond_bearing_others,
                            keyboardType: TextInputType.multiline,
                            maxLines: 3,
                            decoration: const InputDecoration(
                              // labelText: '',
                              prefixIcon: Icon(Icons.note_alt_rounded),
                            ),
                          ),
                          //sini 28/11/2025
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.cond_bearing_others_status,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Status',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          const SizedBox(height: 5.0),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.cond_bearing_others_bound,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Bound',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          TextFieldBlocBuilder(
                            textFieldBloc: formBloc.cond_bearing_others_remarks,
                            keyboardType: TextInputType.multiline,
                            maxLines: 3,
                            decoration: const InputDecoration(
                              labelText: 'Remarks',
                              prefixIcon: Icon(Icons.note_alt_rounded),
                            ),
                          ),
                            const SizedBox(height: 5.0),
                            const Text('Other Element	'),
                            TextFieldBlocBuilder(
                            textFieldBloc: formBloc.cond_otherselem1_description,
                            keyboardType: TextInputType.multiline,
                            maxLines: 3,
                            decoration: const InputDecoration(
                              labelText: '1.',
                              prefixIcon: Icon(Icons.note_alt_rounded),
                            ),
                          ),
                            DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.cond_otherselem1_status,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Status',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          const SizedBox(height: 5.0),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.cond_otherselem1_bound,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Bound',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                            TextFieldBlocBuilder(
                            textFieldBloc: formBloc.cond_otherselem1_remarks,
                            keyboardType: TextInputType.multiline,
                            maxLines: 3,
                            decoration: const InputDecoration(
                              labelText: 'Remarks',
                              prefixIcon: Icon(Icons.note_alt_rounded),
                            ),
                          ),
                            const SizedBox(height: 5.0),
                            const Text('Other Element	'),
                            TextFieldBlocBuilder(
                            textFieldBloc: formBloc.cond_otherselem2_description,
                            keyboardType: TextInputType.multiline,
                            maxLines: 3,
                            decoration: const InputDecoration(
                              labelText: '2.',
                              prefixIcon: Icon(Icons.note_alt_rounded),
                            ),
                          ),
                            DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.cond_otherselem2_status,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Status',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                            const SizedBox(height: 5.0),
                            DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.cond_otherselem2_bound,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Bound',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                            TextFieldBlocBuilder(
                            textFieldBloc: formBloc.cond_otherselem2_remarks,
                            keyboardType: TextInputType.multiline,
                            maxLines: 3,
                            decoration: const InputDecoration(
                              labelText: 'Remarks',
                              prefixIcon: Icon(Icons.note_alt_rounded),
                            ),
                          ),
                          
                          const Text('Summary of inspection'),
                          const Text('ROUTINE WORK DEFECTS	'),
                            TextFieldBlocBuilder(
                            textFieldBloc: formBloc.cond_routinedefect1,
                            keyboardType: TextInputType.multiline,
                            maxLines: 3,
                            decoration: const InputDecoration(
                              labelText: '1.',
                              prefixIcon: Icon(Icons.note_alt_rounded),
                            ),
                          ),
                            const Text('OTHER DEFECTS	'),
                            TextFieldBlocBuilder(
                            textFieldBloc: formBloc.cond_otherdefect1,
                            keyboardType: TextInputType.multiline,
                            maxLines: 3,
                            decoration: const InputDecoration(
                              labelText: '1.',
                              prefixIcon: Icon(Icons.note_alt_rounded),
                            ),
                          ),
                            const Text('ROUTINE WORK DEFECTS	'),
                            TextFieldBlocBuilder(
                            textFieldBloc: formBloc.cond_routinedefect2,
                            keyboardType: TextInputType.multiline,
                            maxLines: 3,
                            decoration: const InputDecoration(
                              labelText: '2.',
                              prefixIcon: Icon(Icons.note_alt_rounded),
                            ),
                          ),
                             const Text('OTHER DEFECTS	'),
                            TextFieldBlocBuilder(
                            textFieldBloc: formBloc.cond_otherdefect2,
                            keyboardType: TextInputType.multiline,
                            maxLines: 3,
                            decoration: const InputDecoration(
                              labelText: '2.',
                              prefixIcon: Icon(Icons.note_alt_rounded),
                            ),
                          ),  
                            const Text('ROUTINE WORK DEFECTS	'),
                            TextFieldBlocBuilder(
                            textFieldBloc: formBloc.cond_routinedefect3,
                            keyboardType: TextInputType.multiline,
                            maxLines: 3,
                            decoration: const InputDecoration(
                              labelText: '3.',
                              prefixIcon: Icon(Icons.note_alt_rounded),
                            ),
                          ),   
                           const Text('OTHER DEFECTS	'),
                            TextFieldBlocBuilder(
                            textFieldBloc: formBloc.cond_otherdefect3,
                            keyboardType: TextInputType.multiline,
                            maxLines: 3,
                            decoration: const InputDecoration(
                              labelText: '3.',
                              prefixIcon: Icon(Icons.note_alt_rounded),
                            ),
                          ),          
                            const Text('ROUTINE WORK DEFECTS	'),
                            TextFieldBlocBuilder(
                            textFieldBloc: formBloc.cond_routinedefect4,
                            keyboardType: TextInputType.multiline,
                            maxLines: 3,
                            decoration: const InputDecoration(
                              labelText: '4.',
                              prefixIcon: Icon(Icons.note_alt_rounded),
                            ),
                          ), 
                            const Text('OTHER DEFECTS	'),
                            TextFieldBlocBuilder(
                            textFieldBloc: formBloc.cond_otherdefect4,
                            keyboardType: TextInputType.multiline,
                            maxLines: 3,
                            decoration: const InputDecoration(
                              labelText: '4.',
                              prefixIcon: Icon(Icons.note_alt_rounded),
                            ),
                          ),             

                      


                          //sini
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void formstructure() {
    formBloc!.submit;
  }
}

class SubmitForm extends StatelessWidget {
  const SubmitForm({super.key, required this.formBloc});
  final StructureSecondaryForm formBloc;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: formBloc.submit,
      child: const Text('SUBMIT'),
    );
  }
}

class LoadingDialog extends StatelessWidget {
  static void show(BuildContext context, {Key? key}) => showDialog<void>(
    context: context,
    useRootNavigator: false,
    barrierDismissible: false,
    builder: (_) => LoadingDialog(key: key),
  ).then((_) => FocusScope.of(context).requestFocus(FocusNode()));

  static void hide(BuildContext context) => Navigator.pop(context);

  const LoadingDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Center(
        child: Card(
          child: Container(
            width: 80,
            height: 80,
            padding: const EdgeInsets.all(12.0),
            child: const CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Icon(Icons.tag_faces, size: 100),
            const SizedBox(height: 10),
            const Text(
              'Success',
              style: TextStyle(fontSize: 54, color: Colors.black),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: () => Navigator.of(
                context,
              ).pushReplacement(MaterialPageRoute(builder: (_) => SizedBox())),
              icon: const Icon(Icons.replay),
              label: const Text('AGAIN'),
            ),
          ],
        ),
      ),
    );
  }
}

//  SUPERSTRUCTURE SECONDARY
//  - Deck Drainage
//  - Parapet or Railing
//  - Joints
//  - Abutment Approach
//  - Road Furniture
