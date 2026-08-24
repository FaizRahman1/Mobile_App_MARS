// File: lib/resources/api_provider_bridgeidlist.dart
import 'package:bridgeinsp_new/bridge/brmodels/bridgeidlist_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart'; // For compute
import 'dart:collection'; // For LinkedHashMap

class ApiProviderBridgeidlist {
  final Dio _dio = Dio();

  // Use the correct, resolvable URL
  final String _baseUrl = 'https://teman-api.plus.com.my/c&s/bridgegi/all?id='; // Or Azure FQDN if DNS isn't fixed

  // --- REVERTED: Fetch all data for the ID ---
  Future<BridgeidlistModel> fetchBridgeidlist(String id) async {
    try {
      String fullUrl = '$_baseUrl$id';

      Response response = await _dio.get(
        fullUrl,
        options: Options(
          headers: {
            "Ocp-Apim-Subscription-Key": "526af1e9044d44d69095c8847675031c"
          },
        ),
      );

      // 1. Parse the JSON response (without sorting in fromJson)
      BridgeidlistModel result = BridgeidlistModel.fromJson(response.data);

      if (result.rows != null && result.rows!.isNotEmpty) {
        // 2. Filter to keep only the latest inspection per unique ID
        result.rows = _filterLatestPerId(result.rows!);

        // 3. Sort the filtered list OFF the main thread using compute
        result.rows = await compute(_sortRows, result.rows!);
      }

      return result;
    } catch (error, stacktrace) {
      print("Exception in ApiProviderBridgeidlist: $error stackTrace: $stacktrace");
      rethrow; // Or return BridgeidlistModel.withError("...")
    }
  }

  // --- KEEP THE FILTERING FUNCTION ---
  /// Filters a list of [Rows] to keep only the entry with the latest [dateofinsp] for each unique [id].
  List<Rows> _filterLatestPerId(List<Rows> rows) {
    Map<String, Rows> latestMap = LinkedHashMap<String, Rows>();

    for (final row in rows) {
      final currentId = row.id;
      final currentDate = row.dateofinsp;

      if (currentId != null) {
        if (!latestMap.containsKey(currentId)) {
          latestMap[currentId] = row;
        } else {
          final existingRow = latestMap[currentId]!;
          final existingDate = existingRow.dateofinsp;

          if (_compareDates(currentDate, existingDate) > 0) {
            latestMap[currentId] = row;
          }
        }
      }
    }

    return latestMap.values.toList();
  }

  /// Helper function to compare two DateTime objects safely.
  int _compareDates(DateTime? a, DateTime? b) {
    if (a == null && b == null) return 0;
    if (a == null) return -1;
    if (b == null) return 1;
    return a.compareTo(b);
  }
  // --- END OF FILTERING FUNCTION ---
}

// --- KEEP THE SORTING FUNCTION ---
List<Rows> _sortRows(List<Rows> rows) {
  rows.sort((a, b) {
    final aDate = a.dateofinsp;
    final bDate = b.dateofinsp;

    if (aDate == null && bDate == null) return 0;
    if (aDate == null) return 1;
    if (bDate == null) return -1;

    return bDate.compareTo(aDate); // newest first
  });
  return rows;
}
// --- END OF SORTING FUNCTION ---