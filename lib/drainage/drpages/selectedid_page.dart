// File: lib/pages/selectedid_page.dart
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:bridgeinsp_new/drainage/drmodels/Drainageidlist_model.dart';
import 'package:bridgeinsp_new/drainage/drpages/inspection_page.dart';

class SelectedDRIdPage extends StatefulWidget {
  const SelectedDRIdPage({super.key, required this.title});
  final String title;

  @override
  State<SelectedDRIdPage> createState() => _SelectedIdPageState();
}


class _SelectedIdPageState extends State<SelectedDRIdPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ✅ Remove drawer if using bottom nav
      // drawer: const NavBar(),
      appBar: AppBar(title: Text(widget.title)),
      body: const _SelectedListBody(),
    );
  }
}

class _SelectedListBody extends StatefulWidget {
  const _SelectedListBody();

  @override
  State<_SelectedListBody> createState() => _SelectedListBodyState();
}

class _SelectedListBodyState extends State<_SelectedListBody> {

  static const String kIdsKey = 'selected_drainage_ids';
  static const String kRowsJsonKey = 'selected_drainage_rows_json';

  List<Rows> savelist = <Rows>[];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    setState(() => loading = true);

    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.reload();

      // 1) Try full rows JSON first
      final jsonStr = prefs.getString(kRowsJsonKey);
      if (jsonStr != null && jsonStr.isNotEmpty) {
        final rows = Rows.decode(jsonStr);
        setState(() {
          savelist = rows;
          loading = false;
        });
        return;
      }

      // 2) Fallback to IDs list (if JSON missing)
      final ids = prefs.getStringList(kIdsKey) ?? <String>[];
      if (ids.isNotEmpty) {
        final rows = ids.map((id) {
          final r = Rows();
          r.id = id;
          r.dateofinsp = null;
          return r;
        }).toList();

        setState(() {
          savelist = rows;
          loading = false;
        });
        return;
      }

      setState(() {
        savelist = <Rows>[];
        loading = false;
      });
    } catch (e) {
      setState(() {
        savelist = <Rows>[];
        loading = false;
      });
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Load failed: $e')),
      );
    }
  }

  Future<void> _persist() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(kRowsJsonKey, Rows.encode(savelist));

    // keep ids list in sync
    final ids = savelist
        .map((e) => (e.id ?? '').trim())
        .where((id) => id.isNotEmpty)
        .toSet()
        .toList();
    await prefs.setStringList(kIdsKey, ids);

    await prefs.reload();
  }

  Future<void> _removeAt(int index) async {
    if (index < 0 || index >= savelist.length) return;

    final removed = savelist[index];
    setState(() => savelist.removeAt(index));

    try {
      await _persist();
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Drainage ID removed'), duration: Duration(milliseconds: 700)),
      );
    } catch (e) {
      setState(() => savelist.insert(index, removed));
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Delete failed: $e'), backgroundColor: Colors.red),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (loading) return const Center(child: CircularProgressIndicator());

    if (savelist.isEmpty) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.list, size: 60, color: Colors.grey),
              SizedBox(height: 16),
              Text('No selected Drainage IDs', style: TextStyle(fontSize: 18, color: Colors.grey)),
              SizedBox(height: 8),
              Text(
                'Go back to the Drainage ID list and select some to inspect.',
                style: TextStyle(fontSize: 14, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: _load,
      child: ListView.builder(
        itemCount: savelist.length,
        itemBuilder: (context, index) {
          final item = savelist[index];
          final id = (item.id ?? '').trim();

          return Dismissible(
            key: ValueKey(id.isNotEmpty ? id : 'idx_$index'),
            direction: DismissDirection.endToStart,
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(right: 20),
              child: const Icon(Icons.delete, color: Colors.white),
            ),
            confirmDismiss: (_) async {
              return await showDialog<bool>(
                context: context,
                builder: (_) => AlertDialog(
                  title: const Text('Delete Drainage ID?'),
                  content: Text('Remove "${id.isEmpty ? '(unknown)' : id}"?'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context, false),
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(context, true),
                      child: const Text('Delete', style: TextStyle(color: Colors.red)),
                    ),
                  ],
                ),
              ) ??
                  false;
            },
            onDismissed: (_) => _removeAt(index),
            child: Card(
              child: ListTile(
                title: Text(id.isEmpty ? '(No ID)' : id),
                subtitle: Text(item.dateofinsp?.toString() ?? 'No date'),
                leading: const Icon(Icons.search_rounded),
                trailing: const Text('Tap to Inspect'),
                onTap: () {
                  if (id.isEmpty) return;
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => InspectionPage(row: item.id, date: item.dateofinsp),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
