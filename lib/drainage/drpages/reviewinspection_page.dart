import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:bridgeinsp_new/drainage/Drmodels/drpost_model.dart';
import 'package:bridgeinsp_new/drainage/drpages/inspection_detail_page.dart';

class ReviewInspectionPage extends StatefulWidget {
  final String row; 

  const ReviewInspectionPage({
    super.key,
    required this.row,
  });

  @override
  State<ReviewInspectionPage> createState() => _ReviewInspectionPageState();
}

class _ReviewInspectionPageState extends State<ReviewInspectionPage> {
  bool _isLoading = true;
  String? _error;
  DRPostModel? _inspection;

  @override
  void initState() {
    super.initState();
    _loadInspection();
  }

  Future<void> _loadInspection() async {
    try {
      final prefs = await SharedPreferences.getInstance();

      // ✅ Aligned with your save logic: full inspection records stored under "info"
      final raw = prefs.getString('info');

      if (raw == null || raw.isEmpty) {
        setState(() {
          _error = "No saved inspections found.";
          _isLoading = false;
        });
        return;
      }

      final List<DRPostModel> list = DRPostModel.decode(raw);

      // Find matching ID (latest entry if duplicates exist)
      DRPostModel? match;
      for (int i = list.length - 1; i >= 0; i--) {
        if (list[i].id == widget.row) {
          match = list[i];
          break;
        }
      }

      if (match == null) {
        setState(() {
          _error = "No saved inspection found for Drainage ID: ${widget.row}";
          _isLoading = false;
        });
        return;
      }

      setState(() {
        _inspection = match;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _error = "Failed to load inspection: $e";
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Scaffold(
        appBar: AppBar(title: Text("Review Inspection - ${widget.row}")),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    if (_error != null) {
      return Scaffold(
        appBar: AppBar(title: Text("Review Inspection - ${widget.row}")),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Text(_error!, textAlign: TextAlign.center),
          ),
        ),
      );
    }

    // ✅ Use your existing detail page (no duplicate UI)
    return InspectionDetailPage(inspection: _inspection!);
  }
}
