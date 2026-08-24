
import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:bridgeinsp_new/generaloutline.dart';
import 'package:bridgeinsp_new/drainage/Drmodels/Drainageidlist_model.dart';
import 'package:bridgeinsp_new/drainage/drpages/selectedid_page.dart';

import '../bloc/drainageidlist_bloc.dart';

class DrainageidlistPage extends StatefulWidget {
  final String id;

  const DrainageidlistPage({super.key, required this.id});

  @override
  State<DrainageidlistPage> createState() => _DrainageidlistPageState();
}

class _DrainageidlistPageState extends State<DrainageidlistPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final DrainageidlistBloc _bloc = DrainageidlistBloc();

  @override
  void initState() {
    super.initState();
    _bloc.add(GetDrainageidList(id: widget.id));
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,

      appBar: AppBar(
        title: const Text('Search Drainage ID'),
        centerTitle: true,
        actions: [
          IconButton(
            tooltip: 'Refresh',
            icon: const Icon(Icons.refresh),
            onPressed: () => _bloc.add(GetDrainageidList(id: widget.id)),
          ),
          const SizedBox(width: 4),
        ],
      ),
      body: BlocProvider.value(
        value: _bloc,
        child: BlocListener<DrainageidlistBloc, DrainageidlistState>(
          listener: (context, state) {
            if (state is DrainageidlistError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message ?? 'Error')),
              );
            }
          },
          child: BlocBuilder<DrainageidlistBloc, DrainageidlistState>(
            builder: (context, state) {
              if (state is DrainageidlistInitial || state is DrainageidlistLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              if (state is DrainageidlistLoaded) {
                final List<Rows> allRows =
                   (state.drainageidlistModel.rows ?? []).cast<Rows>();
                return _DrainageListContent(
                  originalData: allRows,
                  pageId: widget.id,
                  scaffoldKey: _scaffoldKey,
                );
              }

              if (state is DrainageidlistError) {
                return Center(child: Text('Error: ${state.message ?? '-'}'));
              }

              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }
}

class _DrainageListContent extends StatefulWidget {
  final List<Rows> originalData;
  final String pageId;
  final GlobalKey<ScaffoldState> scaffoldKey;

  const _DrainageListContent({
    required this.originalData,
    required this.pageId,
    required this.scaffoldKey,
  });

  @override
  State<_DrainageListContent> createState() => _DrainageListContentState();
}

class _DrainageListContentState extends State<_DrainageListContent> {
  final TextEditingController _searchController = TextEditingController();
  Timer? _debounce;

  late List<Rows> _displayedRows;

  @override
  void initState() {
    super.initState();
    _displayedRows = List<Rows>.from(widget.originalData);
  }

  @override
  void didUpdateWidget(covariant _DrainageListContent oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.originalData != widget.originalData) {
      _displayedRows = List<Rows>.from(widget.originalData);
      _applyFilter(_searchController.text);
    }
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _searchController.dispose();
    super.dispose();
  }

  void _applyFilter(String value) {
    final q = value.trim();
    if (q.isEmpty) {
      setState(() => _displayedRows = List<Rows>.from(widget.originalData));
      return;
    }
    final filtered = widget.originalData
        .where((e) => (e.id ?? '').toLowerCase().contains(q.toLowerCase()))
        .toList();
    setState(() => _displayedRows = filtered);
  }

  void _onSearchChanged(String value) {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 250), () {
      if (!mounted) return;
      _applyFilter(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 14, 16, 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.search),
                      const SizedBox(width: 8),
                      Expanded(
                        child: TextField(
                          controller: _searchController,
                          onChanged: _onSearchChanged,
                          decoration: const InputDecoration(
                            hintText: 'Search drainage ID...',
                            border: InputBorder.none,
                            isDense: true,
                          ),
                        ),
                      ),
                      if (_searchController.text.isNotEmpty)
                        IconButton(
                          tooltip: 'Clear',
                          onPressed: () {
                            _searchController.clear();
                            _applyFilter('');
                            setState(() {});
                          },
                          icon: const Icon(Icons.close),
                        ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    _CountChip(label: 'Showing', value: _displayedRows.length),
                    const SizedBox(width: 8),
                    _CountChip(label: 'Total', value: widget.originalData.length),
                  ],
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          Expanded(
            child: _displayedRows.isEmpty
                ? _EmptyState(
              onClear: () {
                _searchController.clear();
                _applyFilter('');
                setState(() {});
              },
            )
                : ListView.separated(
              padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
              itemCount: _displayedRows.length,
              separatorBuilder: (_, __) => const SizedBox(height: 10),
              itemBuilder: (context, index) {
                return _DrainageIdCard(
                  row: _displayedRows[index],
                  scaffoldKey: widget.scaffoldKey,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _DrainageIdCard extends StatelessWidget {
  final Rows row;
  final GlobalKey<ScaffoldState> scaffoldKey;

  const _DrainageIdCard({
    required this.row,
    required this.scaffoldKey,
  });

  @override
  Widget build(BuildContext context) {
    final id = row.id ?? '-';
    final dateText = row.dateofinsp == null ? 'No date' : row.dateofinsp.toString();

    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () => _handleTap(context),
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey.shade300),
          color: Theme.of(context).colorScheme.surface,
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(14, 12, 14, 12),
          child: Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                child: Icon(
                  Icons.account_tree_outlined,
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      id,
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      dateText,
                      style: TextStyle(color: Colors.grey.shade700, fontSize: 12),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(999),
                  color: Theme.of(context).colorScheme.secondaryContainer,
                ),
                child: Text(
                  'Select',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context).colorScheme.onSecondaryContainer,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _handleTap(BuildContext context) async {
    final confirmed = await showCupertinoDialog<bool>(
      context: context,
      builder: (_) => CupertinoAlertDialog(
        title: const Text('Select this drainage ID?'),
        content: Text(row.id ?? '-'),
        actions: [
          CupertinoDialogAction(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancel'),
          ),
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Confirm'),
          ),
        ],
      ),
    ) ??
        false;

    if (!confirmed) return;

    final ok = await SelectedDrainageStore.upsert(row);
    if (!ok) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to save selected drainage.')),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Selected drainage saved'), duration: Duration(milliseconds: 700)),
    );

    await showCupertinoDialog<void>(
      context: scaffoldKey.currentContext ?? context,
      builder: (_) => CupertinoAlertDialog(
        title: const Text('Success'),
        content: const Text('Drainage ID successfully selected.'),
        actions: [
          CupertinoDialogAction(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Continue searching'),
          ),
          CupertinoDialogAction(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const SelectedDRIdPage(title: 'List of Selected Inspection'),
                ),
              );
            },
            child: const Text('Go to Selected IDs'),
          ),
        ],
      ),
    );
  }
}

class _CountChip extends StatelessWidget {
  final String label;
  final int value;

  const _CountChip({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Text(
        '$label: $value',
        style: const TextStyle(fontWeight: FontWeight.w600),
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  final VoidCallback onClear;

  const _EmptyState({required this.onClear});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.search_off, size: 44, color: Colors.grey.shade500),
            const SizedBox(height: 10),
            const Text(
              'No matching drainage IDs',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 6),
            Text(
              'Try a different keyword or clear the search.',
              style: TextStyle(color: Colors.grey.shade700),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 14),
            OutlinedButton.icon(
              onPressed: onClear,
              icon: const Icon(Icons.close),
              label: const Text('Clear search'),
            ),
          ],
        ),
      ),
    );
  }
}

/// ✅ Robust storage: Save BOTH ids (StringList) and rows JSON.
/// This prevents "saved but not showing" issues.
class SelectedDrainageStore {
  static const String kIdsKey = 'selected_drainage_ids';
  static const String kRowsJsonKey = 'selected_drainage_rows_json';

  static Future<bool> upsert(Rows selectedRow) async {
    try {
      final prefs = await SharedPreferences.getInstance();

      // --- 1) Save IDs list (most reliable) ---
      final id = selectedRow.id;
      if (id != null && id.trim().isNotEmpty) {
        final currentIds = (prefs.getStringList(kIdsKey) ?? <String>[]).toList();
        currentIds.removeWhere((x) => x == id);
        currentIds.add(id);
        await prefs.setStringList(kIdsKey, currentIds);
      }

      // --- 2) Save full rows JSON (for date + other fields) ---
      List<Rows> rows = [];
      final jsonStr = prefs.getString(kRowsJsonKey);
      if (jsonStr != null && jsonStr.isNotEmpty) {
        try {
          rows = Rows.decode(jsonStr);
        } catch (_) {
          rows = [];
        }
      }
      rows.removeWhere((e) => e.id == selectedRow.id);
      rows.add(selectedRow);

      await prefs.setString(kRowsJsonKey, Rows.encode(rows));

      // Force reload cache (helps on some devices/flows)
      await prefs.reload();
      return true;
    } catch (_) {
      return false;
    }
  }
}
