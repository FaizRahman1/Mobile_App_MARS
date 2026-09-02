import 'package:bridgeinsp_new/drainage/Drmodels/drainageinventory_model.dart';
import 'package:bridgeinsp_new/drainage/resources/drainageinventory_provider.dart';

class DrainageAssetResolutionException implements Exception {
  const DrainageAssetResolutionException(this.message);

  final String message;

  @override
  String toString() => message;
}

class DrainageAssetResolver {
  const DrainageAssetResolver();

  Future<Inventories> resolve(String drainageId) async {
    final response = await ApiProviderDrainageinventory(url: drainageId)
        .fetchDrainageinv();

    if (response.error != null) {
      throw DrainageAssetResolutionException(response.error!);
    }

    final rows = response.rows ?? const <Inventories>[];
    if (rows.isEmpty) {
      throw const DrainageAssetResolutionException(
        'No drainage inventory record was returned.',
      );
    }

    Inventories? match;
    for (final inventory in rows) {
      if (inventory.drainageid?.trim() == drainageId.trim()) {
        match = inventory;
        break;
      }
    }
    match ??= rows.first;

    if (match.id == null) {
      throw const DrainageAssetResolutionException(
        'The drainage inventory record does not contain AssetInternalId.',
      );
    }

    return match;
  }
}
