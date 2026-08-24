// File: lib/slope/slmodels/sendmodel.dart

class SendInfo {
  final String id;

  // General slope data
  final String? diskfilmno;
  final String? photono;
  final String? interfacelocation;
  final String? accessibility;
  final String? accessibilitywhy;

  // Routine works checked
  final String? vegetationControlForm;
  final String? vegetationControlFormdesc;

  final String? drainCleaningForm;
  final String? drainCleaningFormdesc;

  final String? gullyrepairform;
  final String? gullyrepairformdesc;

  final String? concreterestorationform;
  final String? concreterestorationformdesc;

  final String? precastconcretereplacementform;
  final String? precastconcretereplacementformdesc;

  final String? earthdrainresectioningform;
  final String? earthdrainresectioningformdesc;

  final String? otherroutinework;
  final String? statusrm;

  // Inspection metadata
  final DateTime? dateofinsp;
  final String? inspectedby;
  final String? maintainedby;

  // Images
  final List<String>? images;
  final List<String>? images2;
  final List<String>? images3;
  final List<String>? images4;

  const SendInfo({
    required this.id,
    this.diskfilmno,
    this.photono,
    this.interfacelocation,
    this.accessibility,
    this.accessibilitywhy,
    this.vegetationControlForm,
    this.vegetationControlFormdesc,
    this.drainCleaningForm,
    this.drainCleaningFormdesc,
    this.gullyrepairform,
    this.gullyrepairformdesc,
    this.concreterestorationform,
    this.concreterestorationformdesc,
    this.precastconcretereplacementform,
    this.precastconcretereplacementformdesc,
    this.earthdrainresectioningform,
    this.earthdrainresectioningformdesc,
    this.otherroutinework,
    this.statusrm,
    this.dateofinsp,
    this.inspectedby,
    this.maintainedby,
    this.images,
    this.images2,
    this.images3,
    this.images4,
  });

  factory SendInfo.fromJson(Map<String, dynamic> json) {
    return SendInfo(
      id: json['id']?.toString() ?? '',
      diskfilmno: _asString(json['diskfilmno']),
      photono: _asString(json['photono']),
      interfacelocation: _asString(json['interfacelocation']),
      accessibility: _asString(json['accessibility']),
      accessibilitywhy: _asString(json['accessibilitywhy']),
      vegetationControlForm:
          _asString(json['vegetationControlForm']),
      vegetationControlFormdesc:
          _asString(json['vegetationControlFormdesc']),
      drainCleaningForm:
          _asString(json['drainCleaningForm']),
      drainCleaningFormdesc:
          _asString(json['drainCleaningFormdesc']),
      gullyrepairform:
          _asString(json['gullyrepairform']),
      gullyrepairformdesc:
          _asString(json['gullyrepairformdesc']),
      concreterestorationform:
          _asString(json['concreterestorationform']),
      concreterestorationformdesc:
          _asString(json['concreterestorationformdesc']),
      precastconcretereplacementform:
          _asString(json['precastconcretereplacementform']),
      precastconcretereplacementformdesc:
          _asString(json['precastconcretereplacementformdesc']),
      earthdrainresectioningform:
          _asString(json['earthdrainresectioningform']),
      earthdrainresectioningformdesc:
          _asString(json['earthdrainresectioningformdesc']),
      otherroutinework:
          _asString(json['otherroutinework']),
      statusrm: _asString(json['statusrm']),
      dateofinsp: _asDateTime(json['dateofinsp']),
      inspectedby: _asString(json['inspectedby']),
      maintainedby: _asString(json['maintainedby']),
      images: _asStringList(json['images']),
      images2: _asStringList(json['images2']),
      images3: _asStringList(json['images3']),
      images4: _asStringList(json['images4']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'diskfilmno': diskfilmno,
      'photono': photono,
      'interfacelocation': interfacelocation,
      'accessibility': accessibility,
      'accessibilitywhy': accessibilitywhy,
      'vegetationControlForm': vegetationControlForm,
      'vegetationControlFormdesc': vegetationControlFormdesc,
      'drainCleaningForm': drainCleaningForm,
      'drainCleaningFormdesc': drainCleaningFormdesc,
      'gullyrepairform': gullyrepairform,
      'gullyrepairformdesc': gullyrepairformdesc,
      'concreterestorationform': concreterestorationform,
      'concreterestorationformdesc': concreterestorationformdesc,
      'precastconcretereplacementform':
          precastconcretereplacementform,
      'precastconcretereplacementformdesc':
          precastconcretereplacementformdesc,
      'earthdrainresectioningform': earthdrainresectioningform,
      'earthdrainresectioningformdesc':
          earthdrainresectioningformdesc,
      'otherroutinework': otherroutinework,
      'statusrm': statusrm,
      'dateofinsp': dateofinsp?.toIso8601String(),
      'inspectedby': inspectedby,
      'maintainedby': maintainedby,
      'images': images,
      'images2': images2,
      'images3': images3,
      'images4': images4,
    };
  }

  SendInfo copyWith({
    String? id,
    String? diskfilmno,
    String? photono,
    String? interfacelocation,
    String? accessibility,
    String? accessibilitywhy,
    String? vegetationControlForm,
    String? vegetationControlFormdesc,
    String? drainCleaningForm,
    String? drainCleaningFormdesc,
    String? gullyrepairform,
    String? gullyrepairformdesc,
    String? concreterestorationform,
    String? concreterestorationformdesc,
    String? precastconcretereplacementform,
    String? precastconcretereplacementformdesc,
    String? earthdrainresectioningform,
    String? earthdrainresectioningformdesc,
    String? otherroutinework,
    String? statusrm,
    DateTime? dateofinsp,
    String? inspectedby,
    String? maintainedby,
    List<String>? images,
    List<String>? images2,
    List<String>? images3,
    List<String>? images4,
  }) {
    return SendInfo(
      id: id ?? this.id,
      diskfilmno: diskfilmno ?? this.diskfilmno,
      photono: photono ?? this.photono,
      interfacelocation:
          interfacelocation ?? this.interfacelocation,
      accessibility: accessibility ?? this.accessibility,
      accessibilitywhy:
          accessibilitywhy ?? this.accessibilitywhy,
      vegetationControlForm:
          vegetationControlForm ?? this.vegetationControlForm,
      vegetationControlFormdesc:
          vegetationControlFormdesc ??
              this.vegetationControlFormdesc,
      drainCleaningForm:
          drainCleaningForm ?? this.drainCleaningForm,
      drainCleaningFormdesc:
          drainCleaningFormdesc ?? this.drainCleaningFormdesc,
      gullyrepairform:
          gullyrepairform ?? this.gullyrepairform,
      gullyrepairformdesc:
          gullyrepairformdesc ?? this.gullyrepairformdesc,
      concreterestorationform:
          concreterestorationform ??
              this.concreterestorationform,
      concreterestorationformdesc:
          concreterestorationformdesc ??
              this.concreterestorationformdesc,
      precastconcretereplacementform:
          precastconcretereplacementform ??
              this.precastconcretereplacementform,
      precastconcretereplacementformdesc:
          precastconcretereplacementformdesc ??
              this.precastconcretereplacementformdesc,
      earthdrainresectioningform:
          earthdrainresectioningform ??
              this.earthdrainresectioningform,
      earthdrainresectioningformdesc:
          earthdrainresectioningformdesc ??
              this.earthdrainresectioningformdesc,
      otherroutinework:
          otherroutinework ?? this.otherroutinework,
      statusrm: statusrm ?? this.statusrm,
      dateofinsp: dateofinsp ?? this.dateofinsp,
      inspectedby: inspectedby ?? this.inspectedby,
      maintainedby: maintainedby ?? this.maintainedby,
      images: images ?? this.images,
      images2: images2 ?? this.images2,
      images3: images3 ?? this.images3,
      images4: images4 ?? this.images4,
    );
  }

  static String? _asString(dynamic value) {
    if (value == null) return null;

    final text = value.toString().trim();
    if (text.isEmpty || text.toLowerCase() == 'null') {
      return null;
    }

    return text;
  }

  static DateTime? _asDateTime(dynamic value) {
    if (value == null) return null;
    if (value is DateTime) return value;

    return DateTime.tryParse(value.toString());
  }

  static List<String>? _asStringList(dynamic value) {
    if (value == null) return null;

    if (value is List) {
      return value
          .where((item) => item != null)
          .map((item) => item.toString())
          .toList();
    }

    return null;
  }
}
