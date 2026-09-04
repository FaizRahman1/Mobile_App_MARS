import 'package:bridgeinsp_new/slope/slmodels/slopeidlist_model.dart';
import 'package:bridgeinsp_new/slope/slpages/inspection_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SelectedIdPage extends StatefulWidget {
  const SelectedIdPage({super.key, required this.title});
  final String title;

  @override
  _SelectedIdPageState createState() => _SelectedIdPageState();
}

class _SelectedIdPageState extends State<SelectedIdPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: const Save(),
    );
  }
}

class Save extends StatefulWidget {
  const Save({super.key});

  @override
  SaveView createState() => SaveView();
}

class SaveView extends State<Save> {
  List<Rows> savelist = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    loadSharedPrefs();
  }

  /// ✅ Load rows JSON first; if empty/fails, fallback to selected IDs list.
  Future<void> loadSharedPrefs() async {
    setState(() => loading = true);

    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.reload();

      // 1) Try JSON rows
      final jsonStr = prefs.getString(SelectedBridgeStore.kRowsJsonKey);
      if (jsonStr != null && jsonStr.isNotEmpty) {
        try {
          final rows = Rows.decode(jsonStr);
          setState(() {
            savelist = rows;
            loading = false;
          });
          return;
        } catch (_) {
          // continue to fallback
        }
      }

      // 2) Fallback to IDs list
      final ids =
          prefs.getStringList(SelectedBridgeStore.kIdsKey) ?? <String>[];
      if (ids.isNotEmpty) {
        // Build minimal Rows objects (id only) so UI can show something
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

      // 3) Nothing
      setState(() {
        savelist = [];
        loading = false;
      });
    } catch (_) {
      setState(() {
        savelist = [];
        loading = false;
      });
    }
  }

  Future<void> _removeItem(int index) async {
    if (index >= savelist.length || index < 0) return;

    final itemToRemove = savelist[index];

    setState(() {
      savelist.removeAt(index);
    });

    try {
      final prefs = await SharedPreferences.getInstance();

      // Update JSON rows
      await prefs.setString(
        SelectedBridgeStore.kRowsJsonKey,
        Rows.encode(savelist),
      );

      // Update IDs list
      final id = itemToRemove.id;
      if (id != null && id.trim().isNotEmpty) {
        final ids =
            (prefs.getStringList(SelectedBridgeStore.kIdsKey) ?? <String>[])
                .toList();
        ids.removeWhere((x) => x == id);
        await prefs.setStringList(SelectedBridgeStore.kIdsKey, ids);
      }

      await prefs.reload();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Slope ID removed'),
          duration: Duration(milliseconds: 700),
        ),
      );
    } catch (_) {
      // revert if fail
      setState(() {
        savelist.insert(index, itemToRemove);
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to delete. Please try again.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return const Center(child: CircularProgressIndicator());
    }

    return savelist.isEmpty
        ? Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.list, size: 60, color: Colors.grey),
                  SizedBox(height: 16),
                  Text(
                    'No selected Slope IDs',
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Go back to the Slope ID list and select some to inspect.',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          )
        : RefreshIndicator(
            onRefresh: loadSharedPrefs,
            child: _builduserlist(context, savelist),
          );
  }

  ListView _builduserlist(BuildContext context, List<Rows> selectedIdModel) {
    return ListView.builder(
      itemCount: selectedIdModel.length,
      itemBuilder: (context, index) {
        final item = selectedIdModel[index];
        final id = item.id ?? '-';

        return Dismissible(
          key: ValueKey(id),
          direction: DismissDirection.endToStart,
          background: Container(
            color: Colors.red,
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.only(right: 20),
            child: const Icon(Icons.delete, color: Colors.white),
          ),
          onDismissed: (direction) async {
            await _removeItem(index);
          },
          confirmDismiss: (direction) async {
            return await showDialog<bool>(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Delete Slope ID?'),
                    content: Text('Are you sure you want to remove "$id"?'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(false),
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(true),
                        child: const Text(
                          'Delete',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ],
                  ),
                ) ??
                false;
          },
          child: Card(
            child: ListTile(
              title: Text(id),
              subtitle: Text(item.dateofinsp?.toString() ?? 'No date'),
              leading: const Icon(Icons.search_rounded),
              trailing: const Text("Tap to Inspect"),
              onTap: () {
                if (item.id == null || item.id!.isEmpty) return;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        InspectionPage(row: item.id, date: item.dateofinsp),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}

class SelectedBridgeStore {
  static const String kIdsKey = 'selected_drainage_ids';
  static const String kRowsJsonKey = 'selected_drainage_rows_json';
}
