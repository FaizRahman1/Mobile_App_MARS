import 'package:bridgeinsp_new/drainage/Drmodels/drainageinventory_model.dart';
import 'package:bridgeinsp_new/drainage/bloc/drainageinventory_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Bridgeinventory extends StatefulWidget {
  const Bridgeinventory({super.key, required this.row});

  final String? row;

  @override
  State<Bridgeinventory> createState() => _BridgeinventoryState();
}

class _BridgeinventoryState extends State<Bridgeinventory> {
  late final DrainageinventoryBloc _inventoryBloc;

  @override
  void initState() {
    super.initState();
    _inventoryBloc = DrainageinventoryBloc(utl: widget.row)
      ..add(GetDrainageinventory());
  }

  @override
  void dispose() {
    _inventoryBloc.close();
    super.dispose();
  }

  Widget _valueRow(String label, Object? value) {
    final text = value?.toString().trim();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 110,
            child: Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.w700),
            ),
          ),
          Expanded(
            child: Text(
              text == null || text.isEmpty ? 'No data recorded' : text,
            ),
          ),
        ],
      ),
    );
  }

  Widget _message(IconData icon, String message) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 32),
            const SizedBox(height: 8),
            Text(message, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: BlocProvider.value(
        value: _inventoryBloc,
        child: BlocBuilder<DrainageinventoryBloc, DrainageinventoryState>(
          builder: (context, state) {
            if (state is DrainageinventoryInitial ||
                state is DrainageinventoryLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is DrainageinventoryError) {
              return _message(
                Icons.cloud_off_outlined,
                state.message ?? 'Unable to load drainage data.',
              );
            }
            if (state is DrainageinventoryLoaded) {
              final rows =
                  state.drainageinventoryModel.rows ?? const <Inventories>[];
              if (rows.isEmpty) {
                return _message(
                  Icons.info_outline,
                  'No General Data found for this drainage ID.',
                );
              }
              return ListView.builder(
                itemCount: rows.length,
                itemBuilder: (context, index) {
                  final item = rows[index];
                  return Card(
                    elevation: 0,
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        children: [
                          _valueRow('Drainage ID', item.drainageid),
                          _valueRow('Section', item.section),
                          _valueRow('Route', item.route),
                          _valueRow('KM location', item.kmlocation),
                          _valueRow('Feature', item.featurename),
                          _valueRow('Location', item.locoffeature),
                          _valueRow('Purpose', item.purpose),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
            return _message(
              Icons.error_outline,
              'Unable to load drainage data.',
            );
          },
        ),
      ),
    );
  }
}
