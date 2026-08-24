import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class SubstructureForm extends FormBloc<String, String> {
  final conditionAfpSurroundsoil = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['Normal', 'Disturbed'],
    initialValue: 'Normal',
  );
  final severityLevelAfpSurroundsoil = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['0', '1', '2', '3'],
    initialValue: '0',
  );
  final extendedSvLevelAfpSurroundsoil = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['0', '1', '2', '3'],
    initialValue: '0',
  );
  final remarksAfpSurroundsoil = TextFieldBloc();
  //  ABUTMENT FOUNDATION & PILECAP - Condition of Surrrounding Soil

  final conditionAfpDisplacement = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['None', 'Detected'],
    initialValue: 'None',
  );
  final severityLevelAfpDisplacement = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['0', '1', '2', '3'],
    initialValue: '0',
  );
  final extendedSvLevelAfpDisplacement = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['0', '1', '2', '3'],
    initialValue: '0',
  );
  final remarksAfpDisplacement = TextFieldBloc();
  //  ABUTMENT FOUNDATION & PILECAP - Displacement

  final conditionAfpCracking = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['None', 'Minor', 'Moderate', 'Severe'],
    initialValue: 'None',
  );
  final severityLevelAfpCracking = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['0', '1', '2', '3'],
    initialValue: '0',
  );
  final extendedSvLevelAfpCracking = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['0', '1', '2', '3'],
    initialValue: '0',
  );
  final remarksAfpCracking = TextFieldBloc();
  //  ABUTMENT FOUNDATION & PILECAP - Cracking

  final conditionAfpSpalling = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['None', 'Minor', 'Moderate', 'Severe'],
    initialValue: 'None',
  );
  final severityLevelAfpSpalling = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['0', '1', '2', '3'],
    initialValue: '0',
  );
  final extendedSvLevelAfpSpalling = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['0', '1', '2', '3'],
    initialValue: '0',
  );
  final remarksAfpSpalling = TextFieldBloc();
  //  ABUTMENT FOUNDATION & PILECAP - Spalling

  final conditionAfpCorrosion = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['None', 'Minor', 'Moderate', 'Severe'],
    initialValue: 'None',
  );
  final severityLevelAfpCorrosion = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['0', '1', '2', '3'],
    initialValue: '0',
  );
  final extendedSvLevelAfpCorrosion = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['0', '1', '2', '3'],
    initialValue: '0',
  );
  final remarksAfpCorrosion = TextFieldBloc();
  //  ABUTMENT FOUNDATION & PILECAP - Corrosion

  final conditionAfpMaterialDg = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['None', 'Minor', 'Moderate', 'Severe'],
    initialValue: 'None',
  );
  final severityLevelAfpMaterialDg = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['0', '1', '2', '3'],
    initialValue: '0',
  );
  final extendedSvLevelAfpMaterialDg = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['0', '1', '2', '3'],
    initialValue: '0',
  );
  final remarksAfpMaterialDg = TextFieldBloc();
  //  ABUTMENT FOUNDATION & PILECAP - Material Degradation

  final afpOthers = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['No', 'Yes'],
    initialValue: 'No',
  );
  final conditionAfpOthers = TextFieldBloc();

  final severityLevelAfpOthers = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['0', '1', '2', '3'],
    initialValue: '0',
  );
  final extendedSvLevelAfpOthers = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['0', '1', '2', '3'],
    initialValue: '0',
  );
  final remarksAfpOthers = TextFieldBloc();

  final elementRatingAbutmentFdPilecap = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['0', '1', '2', '3'],
    initialValue: '0',
  );
//</ABUTMENT FOUNDATION & PILECAP>

  final conditionAbwDisplacement = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['None', 'Detected'],
    initialValue: 'None',
  );
  final severityLevelAbwDisplacement = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['0', '1', '2', '3'],
    initialValue: '0',
  );
  final extendedSvLevelAbwDisplacement = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['0', '1', '2', '3'],
    initialValue: '0',
  );
  final remarksAbwDisplacement = TextFieldBloc();
  //  ABUTMENT/WINGWALL - Displacement

  final conditionAbwCracking = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['None', 'Minor', 'Moderate', 'Severe'],
    initialValue: 'None',
  );
  final severityLevelAbwCracking = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['0', '1', '2', '3'],
    initialValue: '0',
  );
  final extendedSvLevelAbwCracking = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['0', '1', '2', '3'],
    initialValue: '0',
  );
  final remarksAbwCracking = TextFieldBloc();
  //  ABUTMENT/WINGWALL - Cracking

  final conditionAbwSpalling = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['None', 'Minor', 'Moderate', 'Severe'],
    initialValue: 'None',
  );
  final severityLevelAbwSpalling = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['0', '1', '2', '3'],
    initialValue: '0',
  );
  final extendedSvLevelAbwSpalling = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['0', '1', '2', '3'],
    initialValue: '0',
  );
  final remarksAbwSpalling = TextFieldBloc();
  //  ABUTMENT/WINGWALL - Spalling

  final conditionAbwCorrosion = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['None', 'Minor', 'Moderate', 'Severe'],
    initialValue: 'None',
  );
  final severityLevelAbwCorrosion = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['0', '1', '2', '3'],
    initialValue: '0',
  );
  final extendedSvLevelAbwCorrosion = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['0', '1', '2', '3'],
    initialValue: '0',
  );
  final remarksAbwCorrosion = TextFieldBloc();
  //  ABUTMENT/WINGWALL - Corrosion

  final conditionAbwMaterialDg = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['None', 'Minor', 'Moderate', 'Severe'],
    initialValue: 'None',
  );
  final severityLevelAbwMaterialDg = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['0', '1', '2', '3'],
    initialValue: '0',
  );
  final extendedSvLevelAbwMaterialDg = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['0', '1', '2', '3'],
    initialValue: '0',
  );
  final remarksAbwMaterialDg = TextFieldBloc();
  //  ABUTMENT/WINGWALL - Material Degradation

  final conditionAbwWeepholes = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['Clear', 'Partially Blocked', 'Blocked'],
    initialValue: 'Clear',
  );
  final severityLevelAbwWeepholes = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['0', '1', '2', '3'],
    initialValue: '0',
  );
  final extendedSvLevelAbwWeepholes = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['0', '1', '2', '3'],
    initialValue: '0',
  );
  final remarksAbwWeepholes = TextFieldBloc();
  //  ABUTMENT/WINGWALL - Weepholes

  final abwOthers = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['No', 'Yes'],
    initialValue: 'No',
  );
  final conditionAbwOthers = TextFieldBloc();

  final severityLevelAbwOthers = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['0', '1', '2', '3'],
    initialValue: '0',
  );
  final extendedSvLevelAbwOthers = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['0', '1', '2', '3'],
    initialValue: '0',
  );
  final remarksAbwOthers = TextFieldBloc();

  final elementRatingAbutmentWingwall = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['0', '1', '2', '3'],
    initialValue: '0',
  );
//</ABUTMENT WINGWALL>

  final conditionPierFdSurroundsoil = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['Normal', 'Disturbed'],
    initialValue: 'Normal',
  );
  final severityLevelPierFdSurroundsoil = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['0', '1', '2', '3'],
    initialValue: '0',
  );
  final extendedSvLevelPierFdSurroundsoil = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['0', '1', '2', '3'],
    initialValue: '0',
  );
  final remarksPierFdSurroundsoil = TextFieldBloc();
  //  PIER FOUNDATION & PILECAP - Condition of Surrounding Soil

  final conditionPierFdDisplacement = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['None', 'Detected'],
    initialValue: 'None',
  );
  final severityLevelPierFdDisplacement = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['0', '1', '2', '3'],
    initialValue: '0',
  );
  final extendedSvLevelPierFdDisplacement = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['0', '1', '2', '3'],
    initialValue: '0',
  );
  final remarksPierFdDisplacement = TextFieldBloc();
  //  PIER FOUNDATION & PILECAP - Displacement

  final conditionPierFdCracking = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['None', 'Minor', 'Moderate', 'Severe'],
    initialValue: 'None',
  );
  final severityLevelPierFdCracking = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['0', '1', '2', '3'],
    initialValue: '0',
  );
  final extendedSvLevelPierFdCracking = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['0', '1', '2', '3'],
    initialValue: '0',
  );
  final remarksPierFdCracking = TextFieldBloc();
  //  PIER Foundation & PILECAP - Cracking

  final conditionPierFdSpalling = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['None', 'Minor', 'Moderate', 'Severe'],
    initialValue: 'None',
  );
  final severityLevelPierFdSpalling = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['0', '1', '2', '3'],
    initialValue: '0',
  );
  final extendedSvLevelPierFdSpalling = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['0', '1', '2', '3'],
    initialValue: '0',
  );
  final remarksPierFdSpalling = TextFieldBloc();
  //  PIER FOUNDATION & PILECAP - Spalling

  final conditionPierFdCorrosion = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['None', 'Minor', 'Moderate', 'Severe'],
    initialValue: 'None',
  );
  final severityLevelPierFdCorrosion = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['0', '1', '2', '3'],
    initialValue: '0',
  );
  final extendedSvLevelPierFdCorrosion = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['0', '1', '2', '3'],
    initialValue: '0',
  );
  final remarksPierFdCorrosion = TextFieldBloc();
  //  PIER FOUNDATION & PILECAP - Corrosion

  final conditionPierFdMaterialDg = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['None', 'Minor', 'Moderate', 'Severe'],
    initialValue: 'None',
  );
  final severityLevelPierFdMaterialDg = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['0', '1', '2', '3'],
    initialValue: '0',
  );
  final extendedSvLevelPierFdMaterialDg = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['0', '1', '2', '3'],
    initialValue: '0',
  );
  final remarksPierFdMaterialDg = TextFieldBloc();
  //  PIER FOUNDATION & PILECAP - Material Degradation

  final pierfdOthers = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['No', 'Yes'],
    initialValue: 'No',
  );
  final conditionPierFdOthers = TextFieldBloc();

  final severityLevelPierFdOthers = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['0', '1', '2', '3'],
    initialValue: '0',
  );
  final extendedSvLevelPierFdOthers = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['0', '1', '2', '3'],
    initialValue: '0',
  );
  final remarksPierFdOthers = TextFieldBloc();

  final elementRatingPierFdPilecap = SelectFieldBloc(
    //validators: [FieldBlocValidators.required],
    items: ['0', '1', '2', '3'],
    initialValue: '0',
  );
//</PIER FOUNDATION & PILECAP>

  final conditionPiersDisplacement = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['None', 'Detected'],
    initialValue: 'None',
  );
  final severityLevelPiersDisplacement = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['0', '1', '2', '3'],
    initialValue: '0',
  );
  final extendedSvLevelPiersDisplacement = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['0', '1', '2', '3'],
    initialValue: '0',
  );
  final remarksPiersDisplacement = TextFieldBloc();
  //  PIERS - Displacement

  final conditionPiersCracking = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['None', 'Minor', 'Moderate', 'Severe'],
    initialValue: 'None',
  );
  final severityLevelPiersCracking = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['0', '1', '2', '3'],
    initialValue: '0',
  );
  final extendedSvLevelPiersCracking = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['0', '1', '2', '3'],
    initialValue: '0',
  );
  final remarksPiersCracking = TextFieldBloc();
  //  PIERS - Cracking

  final conditionPiersSpalling = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['None', 'Minor', 'Moderate', 'Severe'],
    initialValue: 'None',
  );
  final severityLevelPiersSpalling = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['0', '1', '2', '3'],
    initialValue: '0',
  );
  final extendedSvLevelPiersSpalling = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['0', '1', '2', '3'],
    initialValue: '0',
  );
  final remarksPiersSpalling = TextFieldBloc();
  //  PIERS - Spalling

  final conditionPiersCorrosion = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['None', 'Minor', 'Moderate', 'Severe'],
    initialValue: 'None',
  );
  final severityLevelPiersCorrosion = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['0', '1', '2', '3'],
    initialValue: '0',
  );
  final extendedSvLevelPiersCorrosion = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['0', '1', '2', '3'],
    initialValue: '0',
  );
  final remarksPiersCorrosion = TextFieldBloc();
  //  PIERS - Corrosion (Rebar)

  final conditionPiersMaterialDg = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['None', 'Minor', 'Moderate', 'Severe'],
    initialValue: 'None',
  );
  final severityLevelPiersMaterialDg = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['0', '1', '2', '3'],
    initialValue: '0',
  );
  final extendedSvLevelPiersMaterialDg = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['0', '1', '2', '3'],
    initialValue: '0',
  );
  final remarksPiersMaterialDg = TextFieldBloc();
  //  PIERS - Material Degradation

  final piersOthers = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['No', 'Yes'],
    initialValue: 'No',
  );
  final conditionPiersOthers = TextFieldBloc();

  final severityLevelPiersOthers = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['0', '1', '2', '3'],
    initialValue: '0',
  );
  final extendedSvLevelPiersOthers = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['0', '1', '2', '3'],
    initialValue: '0',
  );
  final remarksPiersOthers = TextFieldBloc();

  final elementRatingPiers = SelectFieldBloc(
    //validators: [FieldBlocValidators.required],
    items: ['0', '1', '2', '3'],
    initialValue: '0',
  );
//</PIERS>

  final conditionPiervScouring = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['None', 'Minor', 'Moderate', 'Severe'],
    initialValue: 'None',
  );
  final severityLevelPiervScouring = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['0', '1', '2', '3'],
    initialValue: '0',
  );
  final extendedSvLevelPiervScouring = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['0', '1', '2', '3'],
    initialValue: '0',
  );
  final remarksPiervScouring = TextFieldBloc();
  //  PIER IN RIVER - Scouring

  final conditionPiervDebris = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['None', 'Minor', 'Moderate', 'Severe'],
    initialValue: 'None',
  );
  final severityLevelPiervDebris = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['0', '1', '2', '3'],
    initialValue: '0',
  );
  final extendedSvLevelPiervDebris = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['0', '1', '2', '3'],
    initialValue: '0',
  );
  final remarksPiervDebris = TextFieldBloc();
  //  PIER IN RIVER - Accumulation of Debris

  final conditionPiervCracking = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['None', 'Minor', 'Moderate', 'Severe'],
    initialValue: 'None',
  );
  final severityLevelPiervCracking = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['0', '1', '2', '3'],
    initialValue: '0',
  );
  final extendedSvLevelPiervCracking = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['0', '1', '2', '3'],
    initialValue: '0',
  );
  final remarksPiervCracking = TextFieldBloc();
  //  PIER IN RIVER - Cracking

  final conditionPiervSpalling = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['None', 'Minor', 'Moderate', 'Severe'],
    initialValue: 'None',
  );
  final severityLevelPiervSpalling = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['0', '1', '2', '3'],
    initialValue: '0',
  );
  final extendedSvLevelPiervSpalling = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['0', '1', '2', '3'],
    initialValue: '0',
  );
  final remarksPiervSpalling = TextFieldBloc();
  //  PIER IN RIVER - Spalling

  final conditionPiervCorrosion = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['None', 'Minor', 'Moderate', 'Severe'],
    initialValue: 'None',
  );
  final severityLevelPiervCorrosion = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['0', '1', '2', '3'],
    initialValue: '0',
  );
  final extendedSvLevelPiervCorrosion = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['0', '1', '2', '3'],
    initialValue: '0',
  );
  final remarksPiervCorrosion = TextFieldBloc();
  //  PIER IN RIVER - Corrosion

  final conditionPiervMaterialDg = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['None', 'Minor', 'Moderate', 'Severe'],
    initialValue: 'None',
  );
  final severityLevelPiervMaterialDg = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['0', '1', '2', '3'],
    initialValue: '0',
  );
  final extendedSvLevelPiervMaterialDg = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['0', '1', '2', '3'],
    initialValue: '0',
  );
  final remarksPiervMaterialDg = TextFieldBloc();
  //  PIER FOUNDATION & PILECAP - Material Degradation

  final piervOthers = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['No', 'Yes'],
    initialValue: 'No',
  );
  final conditionPiervOthers = TextFieldBloc();

  final severityLevelPiervOthers = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['0', '1', '2', '3'],
    initialValue: '0',
  );
  final extendedSvLevelPiervOthers = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['0', '1', '2', '3'],
    initialValue: '0',
  );
  final remarksPiervOthers = TextFieldBloc();

  final elementRatingPieriver = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['0', '1', '2', '3'],
    initialValue: '0',
  );
//</PIER IN RIVER (if applicable)>

  final conditionSlriverDsgProtection = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['None', 'Minor', 'Moderate', 'Severe'],
    initialValue: 'None',
  );
  final severityLevelSlriverDsgProtection = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['0', '1', '2', '3'],
    initialValue: '0',
  );
  final extendedSvLevelSlriverDsgProtection = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['0', '1', '2', '3'],
    initialValue: '0',
  );
  final remarksSlriverDsgProtection = TextFieldBloc();
  //  SLOPE/RIVER BANK PROTECTION - Disintegration of Protection

  final conditionSlriverScouring = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['None', 'Minor', 'Moderate', 'Severe'],
    initialValue: 'None',
  );
  final severityLevelSlriverScouring = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['0', '1', '2', '3'],
    initialValue: '0',
  );
  final extendedSvLevelSlriverScouring = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['0', '1', '2', '3'],
    initialValue: '0',
  );
  final remarksSlriverScouring = TextFieldBloc();
  //  SLOPE/RIVER BANK PROTECTION - Scouring Behind Protection

  final conditionSlriverErosion = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['None', 'Minor', 'Moderate', 'Severe'],
    initialValue: 'None',
  );
  final severityLevelSlriverErosion = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['0', '1', '2', '3'],
    initialValue: '0',
  );
  final extendedSvLevelSlriverErosion = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['0', '1', '2', '3'],
    initialValue: '0',
  );
  final remarksSlriverErosion = TextFieldBloc();
  //  SLOPE/RIVER BANK PROTECTION -  Erosion Behind Protection Material

  final slriverOthers = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['No', 'Yes'],
    initialValue: 'No',
  );
  final conditionSlriverOthers = TextFieldBloc();

  final severityLevelSlriverOthers = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['0', '1', '2', '3'],
    initialValue: '0',
  );
  final extendedSvLevelSlriverOthers = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['0', '1', '2', '3'],
    initialValue: '0',
  );
  final remarksSlriverOthers = TextFieldBloc();

  final elementRatingSlopeRiverbank = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['0', '1', '2', '3'],
    initialValue: '0',
  );
//</SLOPE/RIVER BANK PROTECTION>

  final conditionPierptCracking = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['None', 'Minor', 'Moderate', 'Severe'],
    initialValue: 'None',
  );
  final severityLevelPierptCracking = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['0', '1', '2', '3'],
    initialValue: '0',
  );
  final extendedSvLevelPierptCracking = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['0', '1', '2', '3'],
    initialValue: '0',
  );
  final remarksPierptCracking = TextFieldBloc();
  //  PIERS PROTECTION - Cracking

  final conditionPierptSpalling = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['None', 'Minor', 'Moderate', 'Severe'],
    initialValue: 'None',
  );
  final severityLevelPierptSpalling = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['0', '1', '2', '3'],
    initialValue: '0',
  );
  final extendedSvLevelPierptSpalling = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['0', '1', '2', '3'],
    initialValue: '0',
  );
  final remarksPierptSpalling = TextFieldBloc();
  //  PIER IN RIVER - Spalling

  final conditionPierptCorrosion = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['None', 'Minor', 'Moderate', 'Severe'],
    initialValue: 'None',
  );
  final severityLevelPierptCorrosion = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['0', '1', '2', '3'],
    initialValue: '0',
  );
  final extendedSvLevelPierptCorrosion = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['0', '1', '2', '3'],
    initialValue: '0',
  );
  final remarksPierptCorrosion = TextFieldBloc();
  //  PIERS PROTECTION - Corrosion

  final pierptOthers = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['No', 'Yes'],
    initialValue: 'No',
  );
  final conditionPierptOthers = TextFieldBloc();

  final severityLevelPierptOthers = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['0', '1', '2', '3'],
    initialValue: '0',
  );
  final extendedSvLevelPierptOthers = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['0', '1', '2', '3'],
    initialValue: '0',
  );
  final remarksPierptOthers = TextFieldBloc();

  final elementRatingPiersProtection = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['0', '1', '2', '3'],
    initialValue: '0',
  );
//</PIERS PROTECTION>

  final conditionWaterwayBlc = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['Clear', 'Partially Blocked', 'Blocked'],
    initialValue: 'Clear',
  );
  final severityLevelWaterwayBlc = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['0', '1', '2', '3'],
    initialValue: '0',
  );
  final extendedSvLevelWaterwayBlc = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['0', '1', '2', '3'],
    initialValue: '0',
  );
  final remarksWaterwayBlc = TextFieldBloc();
  //  RIVER CHANNEL - Waterway Blockage

  final riverchnOthers = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['No', 'Yes'],
    initialValue: 'No',
  );
  final conditionRiverchnOthers = TextFieldBloc();

  final severityLevelRiverchnOthers = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['0', '1', '2', '3'],
    initialValue: '0',
  );
  final extendedSvLevelRiverchnOthers = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['0', '1', '2', '3'],
    initialValue: '0',
  );
  final remarksRiverchnOthers = TextFieldBloc();

  final elementRatingRiverChannel = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['0', '1', '2', '3'],
    initialValue: '0',
  );
//</RIVER CHANNEL>

  final showSecretField = BooleanFieldBloc();

  final secretField = TextFieldBloc(
    validators: [FieldBlocValidators.required],
  );

  SubstructureForm() {
    addFieldBlocs(
      fieldBlocs: [
        conditionAfpSurroundsoil,
        conditionAfpDisplacement,
        conditionAfpCracking,
        conditionAfpSpalling,
        conditionAfpCorrosion,
        conditionAfpMaterialDg,
        afpOthers,
        elementRatingAbutmentFdPilecap,
        //
        conditionAbwDisplacement,
        conditionAbwCracking,
        conditionAbwSpalling,
        conditionAbwCorrosion,
        conditionAbwMaterialDg,
        conditionAbwWeepholes,
        abwOthers,
        elementRatingAbutmentWingwall,
        //
        conditionPierFdSurroundsoil,
        conditionPierFdDisplacement,
        conditionPierFdCracking,
        conditionPierFdSpalling,
        conditionPierFdCorrosion,
        conditionPierFdMaterialDg,
        pierfdOthers,
        elementRatingPierFdPilecap,
        //
        conditionPiersDisplacement,
        conditionPiersCracking,
        conditionPiersSpalling,
        conditionPiersCorrosion,
        conditionPiersMaterialDg,
        piersOthers,
        elementRatingPiers,
        //
        conditionPiervScouring,
        conditionPiervDebris,
        conditionPiervCracking,
        conditionPiervSpalling,
        conditionPiervCorrosion,
        conditionPiervMaterialDg,
        piervOthers,
        elementRatingPieriver,
        //
        conditionSlriverDsgProtection,
        conditionSlriverScouring,
        conditionSlriverErosion,
        slriverOthers,
        elementRatingSlopeRiverbank,
        //
        conditionPierptCracking,
        conditionPierptSpalling,
        conditionPierptCorrosion,
        pierptOthers,
        elementRatingPiersProtection,
        //
        conditionWaterwayBlc,
        riverchnOthers,
        elementRatingRiverChannel,
      ],
    );

    // --------------- Abutment Foundation & Pilecap --------------- //
    conditionAfpSurroundsoil.onValueChanges(
      onData: (previous, current) async* {
        removeFieldBlocs(
          fieldBlocs: [
            severityLevelAfpSurroundsoil,
            extendedSvLevelAfpSurroundsoil,
            remarksAfpSurroundsoil,
          ],
        );

        if (current.value != 'Normal') {
          addFieldBlocs(fieldBlocs: [
            severityLevelAfpSurroundsoil,
            extendedSvLevelAfpSurroundsoil,
            remarksAfpSurroundsoil,
          ]);
        }
      },
    );

    conditionAfpDisplacement.onValueChanges(
      onData: (previous, current) async* {
        removeFieldBlocs(
          fieldBlocs: [
            severityLevelAfpDisplacement,
            extendedSvLevelAfpDisplacement,
            remarksAfpDisplacement,
          ],
        );

        if (current.value != 'None') {
          addFieldBlocs(fieldBlocs: [
            severityLevelAfpDisplacement,
            extendedSvLevelAfpDisplacement,
            remarksAfpDisplacement,
          ]);
        }
      },
    );

    conditionAfpCracking.onValueChanges(
      onData: (previous, current) async* {
        removeFieldBlocs(
          fieldBlocs: [
            severityLevelAfpCracking,
            extendedSvLevelAfpCracking,
            remarksAfpCracking
          ],
        );

        if (current.value != 'None') {
          addFieldBlocs(fieldBlocs: [
            severityLevelAfpCracking,
            extendedSvLevelAfpCracking,
            remarksAfpCracking
          ]);
        }
      },
    );

    conditionAfpSpalling.onValueChanges(
      onData: (previous, current) async* {
        removeFieldBlocs(
          fieldBlocs: [
            severityLevelAfpSpalling,
            extendedSvLevelAfpSpalling,
            remarksAfpSpalling,
          ],
        );

        if (current.value != 'None') {
          addFieldBlocs(fieldBlocs: [
            severityLevelAfpSpalling,
            extendedSvLevelAfpSpalling,
            remarksAfpSpalling,
          ]);
        }
      },
    );

    conditionAfpCorrosion.onValueChanges(
      onData: (previous, current) async* {
        removeFieldBlocs(
          fieldBlocs: [
            severityLevelAfpCorrosion,
            extendedSvLevelAfpCorrosion,
            remarksAfpCorrosion,
          ],
        );

        if (current.value != 'None') {
          addFieldBlocs(fieldBlocs: [
            severityLevelAfpCorrosion,
            extendedSvLevelAfpCorrosion,
            remarksAfpCorrosion,
          ]);
        }
      },
    );

    conditionAfpMaterialDg.onValueChanges(
      onData: (previous, current) async* {
        removeFieldBlocs(
          fieldBlocs: [
            severityLevelAfpMaterialDg,
            extendedSvLevelAfpMaterialDg,
            remarksAfpMaterialDg,
          ],
        );

        if (current.value != 'None') {
          addFieldBlocs(fieldBlocs: [
            severityLevelAfpMaterialDg,
            extendedSvLevelAfpMaterialDg,
            remarksAfpMaterialDg,
          ]);
        }
      },
    );

    afpOthers.onValueChanges(
      onData: (previous, current) async* {
        removeFieldBlocs(
          fieldBlocs: [
            conditionAfpOthers,
            severityLevelAfpOthers,
            extendedSvLevelAfpOthers,
            remarksAfpOthers,
          ],
        );

        if (current.value != 'No') {
          addFieldBlocs(fieldBlocs: [
            conditionAfpOthers,
            severityLevelAfpOthers,
            extendedSvLevelAfpOthers,
            remarksAfpOthers,
          ]);
        }
      },
    );

    // --------------- Abutment/Wingwall --------------- //
    conditionAbwDisplacement.onValueChanges(
      onData: (previous, current) async* {
        removeFieldBlocs(
          fieldBlocs: [
            severityLevelAbwDisplacement,
            extendedSvLevelAbwDisplacement,
            remarksAbwDisplacement,
          ],
        );

        if (current.value != 'None') {
          addFieldBlocs(fieldBlocs: [
            severityLevelAbwDisplacement,
            extendedSvLevelAbwDisplacement,
            remarksAbwDisplacement,
          ]);
        }
      },
    );

    conditionAbwCracking.onValueChanges(
      onData: (previous, current) async* {
        removeFieldBlocs(
          fieldBlocs: [
            conditionAbwCracking,
            severityLevelAbwCracking,
            extendedSvLevelAbwCracking,
            remarksAbwCracking,
          ],
        );

        if (current.value != 'None') {
          addFieldBlocs(fieldBlocs: [
            conditionAbwCracking,
            severityLevelAbwCracking,
            extendedSvLevelAbwCracking,
            remarksAbwCracking,
          ]);
        }
      },
    );

    conditionAbwSpalling.onValueChanges(
      onData: (previous, current) async* {
        removeFieldBlocs(
          fieldBlocs: [
            severityLevelAbwSpalling,
            extendedSvLevelAbwSpalling,
            remarksAbwSpalling,
          ],
        );

        if (current.value != 'None') {
          addFieldBlocs(fieldBlocs: [
            severityLevelAbwSpalling,
            extendedSvLevelAbwSpalling,
            remarksAbwSpalling,
          ]);
        }
      },
    );

    conditionAbwCorrosion.onValueChanges(
      onData: (previous, current) async* {
        removeFieldBlocs(
          fieldBlocs: [
            severityLevelAbwCorrosion,
            extendedSvLevelAbwCorrosion,
            remarksAbwCorrosion,
          ],
        );

        if (current.value != 'None') {
          addFieldBlocs(fieldBlocs: [
            severityLevelAbwCorrosion,
            extendedSvLevelAbwCorrosion,
            remarksAbwCorrosion,
          ]);
        }
      },
    );

    conditionAbwMaterialDg.onValueChanges(
      onData: (previous, current) async* {
        removeFieldBlocs(
          fieldBlocs: [
            severityLevelAbwMaterialDg,
            extendedSvLevelAbwMaterialDg,
            remarksAbwMaterialDg,
          ],
        );

        if (current.value != 'None') {
          addFieldBlocs(fieldBlocs: [
            severityLevelAbwMaterialDg,
            extendedSvLevelAbwMaterialDg,
            remarksAbwMaterialDg,
          ]);
        }
      },
    );

    conditionAbwWeepholes.onValueChanges(
      onData: (previous, current) async* {
        removeFieldBlocs(
          fieldBlocs: [
            severityLevelAbwWeepholes,
            extendedSvLevelAbwWeepholes,
            remarksAbwWeepholes,
          ],
        );

        if (current.value != 'Clear') {
          addFieldBlocs(fieldBlocs: [
            severityLevelAbwWeepholes,
            extendedSvLevelAbwWeepholes,
            remarksAbwWeepholes,
          ]);
        }
      },
    );

    abwOthers.onValueChanges(
      onData: (previous, current) async* {
        removeFieldBlocs(
          fieldBlocs: [
            conditionAbwOthers,
            severityLevelAbwOthers,
            extendedSvLevelAbwOthers,
            remarksAbwOthers,
          ],
        );

        if (current.value != 'No') {
          addFieldBlocs(fieldBlocs: [
            conditionAbwOthers,
            severityLevelAbwOthers,
            extendedSvLevelAbwOthers,
            remarksAbwOthers,
          ]);
        }
      },
    );

    // --------------- Pier Foundation & Pilecap --------------- //
    conditionPierFdSurroundsoil.onValueChanges(
      onData: (previous, current) async* {
        removeFieldBlocs(
          fieldBlocs: [
            severityLevelPierFdSurroundsoil,
            extendedSvLevelPierFdSurroundsoil,
            remarksPierFdSurroundsoil,
          ],
        );

        if (current.value != 'Normal') {
          addFieldBlocs(fieldBlocs: [
            severityLevelPierFdSurroundsoil,
            extendedSvLevelPierFdSurroundsoil,
            remarksPierFdSurroundsoil,
          ]);
        }
      },
    );

    conditionPierFdDisplacement.onValueChanges(
      onData: (previous, current) async* {
        removeFieldBlocs(
          fieldBlocs: [
            conditionPierFdDisplacement,
            extendedSvLevelPierFdDisplacement,
            remarksPierFdDisplacement,
          ],
        );

        if (current.value != 'None') {
          addFieldBlocs(fieldBlocs: [
            conditionPierFdDisplacement,
            extendedSvLevelPierFdDisplacement,
            remarksPierFdDisplacement,
          ]);
        }
      },
    );

    conditionPierFdCracking.onValueChanges(
      onData: (previous, current) async* {
        removeFieldBlocs(
          fieldBlocs: [
            severityLevelPierFdCracking,
            extendedSvLevelPierFdCracking,
            remarksPierFdCracking,
          ],
        );

        if (current.value != 'None') {
          addFieldBlocs(fieldBlocs: [
            severityLevelPierFdCracking,
            extendedSvLevelPierFdCracking,
            remarksPierFdCracking,
          ]);
        }
      },
    );

    conditionPierFdSpalling.onValueChanges(
      onData: (previous, current) async* {
        removeFieldBlocs(
          fieldBlocs: [
            severityLevelPierFdSpalling,
            extendedSvLevelPierFdSpalling,
            remarksPierFdSpalling,
          ],
        );

        if (current.value != 'None') {
          addFieldBlocs(fieldBlocs: [
            severityLevelPierFdSpalling,
            extendedSvLevelPierFdSpalling,
            remarksPierFdSpalling,
          ]);
        }
      },
    );

    conditionPierFdCorrosion.onValueChanges(
      onData: (previous, current) async* {
        removeFieldBlocs(
          fieldBlocs: [
            severityLevelPierFdCorrosion,
            extendedSvLevelPierFdCorrosion,
            remarksPierFdCorrosion,
          ],
        );

        if (current.value != 'None') {
          addFieldBlocs(fieldBlocs: [
            severityLevelPierFdCorrosion,
            extendedSvLevelPierFdCorrosion,
            remarksPierFdCorrosion,
          ]);
        }
      },
    );

    conditionPierFdMaterialDg.onValueChanges(
      onData: (previous, current) async* {
        removeFieldBlocs(
          fieldBlocs: [
            severityLevelPierFdMaterialDg,
            extendedSvLevelPierFdMaterialDg,
            remarksPierFdMaterialDg,
          ],
        );

        if (current.value != 'None') {
          addFieldBlocs(fieldBlocs: [
            severityLevelPierFdMaterialDg,
            extendedSvLevelPierFdMaterialDg,
            remarksPierFdMaterialDg,
          ]);
        }
      },
    );

    pierfdOthers.onValueChanges(
      onData: (previous, current) async* {
        removeFieldBlocs(
          fieldBlocs: [
            conditionPierFdOthers,
            severityLevelPierFdOthers,
            extendedSvLevelPierFdOthers,
            remarksPierFdOthers,
          ],
        );

        if (current.value != 'No') {
          addFieldBlocs(fieldBlocs: [
            conditionPierFdOthers,
            severityLevelPierFdOthers,
            extendedSvLevelPierFdOthers,
            remarksPierFdOthers,
          ]);
        }
      },
    );

    // --------------- Piers --------------- //
    conditionPiersDisplacement.onValueChanges(
      onData: (previous, current) async* {
        removeFieldBlocs(
          fieldBlocs: [
            severityLevelPiersDisplacement,
            extendedSvLevelPiersDisplacement,
            remarksPiersDisplacement,
          ],
        );

        if (current.value != 'None') {
          addFieldBlocs(fieldBlocs: [
            severityLevelPiersDisplacement,
            extendedSvLevelPiersDisplacement,
            remarksPiersDisplacement,
          ]);
        }
      },
    );

    conditionPiersCracking.onValueChanges(
      onData: (previous, current) async* {
        removeFieldBlocs(
          fieldBlocs: [
            severityLevelPiersCracking,
            extendedSvLevelPiersCracking,
            remarksPiersCracking,
          ],
        );

        if (current.value != 'None') {
          addFieldBlocs(fieldBlocs: [
            severityLevelPiersCracking,
            extendedSvLevelPiersCracking,
            remarksPiersCracking,
          ]);
        }
      },
    );

    conditionPiersSpalling.onValueChanges(
      onData: (previous, current) async* {
        removeFieldBlocs(
          fieldBlocs: [
            severityLevelPiersSpalling,
            extendedSvLevelPiersSpalling,
            remarksPiersSpalling,
          ],
        );

        if (current.value != 'None') {
          addFieldBlocs(fieldBlocs: [
            severityLevelPiersSpalling,
            extendedSvLevelPiersSpalling,
            remarksPiersSpalling,
          ]);
        }
      },
    );

    conditionPiersCorrosion.onValueChanges(
      onData: (previous, current) async* {
        removeFieldBlocs(
          fieldBlocs: [
            severityLevelPiersCorrosion,
            extendedSvLevelPiersCorrosion,
            remarksPiersCorrosion,
          ],
        );

        if (current.value != 'None') {
          addFieldBlocs(fieldBlocs: [
            severityLevelPiersCorrosion,
            extendedSvLevelPiersCorrosion,
            remarksPiersCorrosion,
          ]);
        }
      },
    );

    conditionPiersMaterialDg.onValueChanges(
      onData: (previous, current) async* {
        removeFieldBlocs(
          fieldBlocs: [
            severityLevelPiersMaterialDg,
            extendedSvLevelPiersMaterialDg,
            remarksPiersMaterialDg,
          ],
        );
        if (current.value != 'None') {
          addFieldBlocs(fieldBlocs: [
            severityLevelPiersMaterialDg,
            extendedSvLevelPiersMaterialDg,
            remarksPiersMaterialDg,
          ]);
        }
      },
    );

    piersOthers.onValueChanges(
      onData: (previous, current) async* {
        removeFieldBlocs(
          fieldBlocs: [
            conditionPiersOthers,
            severityLevelPiersOthers,
            extendedSvLevelPiersOthers,
            remarksPiersOthers,
          ],
        );

        if (current.value != 'No') {
          addFieldBlocs(fieldBlocs: [
            conditionPiersOthers,
            severityLevelPiersOthers,
            extendedSvLevelPiersOthers,
            remarksPiersOthers,
          ]);
        }
      },
    );

    // --------------- Pier in River --------------- //
    conditionPiervScouring.onValueChanges(
      onData: (previous, current) async* {
        removeFieldBlocs(
          fieldBlocs: [
            severityLevelPiervScouring,
            extendedSvLevelPiervScouring,
            remarksPiervScouring,
          ],
        );

        if (current.value != 'None') {
          addFieldBlocs(fieldBlocs: [
            severityLevelPiervScouring,
            extendedSvLevelPiervScouring,
            remarksPiervScouring,
          ]);
        }
      },
    );

    conditionPiervDebris.onValueChanges(
      onData: (previous, current) async* {
        removeFieldBlocs(
          fieldBlocs: [
            severityLevelPiervDebris,
            extendedSvLevelPiervDebris,
            remarksPiervDebris,
          ],
        );

        if (current.value != 'None') {
          addFieldBlocs(fieldBlocs: [
            severityLevelPiervDebris,
            extendedSvLevelPiervDebris,
            remarksPiervDebris,
          ]);
        }
      },
    );

    conditionPiervCracking.onValueChanges(
      onData: (previous, current) async* {
        removeFieldBlocs(
          fieldBlocs: [
            severityLevelPiervCracking,
            extendedSvLevelPiervCracking,
            remarksPiervCracking,
          ],
        );

        if (current.value != 'None') {
          addFieldBlocs(fieldBlocs: [
            severityLevelPiervCracking,
            extendedSvLevelPiervCracking,
            remarksPiervCracking,
          ]);
        }
      },
    );

    conditionPiervSpalling.onValueChanges(
      onData: (previous, current) async* {
        removeFieldBlocs(
          fieldBlocs: [
            severityLevelPiervSpalling,
            extendedSvLevelPiervSpalling,
            remarksPiervSpalling,
          ],
        );

        if (current.value != 'None') {
          addFieldBlocs(fieldBlocs: [
            severityLevelPiervSpalling,
            extendedSvLevelPiervSpalling,
            remarksPiervSpalling,
          ]);
        }
      },
    );

    conditionPiervCorrosion.onValueChanges(
      onData: (previous, current) async* {
        removeFieldBlocs(
          fieldBlocs: [
            severityLevelPiervCorrosion,
            extendedSvLevelPiervCorrosion,
            remarksPiervCorrosion,
          ],
        );
        if (current.value != 'None') {
          addFieldBlocs(fieldBlocs: [
            severityLevelPiervCorrosion,
            extendedSvLevelPiervCorrosion,
            remarksPiervCorrosion,
          ]);
        }
      },
    );

    conditionPiervMaterialDg.onValueChanges(
      onData: (previous, current) async* {
        removeFieldBlocs(
          fieldBlocs: [
            severityLevelPiervMaterialDg,
            extendedSvLevelPiervMaterialDg,
            remarksPiervMaterialDg,
          ],
        );
        if (current.value != 'None') {
          addFieldBlocs(fieldBlocs: [
            severityLevelPiervMaterialDg,
            extendedSvLevelPiervMaterialDg,
            remarksPiervMaterialDg,
          ]);
        }
      },
    );

    piervOthers.onValueChanges(
      onData: (previous, current) async* {
        removeFieldBlocs(
          fieldBlocs: [
            conditionPiervOthers,
            severityLevelPiervOthers,
            extendedSvLevelPiervOthers,
            remarksPiervOthers,
          ],
        );

        if (current.value != 'No') {
          addFieldBlocs(fieldBlocs: [
            conditionPiervOthers,
            severityLevelPiervOthers,
            extendedSvLevelPiervOthers,
            remarksPiervOthers,
          ]);
        }
      },
    );

    // --------------- Slope/River Bank Protection --------------- //
    conditionSlriverDsgProtection.onValueChanges(
      onData: (previous, current) async* {
        removeFieldBlocs(
          fieldBlocs: [
            severityLevelSlriverDsgProtection,
            extendedSvLevelSlriverDsgProtection,
            remarksSlriverDsgProtection,
          ],
        );

        if (current.value != 'None') {
          addFieldBlocs(fieldBlocs: [
            severityLevelSlriverDsgProtection,
            extendedSvLevelSlriverDsgProtection,
            remarksSlriverDsgProtection,
          ]);
        }
      },
    );

    conditionSlriverScouring.onValueChanges(
      onData: (previous, current) async* {
        removeFieldBlocs(
          fieldBlocs: [
            severityLevelSlriverScouring,
            extendedSvLevelSlriverScouring,
            remarksSlriverScouring,
          ],
        );

        if (current.value != 'None') {
          addFieldBlocs(fieldBlocs: [
            severityLevelSlriverScouring,
            extendedSvLevelSlriverScouring,
            remarksSlriverScouring,
          ]);
        }
      },
    );

    conditionSlriverErosion.onValueChanges(
      onData: (previous, current) async* {
        removeFieldBlocs(
          fieldBlocs: [
            severityLevelSlriverErosion,
            extendedSvLevelSlriverErosion,
            remarksSlriverErosion,
          ],
        );

        if (current.value != 'None') {
          addFieldBlocs(fieldBlocs: [
            severityLevelSlriverErosion,
            extendedSvLevelSlriverErosion,
            remarksSlriverErosion,
          ]);
        }
      },
    );

    slriverOthers.onValueChanges(
      onData: (previous, current) async* {
        removeFieldBlocs(
          fieldBlocs: [
            conditionSlriverOthers,
            severityLevelSlriverOthers,
            extendedSvLevelSlriverOthers,
            remarksSlriverOthers,
          ],
        );

        if (current.value != 'No') {
          addFieldBlocs(fieldBlocs: [
            conditionSlriverOthers,
            severityLevelSlriverOthers,
            extendedSvLevelSlriverOthers,
            remarksSlriverOthers,
          ]);
        }
      },
    );
    // --------------- Piers Protection --------------- //
    conditionPierptCracking.onValueChanges(
      onData: (previous, current) async* {
        removeFieldBlocs(
          fieldBlocs: [
            severityLevelPierptCracking,
            extendedSvLevelPierptCracking,
            remarksPierptCracking,
          ],
        );

        if (current.value != 'None') {
          addFieldBlocs(fieldBlocs: [
            severityLevelPierptCracking,
            extendedSvLevelPierptCracking,
            remarksPierptCracking,
          ]);
        }
      },
    );

    conditionPierptSpalling.onValueChanges(
      onData: (previous, current) async* {
        removeFieldBlocs(
          fieldBlocs: [
            severityLevelPierptSpalling,
            extendedSvLevelPierptSpalling,
            remarksPierptSpalling,
          ],
        );

        if (current.value != 'None') {
          addFieldBlocs(fieldBlocs: [
            severityLevelPierptSpalling,
            extendedSvLevelPierptSpalling,
            remarksPierptSpalling,
          ]);
        }
      },
    );

    conditionPierptCorrosion.onValueChanges(
      onData: (previous, current) async* {
        removeFieldBlocs(
          fieldBlocs: [
            severityLevelPierptCorrosion,
            extendedSvLevelPierptCorrosion,
            remarksPierptCorrosion,
          ],
        );

        if (current.value != 'None') {
          addFieldBlocs(fieldBlocs: [
            severityLevelPierptCorrosion,
            extendedSvLevelPierptCorrosion,
            remarksPierptCorrosion,
          ]);
        }
      },
    );

    pierptOthers.onValueChanges(
      onData: (previous, current) async* {
        removeFieldBlocs(
          fieldBlocs: [
            conditionPierptOthers,
            severityLevelPierptOthers,
            extendedSvLevelPierptOthers,
            remarksPierptOthers,
          ],
        );

        if (current.value != 'No') {
          addFieldBlocs(fieldBlocs: [
            conditionPierptOthers,
            severityLevelPierptOthers,
            extendedSvLevelPierptOthers,
            remarksPierptOthers,
          ]);
        }
      },
    );

    // --------------- River Channel --------------- //
    conditionWaterwayBlc.onValueChanges(
      onData: (previous, current) async* {
        removeFieldBlocs(
          fieldBlocs: [
            severityLevelWaterwayBlc,
            extendedSvLevelWaterwayBlc,
            remarksWaterwayBlc,
          ],
        );

        if (current.value != 'Clear') {
          addFieldBlocs(fieldBlocs: [
            severityLevelWaterwayBlc,
            extendedSvLevelWaterwayBlc,
            remarksWaterwayBlc,
          ]);
        }
      },
    );

    riverchnOthers.onValueChanges(
      onData: (previous, current) async* {
        removeFieldBlocs(
          fieldBlocs: [
            conditionRiverchnOthers,
            severityLevelRiverchnOthers,
            extendedSvLevelRiverchnOthers,
            remarksRiverchnOthers,
          ],
        );

        if (current.value != 'No') {
          addFieldBlocs(fieldBlocs: [
            conditionRiverchnOthers,
            severityLevelRiverchnOthers,
            extendedSvLevelRiverchnOthers,
            remarksRiverchnOthers,
          ]);
        }
      },
    );
  }

  @override
  Future<void> close() {
    // abutment foundation & pilecap
    remarksAfpSurroundsoil.close();
    remarksAfpDisplacement.close();
    remarksAfpCracking.close();
    remarksAfpSpalling.close();
    remarksAfpCorrosion.close();
    remarksAfpMaterialDg.close();
    remarksAfpOthers.close();
    // abutment/wingwall
    remarksAbwDisplacement.close();
    remarksAbwCracking.close();
    remarksAbwSpalling.close();
    remarksAbwCorrosion.close();
    remarksAbwMaterialDg.close();
    remarksAbwWeepholes.close();
    remarksAbwOthers.close();
    // pier foundation & pilecap
    remarksPierFdSurroundsoil.close();
    remarksPierFdDisplacement.close();
    remarksPierFdCracking.close();
    remarksPierFdSpalling.close();
    remarksPierFdCorrosion.close();
    remarksPierFdMaterialDg.close();
    remarksPierFdOthers.close();
    // piers
    remarksPiersDisplacement.close();
    remarksPiersCracking.close();
    remarksPiersSpalling.close();
    remarksPiersCorrosion.close();
    remarksPiersMaterialDg.close();
    remarksPierptOthers.close();
    // pier in river
    remarksPiervScouring.close();
    remarksPiervDebris.close();
    remarksPiervCracking.close();
    remarksPiervSpalling.close();
    remarksPiervCorrosion.close();
    remarksPiervMaterialDg.close();
    remarksPiervOthers.close();
    // slope/river bank protection
    remarksSlriverDsgProtection.close();
    remarksSlriverScouring.close();
    remarksSlriverErosion.close();
    remarksSlriverOthers.close();
    // piers protection
    remarksPierptCracking.close();
    remarksPierptSpalling.close();
    remarksPierptCorrosion.close();
    remarksPierptOthers.close();
    // river channel
    remarksWaterwayBlc.close();
    remarksRiverchnOthers.close();

    // afpOthers.close();
    // abwOthers.close();
    // pierfdOthers.close();
    // piervOthers.close();
    // slriverOthers.close();
    // pierptOthers.close();
    // riverchnOthers.close();

    return super.close();
  }

  @override
  void onSubmitting() async {
    print(conditionAfpSurroundsoil.value.toString());
    print(severityLevelAfpSurroundsoil.value.toString());
    print(extendedSvLevelAfpSurroundsoil.value.toString());
    print(remarksAfpSurroundsoil.value.toString());

    print(conditionAfpDisplacement.value.toString());
    print(severityLevelAfpDisplacement.value.toString());
    print(extendedSvLevelAfpDisplacement.value.toString());
    print(remarksAfpDisplacement.value.toString());

    print(conditionAfpCracking.value.toString());
    print(severityLevelAfpCracking.value.toString());
    print(extendedSvLevelAfpCracking.value.toString());
    print(remarksAfpCracking.value.toString());

    print(conditionAfpSpalling.value.toString());
    print(severityLevelAfpSpalling.value.toString());
    print(extendedSvLevelAfpSpalling.value.toString());
    print(remarksAfpSpalling.value.toString());

    print(conditionAfpCorrosion.value.toString());
    print(severityLevelAfpCorrosion.value.toString());
    print(extendedSvLevelAfpCorrosion.value.toString());
    print(remarksAfpCorrosion.value.toString());

    print(conditionAfpMaterialDg.value.toString());
    print(severityLevelAfpMaterialDg.value.toString());
    print(extendedSvLevelAfpMaterialDg.value.toString());
    print(remarksAfpMaterialDg.value.toString());

    print(afpOthers.value.toString());
    print(conditionAfpOthers.value.toString());
    print(severityLevelAfpOthers.value.toString());
    print(extendedSvLevelAfpOthers.value.toString());
    print(remarksAfpOthers.value.toString());

    print(elementRatingAbutmentFdPilecap.value.toString());
    // abutment foundation pilecap

    print(conditionAbwDisplacement.value.toString());
    print(severityLevelAbwDisplacement.value.toString());
    print(extendedSvLevelAbwDisplacement.value.toString());
    print(remarksAbwDisplacement.value.toString());

    print(conditionAbwCracking.value.toString());
    print(severityLevelAbwCracking.value.toString());
    print(extendedSvLevelAbwCracking.value.toString());
    print(remarksAbwCracking.value.toString());

    print(conditionAbwSpalling.value.toString());
    print(severityLevelAbwSpalling.value.toString());
    print(extendedSvLevelAbwSpalling.value.toString());
    print(remarksAbwSpalling.value.toString());

    print(conditionAbwCorrosion.value.toString());
    print(severityLevelAbwCorrosion.value.toString());
    print(extendedSvLevelAbwCorrosion.value.toString());
    print(remarksAbwCorrosion.value.toString());

    print(conditionAbwMaterialDg.value.toString());
    print(severityLevelAbwMaterialDg.value.toString());
    print(extendedSvLevelAbwMaterialDg.value.toString());
    print(remarksAbwMaterialDg.value.toString());

    print(conditionAbwWeepholes.value.toString());
    print(severityLevelAbwWeepholes.value.toString());
    print(extendedSvLevelAbwWeepholes.value.toString());
    print(remarksAbwWeepholes.value.toString());

    print(abwOthers.value.toString());
    print(conditionAbwOthers.value.toString());
    print(severityLevelAbwOthers.value.toString());
    print(extendedSvLevelAbwOthers.value.toString());
    print(remarksAbwOthers.value.toString());

    print(elementRatingAbutmentWingwall.value.toString());
    // abutment wingwall

    print(conditionPierFdSurroundsoil.value.toString());
    print(severityLevelPierFdSurroundsoil.value.toString());
    print(extendedSvLevelPierFdSurroundsoil.value.toString());
    print(remarksPierFdSurroundsoil.value.toString());

    print(conditionPierFdDisplacement.value.toString());
    print(severityLevelPierFdDisplacement.value.toString());
    print(extendedSvLevelPierFdDisplacement.value.toString());
    print(remarksPierFdDisplacement.value.toString());

    print(conditionPierFdCracking.value.toString());
    print(severityLevelPierFdCracking.value.toString());
    print(extendedSvLevelPierFdCracking.value.toString());
    print(remarksPierFdCracking.value.toString());

    print(conditionPierFdSpalling.value.toString());
    print(severityLevelPierFdSpalling.value.toString());
    print(extendedSvLevelPierFdSpalling.value.toString());
    print(remarksPierFdSpalling.value.toString());

    print(conditionPierFdCorrosion.value.toString());
    print(severityLevelPierFdCorrosion.value.toString());
    print(extendedSvLevelPierFdCorrosion.value.toString());
    print(remarksPierFdCorrosion.value.toString());

    print(conditionPierFdMaterialDg.value.toString());
    print(severityLevelPierFdMaterialDg.value.toString());
    print(extendedSvLevelPierFdMaterialDg.value.toString());
    print(remarksPierFdMaterialDg.value.toString());

    print(pierfdOthers.value.toString());
    print(conditionPierFdOthers.value.toString());
    print(severityLevelPierFdOthers.value.toString());
    print(extendedSvLevelPierFdOthers.value.toString());
    print(remarksPierFdOthers.value.toString());

    print(elementRatingPierFdPilecap.value.toString());
    // pier foundation & pilecap

    print(conditionPiersDisplacement.value.toString());
    print(severityLevelPiersDisplacement.value.toString());
    print(extendedSvLevelPiersDisplacement.value.toString());
    print(remarksPiersDisplacement.value.toString());

    print(conditionPiersCracking.value.toString());
    print(severityLevelPiersCracking.value.toString());
    print(extendedSvLevelPiersCracking.value.toString());
    print(remarksPiersCracking.value.toString());

    print(conditionPiersSpalling.value.toString());
    print(severityLevelPiersSpalling.value.toString());
    print(extendedSvLevelPiersSpalling.value.toString());
    print(remarksPiersSpalling.value.toString());

    print(conditionPiersCorrosion.value.toString());
    print(severityLevelPiersCorrosion.value.toString());
    print(extendedSvLevelPiersCorrosion.value.toString());
    print(remarksPiersCorrosion.value.toString());

    print(conditionPiersMaterialDg.value.toString());
    print(severityLevelPiersMaterialDg.value.toString());
    print(extendedSvLevelPiersMaterialDg.value.toString());
    print(remarksPiersMaterialDg.value.toString());

    print(piersOthers.value.toString());
    print(conditionPiersOthers.value.toString());
    print(severityLevelPiersOthers.value.toString());
    print(extendedSvLevelPiersOthers.value.toString());
    print(remarksPiersOthers.value.toString());

    print(elementRatingPiers.value.toString());
    // piers

    print(conditionPiervScouring.value.toString());
    print(severityLevelPiervScouring.value.toString());
    print(extendedSvLevelPiervScouring.value.toString());
    print(remarksPiervScouring.value.toString());

    print(conditionPiervDebris.value.toString());
    print(severityLevelPiervDebris.value.toString());
    print(extendedSvLevelPiervDebris.value.toString());
    print(remarksPiervDebris.value.toString());

    print(conditionPiervCracking.value.toString());
    print(severityLevelPiervCracking.value.toString());
    print(extendedSvLevelPiervCracking.value.toString());
    print(remarksPiervCracking.value.toString());

    print(conditionPiervSpalling.value.toString());
    print(severityLevelPiervSpalling.value.toString());
    print(extendedSvLevelPiervSpalling.value.toString());
    print(remarksPiervSpalling.value.toString());

    print(conditionPiervCorrosion.value.toString());
    print(severityLevelPiervCorrosion.value.toString());
    print(extendedSvLevelPiervCorrosion.value.toString());
    print(remarksPiervCorrosion.value.toString());

    print(conditionPiervMaterialDg.value.toString());
    print(severityLevelPiervMaterialDg.value.toString());
    print(extendedSvLevelPiervMaterialDg.value.toString());
    print(remarksPiervMaterialDg.value.toString());

    print(piervOthers.value.toString());
    print(conditionPiervOthers.value.toString());
    print(severityLevelPiervOthers.value.toString());
    print(extendedSvLevelPiervOthers.value.toString());
    print(remarksPiervOthers.value.toString());

    print(elementRatingPieriver.value.toString());
    // Pier in river

    print(conditionSlriverDsgProtection.value.toString());
    print(severityLevelSlriverDsgProtection.value.toString());
    print(extendedSvLevelSlriverDsgProtection.value.toString());
    print(remarksSlriverDsgProtection.value.toString());

    print(conditionSlriverScouring.value.toString());
    print(severityLevelSlriverScouring.value.toString());
    print(extendedSvLevelSlriverScouring.value.toString());
    print(remarksSlriverScouring.value.toString());

    print(conditionSlriverErosion.value.toString());
    print(severityLevelSlriverErosion.value.toString());
    print(extendedSvLevelSlriverErosion.value.toString());
    print(remarksSlriverErosion.value.toString());
    // Slope/River Bank Protection

    print(conditionPierptCracking.value.toString());
    print(severityLevelPierptCracking.value.toString());
    print(extendedSvLevelPierptCracking.value.toString());
    print(remarksPierptCracking.value.toString());

    print(conditionPierptSpalling.value.toString());
    print(severityLevelPierptSpalling.value.toString());
    print(extendedSvLevelPierptSpalling.value.toString());
    print(remarksPierptSpalling.value.toString());

    print(conditionPierptCorrosion.value.toString());
    print(severityLevelPierptCorrosion.value.toString());
    print(extendedSvLevelPierptCorrosion.value.toString());
    print(remarksPierptCorrosion.value.toString());

    print(pierptOthers.value.toString());
    print(conditionPierptOthers.value.toString());
    print(severityLevelPierptOthers.value.toString());
    print(extendedSvLevelPierptOthers.value.toString());
    print(remarksPierptOthers.value.toString());

    print(elementRatingPiersProtection.value.toString());
    // Piers Protection

    print(conditionWaterwayBlc.value.toString());
    print(severityLevelWaterwayBlc.value.toString());
    print(extendedSvLevelWaterwayBlc.value.toString());
    print(remarksWaterwayBlc.value.toString());

    print(riverchnOthers.value.toString());
    print(conditionRiverchnOthers.value.toString());
    print(severityLevelRiverchnOthers.value.toString());
    print(extendedSvLevelRiverchnOthers.value.toString());
    print(remarksRiverchnOthers.value.toString());

    print(elementRatingRiverChannel.value.toString());
    // River Channel
    // try {
    //   await Future<void>.delayed(const Duration(milliseconds: 500));

    //   emitSuccess();
    // } catch (e) {
    //   emitFailure();
    // }
  }
}

class SubstructureTab extends StatelessWidget {
  SubstructureTab({super.key});
  SubstructureForm? formBloc;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 2000,
      child: BlocProvider(
        create: (context) => SubstructureForm(),
        child: Builder(
          builder: (context) {
            final formBloc = BlocProvider.of<SubstructureForm>(context);

            return Theme(
              data: Theme.of(context).copyWith(
                inputDecorationTheme: InputDecorationTheme(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              child: Scaffold(
                body: FormBlocListener<SubstructureForm, String, String>(
                  child: SingleChildScrollView(
                    physics: const ClampingScrollPhysics(),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          //
                          const Text(
                            'Abutment Foundation & Pilecap',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          const Text('Condition of Surrounding Soil'),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.conditionAfpSurroundsoil,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Condition of Severity',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc:
                                formBloc.severityLevelAfpSurroundsoil,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Severity Level',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc:
                                formBloc.extendedSvLevelAfpSurroundsoil,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Extended Severity Level',
                              prefixIcon: SizedBox(),
                            ),
                          ),

                          TextFieldBlocBuilder(
                            textFieldBloc: formBloc.remarksAfpSurroundsoil,
                            keyboardType: TextInputType.multiline,
                            maxLines: 3,
                            decoration: const InputDecoration(
                              labelText: 'Remarks',
                              prefixIcon: Icon(Icons.note_alt_rounded),
                            ),
                          ),
                          //
                          const Text('Displacement'),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.conditionAfpDisplacement,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Condition of Severity',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc:
                                formBloc.severityLevelAfpDisplacement,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Severity Level',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc:
                                formBloc.extendedSvLevelAfpDisplacement,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Extended Severity Level',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          TextFieldBlocBuilder(
                            textFieldBloc: formBloc.remarksAfpDisplacement,
                            keyboardType: TextInputType.multiline,
                            maxLines: 3,
                            decoration: const InputDecoration(
                              labelText: 'Remarks',
                              prefixIcon: Icon(Icons.note_alt_rounded),
                            ),
                          ),
                          //
                          const Text('Cracking (Concrete)'),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.conditionAfpCracking,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Condition of Severity',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.severityLevelAfpCracking,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Severity Level',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc:
                                formBloc.extendedSvLevelAfpCracking,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Extended Severity Level',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          TextFieldBlocBuilder(
                            textFieldBloc: formBloc.remarksAfpCracking,
                            keyboardType: TextInputType.multiline,
                            maxLines: 3,
                            decoration: const InputDecoration(
                              labelText: 'Remarks',
                              prefixIcon: Icon(Icons.note_alt_rounded),
                            ),
                          ),
                          //
                          const Text('Spalling'),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.conditionAfpSpalling,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Condition of Severity',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.severityLevelAfpSpalling,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Severity Level',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc:
                                formBloc.extendedSvLevelAfpSpalling,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Extended Severity Level',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          TextFieldBlocBuilder(
                            textFieldBloc: formBloc.remarksAfpSpalling,
                            keyboardType: TextInputType.multiline,
                            maxLines: 3,
                            decoration: const InputDecoration(
                              labelText: 'Remarks',
                              prefixIcon: Icon(Icons.note_alt_rounded),
                            ),
                          ),
                          //
                          const Text('Corrosion (Rebar)'),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.conditionAfpCorrosion,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Condition of Severity',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.severityLevelAfpCorrosion,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Severity Level',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc:
                                formBloc.extendedSvLevelAfpCorrosion,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Extended Severity Level',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          TextFieldBlocBuilder(
                            textFieldBloc: formBloc.remarksAfpCorrosion,
                            keyboardType: TextInputType.multiline,
                            maxLines: 3,
                            decoration: const InputDecoration(
                              labelText: 'Remarks',
                              prefixIcon: Icon(Icons.note_alt_rounded),
                            ),
                          ),
                          //
                          const Text('Material Degradation'),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.conditionAfpMaterialDg,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Condition of Severity',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc:
                                formBloc.severityLevelAfpMaterialDg,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Severity Level',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc:
                                formBloc.extendedSvLevelAfpMaterialDg,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Extended Severity Level',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          TextFieldBlocBuilder(
                            textFieldBloc: formBloc.remarksAfpMaterialDg,
                            keyboardType: TextInputType.multiline,
                            maxLines: 3,
                            decoration: const InputDecoration(
                              labelText: 'Remarks',
                              prefixIcon: Icon(Icons.note_alt_rounded),
                            ),
                          ),

                          const Text('Abutment Foundation & Pilecap (Others)'),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.afpOthers,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Is there any other condition? ',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          TextFieldBlocBuilder(
                            textFieldBloc: formBloc.conditionAfpOthers,
                            keyboardType: TextInputType.multiline,
                            maxLines: 3,
                            decoration: const InputDecoration(
                              labelText: 'Please state the condition (if any)',
                              prefixIcon: Icon(Icons.note_alt_rounded),
                            ),
                          ),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.severityLevelAfpOthers,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Severity Level',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.extendedSvLevelAfpOthers,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Extended Severity Level',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          TextFieldBlocBuilder(
                            textFieldBloc: formBloc.remarksAfpOthers,
                            keyboardType: TextInputType.multiline,
                            maxLines: 3,
                            decoration: const InputDecoration(
                              labelText: 'Remarks',
                              prefixIcon: Icon(Icons.note_alt_rounded),
                            ),
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc:
                                formBloc.elementRatingAbutmentFdPilecap,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Element Rating',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          //</Abutment Foundation & Pilecap>

                          const Text(
                            'Abutment/Wingwall',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          const Text('Displacement'),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.conditionAbwDisplacement,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Condition of Severity',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc:
                                formBloc.severityLevelAbwDisplacement,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Severity Level',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc:
                                formBloc.extendedSvLevelAbwDisplacement,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Extended Severity Level',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          TextFieldBlocBuilder(
                            textFieldBloc: formBloc.remarksAbwDisplacement,
                            keyboardType: TextInputType.multiline,
                            maxLines: 3,
                            decoration: const InputDecoration(
                              labelText: 'Remarks',
                              prefixIcon: Icon(Icons.note_alt_rounded),
                            ),
                          ),
                          //
                          const Text('Cracking (Concrete)'),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.conditionAbwCracking,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Condition of Severity',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.severityLevelAbwCracking,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Severity Level',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc:
                                formBloc.extendedSvLevelAbwCracking,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Extended Severity Level',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          TextFieldBlocBuilder(
                            textFieldBloc: formBloc.remarksAbwCracking,
                            keyboardType: TextInputType.multiline,
                            maxLines: 3,
                            decoration: const InputDecoration(
                              labelText: 'Remarks',
                              prefixIcon: Icon(Icons.note_alt_rounded),
                            ),
                          ),
                          //
                          const Text('Spalling'),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.conditionAbwSpalling,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Condition of Severity',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.severityLevelAbwSpalling,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Severity Level',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc:
                                formBloc.extendedSvLevelAbwSpalling,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Extended Severity Level',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          TextFieldBlocBuilder(
                            textFieldBloc: formBloc.remarksAbwSpalling,
                            keyboardType: TextInputType.multiline,
                            maxLines: 3,
                            decoration: const InputDecoration(
                              labelText: 'Remarks',
                              prefixIcon: Icon(Icons.note_alt_rounded),
                            ),
                          ),
                          //
                          const Text('Corrosion (Rebar)'),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.conditionAbwCorrosion,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Condition of Severity',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.severityLevelAbwCorrosion,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Severity Level',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc:
                                formBloc.extendedSvLevelAbwCorrosion,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Extended Severity Level',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          TextFieldBlocBuilder(
                            textFieldBloc: formBloc.remarksAbwCorrosion,
                            keyboardType: TextInputType.multiline,
                            maxLines: 3,
                            decoration: const InputDecoration(
                              labelText: 'Remarks',
                              prefixIcon: Icon(Icons.note_alt_rounded),
                            ),
                          ),
                          //
                          const Text('Material Degradation'),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.conditionAbwMaterialDg,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Condition of Severity',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc:
                                formBloc.severityLevelAbwMaterialDg,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Severity Level',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc:
                                formBloc.extendedSvLevelAbwMaterialDg,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Extended Severity Level',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          TextFieldBlocBuilder(
                            textFieldBloc: formBloc.remarksAbwMaterialDg,
                            keyboardType: TextInputType.multiline,
                            maxLines: 3,
                            decoration: const InputDecoration(
                              labelText: 'Remarks',
                              prefixIcon: Icon(Icons.note_alt_rounded),
                            ),
                          ),
                          //
                          const Text('Weepholes'),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.conditionAbwWeepholes,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Condition of Severity',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.severityLevelAbwWeepholes,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Severity Level',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc:
                                formBloc.extendedSvLevelAbwWeepholes,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Extended Severity Level',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          TextFieldBlocBuilder(
                            textFieldBloc: formBloc.remarksAbwWeepholes,
                            keyboardType: TextInputType.multiline,
                            maxLines: 3,
                            decoration: const InputDecoration(
                              labelText: 'Remarks',
                              prefixIcon: Icon(Icons.note_alt_rounded),
                            ),
                          ),

                          const Text('Abutment/Wingwall (Others)'),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.abwOthers,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Is there any other condition? ',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          TextFieldBlocBuilder(
                            textFieldBloc: formBloc.conditionAbwOthers,
                            keyboardType: TextInputType.multiline,
                            maxLines: 3,
                            decoration: const InputDecoration(
                              labelText: 'Please state the condition (if any)',
                              prefixIcon: Icon(Icons.note_alt_rounded),
                            ),
                          ),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.severityLevelAbwOthers,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Severity Level',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.extendedSvLevelAbwOthers,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Extended Severity Level',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          TextFieldBlocBuilder(
                            textFieldBloc: formBloc.remarksAbwOthers,
                            keyboardType: TextInputType.multiline,
                            maxLines: 3,
                            decoration: const InputDecoration(
                              labelText: 'Remarks',
                              prefixIcon: Icon(Icons.note_alt_rounded),
                            ),
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc:
                                formBloc.elementRatingAbutmentWingwall,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Element Rating',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          //<Abutment/Wingeall> Displacement, Cracking (Concrete), Spalling, Corrosion (Rebar), Material Degadation, Weepholes, Others

                          const Text(
                            'Pier Foundation & Pilecap',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          const Text('Condition of Surrounding Soil'),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc:
                                formBloc.conditionPierFdSurroundsoil,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Condition of Severity',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc:
                                formBloc.severityLevelPierFdSurroundsoil,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Severity Level',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc:
                                formBloc.extendedSvLevelPierFdSurroundsoil,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Extended Severity Level',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          TextFieldBlocBuilder(
                            textFieldBloc: formBloc.remarksPierFdSurroundsoil,
                            keyboardType: TextInputType.multiline,
                            maxLines: 3,
                            decoration: const InputDecoration(
                              labelText: 'Remarks',
                              prefixIcon: Icon(Icons.note_alt_rounded),
                            ),
                          ),
                          //
                          const Text('Displacement'),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc:
                                formBloc.conditionPierFdDisplacement,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Condition of Severity',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc:
                                formBloc.severityLevelPierFdDisplacement,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Severity Level',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc:
                                formBloc.extendedSvLevelPierFdDisplacement,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Extended Severity Level',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          TextFieldBlocBuilder(
                            textFieldBloc: formBloc.remarksPierFdDisplacement,
                            keyboardType: TextInputType.multiline,
                            maxLines: 3,
                            decoration: const InputDecoration(
                              labelText: 'Remarks',
                              prefixIcon: Icon(Icons.note_alt_rounded),
                            ),
                          ),
                          //
                          const Text('Cracking (Concrete)'),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.conditionPierFdCracking,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Condition of Severity',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc:
                                formBloc.severityLevelPierFdCracking,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Severity Level',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc:
                                formBloc.extendedSvLevelPierFdCracking,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Extended Severity Level',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          TextFieldBlocBuilder(
                            textFieldBloc: formBloc.remarksPierFdCracking,
                            keyboardType: TextInputType.multiline,
                            maxLines: 3,
                            decoration: const InputDecoration(
                              labelText: 'Remarks',
                              prefixIcon: Icon(Icons.note_alt_rounded),
                            ),
                          ),
                          //
                          const Text('Spalling'),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.conditionPierFdSpalling,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Condition of Severity',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc:
                                formBloc.severityLevelPierFdSpalling,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Severity Level',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc:
                                formBloc.extendedSvLevelPierFdSpalling,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Extended Severity Level',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          TextFieldBlocBuilder(
                            textFieldBloc: formBloc.remarksPierFdSpalling,
                            keyboardType: TextInputType.multiline,
                            maxLines: 3,
                            decoration: const InputDecoration(
                              labelText: 'Remarks',
                              prefixIcon: Icon(Icons.note_alt_rounded),
                            ),
                          ),
                          //
                          const Text('Corrosion (Rebar)'),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.conditionPierFdCorrosion,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Condition of Severity',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc:
                                formBloc.severityLevelPierFdCorrosion,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Severity Level',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc:
                                formBloc.extendedSvLevelPierFdCorrosion,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Extended Severity Level',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          TextFieldBlocBuilder(
                            textFieldBloc: formBloc.remarksPierFdCorrosion,
                            keyboardType: TextInputType.multiline,
                            maxLines: 3,
                            decoration: const InputDecoration(
                              labelText: 'Remarks',
                              prefixIcon: Icon(Icons.note_alt_rounded),
                            ),
                          ),
                          //
                          const Text('Material Degradation'),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.conditionPierFdMaterialDg,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Condition of Severity',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc:
                                formBloc.severityLevelPierFdMaterialDg,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Severity Level',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc:
                                formBloc.extendedSvLevelPierFdMaterialDg,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Extended Severity Level',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          TextFieldBlocBuilder(
                            textFieldBloc: formBloc.remarksPierFdMaterialDg,
                            keyboardType: TextInputType.multiline,
                            maxLines: 3,
                            decoration: const InputDecoration(
                              labelText: 'Remarks',
                              prefixIcon: Icon(Icons.note_alt_rounded),
                            ),
                          ),

                          const Text('Pier Foundation & Pilecap (Others)'),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.pierfdOthers,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Is there any other condition? ',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          TextFieldBlocBuilder(
                            textFieldBloc: formBloc.conditionPierFdOthers,
                            keyboardType: TextInputType.multiline,
                            maxLines: 3,
                            decoration: const InputDecoration(
                              labelText: 'Please state the condition (if any)',
                              prefixIcon: Icon(Icons.note_alt_rounded),
                            ),
                          ),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.severityLevelPierFdOthers,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Severity Level',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc:
                                formBloc.extendedSvLevelPierFdOthers,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Extended Severity Level',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          TextFieldBlocBuilder(
                            textFieldBloc: formBloc.remarksPierFdOthers,
                            keyboardType: TextInputType.multiline,
                            maxLines: 3,
                            decoration: const InputDecoration(
                              labelText: 'Remarks',
                              prefixIcon: Icon(Icons.note_alt_rounded),
                            ),
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc:
                                formBloc.elementRatingPierFdPilecap,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Element Rating',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          //  </PIER FOUNDATION & PILECAP>

                          const Text(
                            'Piers',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          const Text('Displacement'),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc:
                                formBloc.conditionPiersDisplacement,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Condition of Severity',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc:
                                formBloc.severityLevelPiersDisplacement,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Severity Level',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc:
                                formBloc.extendedSvLevelPiersDisplacement,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Extended Severity Level',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          TextFieldBlocBuilder(
                            textFieldBloc: formBloc.remarksPiersDisplacement,
                            keyboardType: TextInputType.multiline,
                            maxLines: 3,
                            decoration: const InputDecoration(
                              labelText: 'Remarks',
                              prefixIcon: Icon(Icons.note_alt_rounded),
                            ),
                          ),
                          //
                          const Text('Cracking (Concrete)'),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.conditionPiersCracking,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Condition of Severity',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc:
                                formBloc.severityLevelPiersCracking,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Severity Level',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc:
                                formBloc.extendedSvLevelPiersCracking,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Extended Severity Level',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          TextFieldBlocBuilder(
                            textFieldBloc: formBloc.remarksPiersCracking,
                            keyboardType: TextInputType.multiline,
                            maxLines: 3,
                            decoration: const InputDecoration(
                              labelText: 'Remarks',
                              prefixIcon: Icon(Icons.note_alt_rounded),
                            ),
                          ),
                          //
                          const Text('Spalling'),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.conditionPiersSpalling,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Condition of Severity',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc:
                                formBloc.severityLevelPiersSpalling,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Severity Level',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc:
                                formBloc.extendedSvLevelPiersSpalling,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Extended Severity Level',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          TextFieldBlocBuilder(
                            textFieldBloc: formBloc.remarksPiersSpalling,
                            keyboardType: TextInputType.multiline,
                            maxLines: 3,
                            decoration: const InputDecoration(
                              labelText: 'Remarks',
                              prefixIcon: Icon(Icons.note_alt_rounded),
                            ),
                          ),

                          const Text('Corrosion (Rebar)'),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.conditionPiersCorrosion,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Condition of Severity',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc:
                                formBloc.severityLevelPiersCorrosion,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Severity Level',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc:
                                formBloc.extendedSvLevelPiersCorrosion,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Extended Severity Level',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          TextFieldBlocBuilder(
                            textFieldBloc: formBloc.remarksPiersCorrosion,
                            keyboardType: TextInputType.multiline,
                            maxLines: 3,
                            decoration: const InputDecoration(
                              labelText: 'Remarks',
                              prefixIcon: Icon(Icons.note_alt_rounded),
                            ),
                          ),
                          //
                          const Text('Matrial Degradation'),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.conditionPiersMaterialDg,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Condition of Severity',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc:
                                formBloc.severityLevelPiersMaterialDg,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Severity Level',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc:
                                formBloc.extendedSvLevelPiersMaterialDg,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Extended Severity Level',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          TextFieldBlocBuilder(
                            textFieldBloc: formBloc.remarksPiersMaterialDg,
                            keyboardType: TextInputType.multiline,
                            maxLines: 3,
                            decoration: const InputDecoration(
                              labelText: 'Remarks',
                              prefixIcon: Icon(Icons.note_alt_rounded),
                            ),
                          ),
                          //

                          const Text('Piers (Others)'),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.piersOthers,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Is there any other condition? ',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          TextFieldBlocBuilder(
                            textFieldBloc: formBloc.conditionPiersOthers,
                            keyboardType: TextInputType.multiline,
                            maxLines: 3,
                            decoration: const InputDecoration(
                              labelText: 'Please state the condition (if any)',
                              prefixIcon: Icon(Icons.note_alt_rounded),
                            ),
                          ),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.severityLevelPiersOthers,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Severity Level',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc:
                                formBloc.extendedSvLevelPiersOthers,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Extended Severity Level',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          TextFieldBlocBuilder(
                            textFieldBloc: formBloc.remarksPiersOthers,
                            keyboardType: TextInputType.multiline,
                            maxLines: 3,
                            decoration: const InputDecoration(
                              labelText: 'Remarks',
                              prefixIcon: Icon(Icons.note_alt_rounded),
                            ),
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.elementRatingPiers,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Element Rating',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          //</PIERS>

                          const Text(
                            'Pier in River',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          const Text('Scouring of Pier Foundation'),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.conditionPiervScouring,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Condition of Severity',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc:
                                formBloc.severityLevelPiervScouring,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Severity Level',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc:
                                formBloc.extendedSvLevelPiervScouring,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Extended Severity Level',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          TextFieldBlocBuilder(
                            textFieldBloc: formBloc.remarksPiervScouring,
                            keyboardType: TextInputType.multiline,
                            maxLines: 3,
                            decoration: const InputDecoration(
                              labelText: 'Remarks',
                              prefixIcon: Icon(Icons.note_alt_rounded),
                            ),
                          ),
                          //
                          const Text('Accumulation of Debris (Pier)'),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.conditionPiervDebris,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Condition of Severity',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.severityLevelPiervDebris,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Severity Level',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc:
                                formBloc.extendedSvLevelPiervDebris,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Extended Severity Level',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          TextFieldBlocBuilder(
                            textFieldBloc: formBloc.remarksPiervDebris,
                            keyboardType: TextInputType.multiline,
                            maxLines: 3,
                            decoration: const InputDecoration(
                              labelText: 'Remarks',
                              prefixIcon: Icon(Icons.note_alt_rounded),
                            ),
                          ),
                          //
                          const Text('Cracking (Concrete)'),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.conditionPiervCracking,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Condition of Severity',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc:
                                formBloc.severityLevelPiervCracking,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Severity Level',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc:
                                formBloc.extendedSvLevelPiervCracking,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Extended Severity Level',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          TextFieldBlocBuilder(
                            textFieldBloc: formBloc.remarksPiervCracking,
                            keyboardType: TextInputType.multiline,
                            maxLines: 3,
                            decoration: const InputDecoration(
                              labelText: 'Remarks',
                              prefixIcon: Icon(Icons.note_alt_rounded),
                            ),
                          ),

                          const Text('Spalling'),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.conditionPiervSpalling,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Condition of Severity',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc:
                                formBloc.severityLevelPiervSpalling,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Severity Level',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc:
                                formBloc.extendedSvLevelPiervSpalling,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Extended Severity Level',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          TextFieldBlocBuilder(
                            textFieldBloc: formBloc.remarksPiervSpalling,
                            keyboardType: TextInputType.multiline,
                            maxLines: 3,
                            decoration: const InputDecoration(
                              labelText: 'Remarks',
                              prefixIcon: Icon(Icons.note_alt_rounded),
                            ),
                          ),
                          //
                          const Text('Corrosion (Rebar)'),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.conditionPiervCorrosion,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Condition of Severity',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc:
                                formBloc.severityLevelPiervCorrosion,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Severity Level',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc:
                                formBloc.extendedSvLevelPiervCorrosion,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Extended Severity Level',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          TextFieldBlocBuilder(
                            textFieldBloc: formBloc.remarksPiervCorrosion,
                            keyboardType: TextInputType.multiline,
                            maxLines: 3,
                            decoration: const InputDecoration(
                              labelText: 'Remarks',
                              prefixIcon: Icon(Icons.note_alt_rounded),
                            ),
                          ),
                          //
                          const Text('Material Degradation'),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.conditionPiervMaterialDg,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Condition of Severity',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc:
                                formBloc.severityLevelPiervMaterialDg,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Severity Level',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc:
                                formBloc.extendedSvLevelPiervMaterialDg,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Extended Severity Level',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          TextFieldBlocBuilder(
                            textFieldBloc: formBloc.remarksPiervMaterialDg,
                            keyboardType: TextInputType.multiline,
                            maxLines: 3,
                            decoration: const InputDecoration(
                              labelText: 'Remarks',
                              prefixIcon: Icon(Icons.note_alt_rounded),
                            ),
                          ),

                          const Text('Pier in River (Others)'),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.piervOthers,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Is there any other condition? ',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          TextFieldBlocBuilder(
                            textFieldBloc: formBloc.conditionPiervOthers,
                            keyboardType: TextInputType.multiline,
                            maxLines: 3,
                            decoration: const InputDecoration(
                              labelText: 'Please state the condition (if any)',
                              prefixIcon: Icon(Icons.note_alt_rounded),
                            ),
                          ),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.severityLevelPiervOthers,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Severity Level',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc:
                                formBloc.extendedSvLevelPiervOthers,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Extended Severity Level',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          TextFieldBlocBuilder(
                            textFieldBloc: formBloc.remarksPiervOthers,
                            keyboardType: TextInputType.multiline,
                            maxLines: 3,
                            decoration: const InputDecoration(
                              labelText: 'Remarks',
                              prefixIcon: Icon(Icons.note_alt_rounded),
                            ),
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.elementRatingPieriver,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Element Rating',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          //</PIER IN RIVER>
                          //
                          const Text(
                            'Slope/Riverbank Protection',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          const Text('Disintegration of Protection'),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc:
                                formBloc.conditionSlriverDsgProtection,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Condition of Severity',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc:
                                formBloc.severityLevelSlriverDsgProtection,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Severity Level',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc:
                                formBloc.extendedSvLevelSlriverDsgProtection,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Extended Severity Level',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          TextFieldBlocBuilder(
                            textFieldBloc: formBloc.remarksSlriverDsgProtection,
                            keyboardType: TextInputType.multiline,
                            maxLines: 3,
                            decoration: const InputDecoration(
                              labelText: 'Remarks',
                              prefixIcon: Icon(Icons.note_alt_rounded),
                            ),
                          ),
                          //
                          const Text('Scouring Behind Protection'),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.conditionSlriverScouring,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Condition of Severity',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc:
                                formBloc.severityLevelSlriverScouring,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Severity Level',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc:
                                formBloc.extendedSvLevelSlriverScouring,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Extended Severity Level',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          TextFieldBlocBuilder(
                            textFieldBloc: formBloc.remarksSlriverScouring,
                            keyboardType: TextInputType.multiline,
                            maxLines: 3,
                            decoration: const InputDecoration(
                              labelText: 'Remarks',
                              prefixIcon: Icon(Icons.note_alt_rounded),
                            ),
                          ),
                          //
                          const Text('Erosion Behind Protection'),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.conditionSlriverErosion,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Condition of Severity',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc:
                                formBloc.severityLevelSlriverErosion,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Severity Level',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc:
                                formBloc.extendedSvLevelSlriverErosion,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Extended Severity Level',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          TextFieldBlocBuilder(
                            textFieldBloc: formBloc.remarksSlriverErosion,
                            keyboardType: TextInputType.multiline,
                            maxLines: 3,
                            decoration: const InputDecoration(
                              labelText: 'Remarks',
                              prefixIcon: Icon(Icons.note_alt_rounded),
                            ),
                          ),

                          const Text('Slope/Riverbank Protection (Others)'),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.slriverOthers,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Is there any other condition? ',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          TextFieldBlocBuilder(
                            textFieldBloc: formBloc.conditionSlriverOthers,
                            keyboardType: TextInputType.multiline,
                            maxLines: 3,
                            decoration: const InputDecoration(
                              labelText: 'Please state the condition (if any)',
                              prefixIcon: Icon(Icons.note_alt_rounded),
                            ),
                          ),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc:
                                formBloc.severityLevelSlriverOthers,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Severity Level',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc:
                                formBloc.extendedSvLevelSlriverOthers,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Extended Severity Level',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          TextFieldBlocBuilder(
                            textFieldBloc: formBloc.remarksSlriverOthers,
                            keyboardType: TextInputType.multiline,
                            maxLines: 3,
                            decoration: const InputDecoration(
                              labelText: 'Remarks',
                              prefixIcon: Icon(Icons.note_alt_rounded),
                            ),
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc:
                                formBloc.elementRatingSlopeRiverbank,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Element Rating',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          //</SLOPE/RIVERBANK PROTECTION>
                          //
                          const Text(
                            'Piers Protection',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          const Text('Cracking (Concrete)'),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.conditionPierptCracking,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Condition of Severity',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc:
                                formBloc.severityLevelPierptCracking,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Severity Level',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc:
                                formBloc.extendedSvLevelPierptCracking,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Extended Severity Level',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          TextFieldBlocBuilder(
                            textFieldBloc: formBloc.remarksPierptCracking,
                            keyboardType: TextInputType.multiline,
                            maxLines: 3,
                            decoration: const InputDecoration(
                              labelText: 'Remarks',
                              prefixIcon: Icon(Icons.note_alt_rounded),
                            ),
                          ),
                          //
                          const Text('Spalling'),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.conditionPierptSpalling,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Condition of Severity',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc:
                                formBloc.severityLevelPierptSpalling,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Severity Level',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc:
                                formBloc.extendedSvLevelPierptSpalling,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Extended Severity Level',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          TextFieldBlocBuilder(
                            textFieldBloc: formBloc.remarksPierptSpalling,
                            keyboardType: TextInputType.multiline,
                            maxLines: 3,
                            decoration: const InputDecoration(
                              labelText: 'Remarks',
                              prefixIcon: Icon(Icons.note_alt_rounded),
                            ),
                          ),
                          //
                          const Text('Corrosion (Rebar)'),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.conditionPierptCorrosion,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Condition of Severity',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc:
                                formBloc.severityLevelPierptCorrosion,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Severity Level',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc:
                                formBloc.extendedSvLevelPierptCorrosion,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Extended Severity Level',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          TextFieldBlocBuilder(
                            textFieldBloc: formBloc.remarksPierptCorrosion,
                            keyboardType: TextInputType.multiline,
                            maxLines: 3,
                            decoration: const InputDecoration(
                              labelText: 'Remarks',
                              prefixIcon: Icon(Icons.note_alt_rounded),
                            ),
                          ),

                          const Text('Piers Protection (Others)'),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.pierptOthers,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Is there any other condition? ',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          TextFieldBlocBuilder(
                            textFieldBloc: formBloc.conditionPierptOthers,
                            keyboardType: TextInputType.multiline,
                            maxLines: 3,
                            decoration: const InputDecoration(
                              labelText: 'Please state the condition (if any)',
                              prefixIcon: Icon(Icons.note_alt_rounded),
                            ),
                          ),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.severityLevelPierptOthers,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Severity Level',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc:
                                formBloc.extendedSvLevelPierptOthers,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Extended Severity Level',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          TextFieldBlocBuilder(
                            textFieldBloc: formBloc.remarksPierptOthers,
                            keyboardType: TextInputType.multiline,
                            maxLines: 3,
                            decoration: const InputDecoration(
                              labelText: 'Remarks',
                              prefixIcon: Icon(Icons.note_alt_rounded),
                            ),
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc:
                                formBloc.elementRatingPiersProtection,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Element Rating',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          //</PIERS PROTECTION>
                          //
                          const Text(
                            'River Channel',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          const Text('Waterway Blockage'),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.conditionWaterwayBlc,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Condition of Severity',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.severityLevelWaterwayBlc,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Severity Level',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc:
                                formBloc.extendedSvLevelWaterwayBlc,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Extended Severity Level',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          TextFieldBlocBuilder(
                            textFieldBloc: formBloc.remarksWaterwayBlc,
                            keyboardType: TextInputType.multiline,
                            maxLines: 3,
                            decoration: const InputDecoration(
                              labelText: 'Remarks',
                              prefixIcon: Icon(Icons.note_alt_rounded),
                            ),
                          ),
                          //
                          const Text('River Channel (Others)'),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.riverchnOthers,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Is there any other condition? ',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          TextFieldBlocBuilder(
                            textFieldBloc: formBloc.conditionRiverchnOthers,
                            keyboardType: TextInputType.multiline,
                            maxLines: 3,
                            decoration: const InputDecoration(
                              labelText: 'Please state the condition (if any)',
                              prefixIcon: Icon(Icons.note_alt_rounded),
                            ),
                          ),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc:
                                formBloc.severityLevelRiverchnOthers,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Severity Level',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc:
                                formBloc.extendedSvLevelRiverchnOthers,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Extended Severity Level',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          TextFieldBlocBuilder(
                            textFieldBloc: formBloc.remarksRiverchnOthers,
                            keyboardType: TextInputType.multiline,
                            maxLines: 3,
                            decoration: const InputDecoration(
                              labelText: 'Remarks',
                              prefixIcon: Icon(Icons.note_alt_rounded),
                            ),
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.elementRatingRiverChannel,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Element Rating',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          //</RIVER CHANNEL>
                          /*
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                onPressed: formBloc.submit,
                                // function to save record
                                child: const Text('SAVE RECORD'),
                              ),
                            ],
                          ),
                          */
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
}

//  SUBSTRUCTURE
//  - Abutment Foundation & Pilecap
//  - Abutment/Wingwall
//  - Pier Foundation & Pilecap
//  - Piers
//  - Pier in River (If Applicable)
//  - Slope/River Bank Protection
//  - Piers Protection
//  - River Channel
