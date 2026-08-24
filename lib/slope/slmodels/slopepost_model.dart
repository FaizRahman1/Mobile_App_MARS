import 'dart:convert';

class SLPostModel {
  final String id;

  // General slope data
  final String? diskfilmno;
  final String? photono;
  final String? interfacelocation;
  final String? accessibility;
  final String? accessibilitywhy;

  // Routine works
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
  final DateTime dateofinsp;
  final String inspectedby;
  final String maintainedby;

  // Images
  final List<String>? images;
  final List<String>? images2;
  final List<String>? images3;
  final List<String>? images4;

  const SLPostModel({
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
    required this.dateofinsp,
    required this.inspectedby,
    required this.maintainedby,
    this.images,
    this.images2,
    this.images3,
    this.images4,
  });

  factory SLPostModel.fromJson(Map<String, dynamic> json) {
    return SLPostModel(
      id: json['id']?.toString() ?? '',
      diskfilmno: _asString(json['Disk/Film No'] ?? json['diskfilmno']),
      photono: _asString(json['Photo No'] ?? json['photono']),
      interfacelocation: _asString(
        json['Interface Location'] ?? json['interfacelocation'],
      ),
      accessibility: _asString(
        json['Accessibility'] ?? json['accessibility'],
      ),
      accessibilitywhy: _asString(
        json['Accessibility Why'] ?? json['accessibilitywhy'],
      ),
      vegetationControlForm: _asString(
        json['Vegetation Control Form'] ?? json['vegetationControlForm'],
      ),
      vegetationControlFormdesc: _asString(
        json['Vegetation Control Form Description'] ??
            json['vegetationControlFormdesc'],
      ),
      drainCleaningForm: _asString(
        json['Drain Cleaning Form'] ?? json['drainCleaningForm'],
      ),
      drainCleaningFormdesc: _asString(
        json['Drain Cleaning Form Description'] ??
            json['drainCleaningFormdesc'],
      ),
      gullyrepairform: _asString(
        json['Gully Repair Form'] ?? json['gullyrepairform'],
      ),
      gullyrepairformdesc: _asString(
        json['Gully Repair Form Description'] ?? json['gullyrepairformdesc'],
      ),
      concreterestorationform: _asString(
        json['Concrete Restoration Form'] ?? json['concreterestorationform'],
      ),
      concreterestorationformdesc: _asString(
        json['Concrete Restoration Form Description'] ??
            json['concreterestorationformdesc'],
      ),
      precastconcretereplacementform: _asString(
        json['Precast Concrete Replacement Form'] ??
            json['precastconcretereplacementform'],
      ),
      precastconcretereplacementformdesc: _asString(
        json['Precast Concrete Replacement Form Description'] ??
            json['precastconcretereplacementformdesc'],
      ),
      earthdrainresectioningform: _asString(
        json['Earth Drain Resectioning Form'] ??
            json['earthdrainresectioningform'],
      ),
      earthdrainresectioningformdesc: _asString(
        json['Earth Drain Resectioning Form Description'] ??
            json['earthdrainresectioningformdesc'],
      ),
      otherroutinework: _asString(
        json['Other Routine Work'] ?? json['otherroutinework'],
      ),
      statusrm: _asString(json['Status RM'] ?? json['statusrm']),
      dateofinsp: _asDateTime(
            json['Date of Inspection'] ?? json['dateofinsp'],
          ) ??
          DateTime.now(),
      inspectedby: _asString(
            json['Inspected By'] ?? json['inspectedby'],
          ) ??
          'MobileUser',
      maintainedby: _asString(
            json['Maintained By'] ?? json['maintainedby'],
          ) ??
          'PLUS',
      images: _asStringList(json['Images'] ?? json['images']),
      images2: _asStringList(json['Images2'] ?? json['images2']),
      images3: _asStringList(json['Images3'] ?? json['images3']),
      images4: _asStringList(json['Images4'] ?? json['images4']),
    );
  }

  factory SLPostModel.fromFormValues({
    required String id,
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
    return SLPostModel(
      id: id,
      diskfilmno: diskfilmno,
      photono: photono,
      interfacelocation: interfacelocation,
      accessibility: accessibility,
      accessibilitywhy: accessibilitywhy,
      vegetationControlForm: vegetationControlForm,
      vegetationControlFormdesc: vegetationControlFormdesc,
      drainCleaningForm: drainCleaningForm,
      drainCleaningFormdesc: drainCleaningFormdesc,
      gullyrepairform: gullyrepairform,
      gullyrepairformdesc: gullyrepairformdesc,
      concreterestorationform: concreterestorationform,
      concreterestorationformdesc: concreterestorationformdesc,
      precastconcretereplacementform: precastconcretereplacementform,
      precastconcretereplacementformdesc:
          precastconcretereplacementformdesc,
      earthdrainresectioningform: earthdrainresectioningform,
      earthdrainresectioningformdesc: earthdrainresectioningformdesc,
      otherroutinework: otherroutinework,
      statusrm: statusrm,
      dateofinsp: dateofinsp ?? DateTime.now(),
      inspectedby: inspectedby ?? 'MobileUser',
      maintainedby: maintainedby ?? 'PLUS',
      images: images,
      images2: images2,
      images3: images3,
      images4: images4,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'Disk/Film No': diskfilmno,
      'Photo No': photono,
      'Interface Location': interfacelocation,
      'Accessibility': accessibility,
      'Accessibility Why': accessibilitywhy,
      'Vegetation Control Form': vegetationControlForm,
      'Vegetation Control Form Description': vegetationControlFormdesc,
      'Drain Cleaning Form': drainCleaningForm,
      'Drain Cleaning Form Description': drainCleaningFormdesc,
      'Gully Repair Form': gullyrepairform,
      'Gully Repair Form Description': gullyrepairformdesc,
      'Concrete Restoration Form': concreterestorationform,
      'Concrete Restoration Form Description': concreterestorationformdesc,
      'Precast Concrete Replacement Form':
          precastconcretereplacementform,
      'Precast Concrete Replacement Form Description':
          precastconcretereplacementformdesc,
      'Earth Drain Resectioning Form': earthdrainresectioningform,
      'Earth Drain Resectioning Form Description':
          earthdrainresectioningformdesc,
      'Other Routine Work': otherroutinework,
      'Status RM': statusrm,
      'Date of Inspection': dateofinsp.toIso8601String(),
      'Inspected By': inspectedby,
      'Maintained By': maintainedby,
      'Images': images,
      'Images2': images2,
      'Images3': images3,
      'Images4': images4,
    };
  }

  static String encode(List<SLPostModel> list) {
    return jsonEncode(list.map((model) => model.toJson()).toList());
  }

  static List<SLPostModel> decode(String source) {
    final decoded = jsonDecode(source);

    if (decoded is! List) {
      throw const FormatException('SLPostModel JSON must contain a list.');
    }

    return decoded
        .whereType<Map>()
        .map(
          (item) => SLPostModel.fromJson(
            Map<String, dynamic>.from(item),
          ),
        )
        .toList();
  }

  static String? _asString(dynamic value) {
    if (value == null) return null;

    final text = value.toString().trim();
    if (text.isEmpty || text.toLowerCase() == 'null') return null;

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
