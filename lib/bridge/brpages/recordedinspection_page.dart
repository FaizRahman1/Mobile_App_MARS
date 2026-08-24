
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:bridgeinsp_new/bridge/brmodels/brpost_model.dart';
import 'package:bridgeinsp_new/bridge/brpages/bridgeidlist_page.dart';
import 'package:bridgeinsp_new/bridge/brpages/inspection_detail_page.dart';
// If your home page class name is different (e.g. HomePage), update it here.
import 'package:bridgeinsp_new/bridge/brpages/home_page.dart';
import 'package:bridgeinsp_new/bridge/brpages/editinspection.dart';


class RecordedInspection extends StatefulWidget {
  const RecordedInspection({super.key});

  @override
  State<RecordedInspection> createState() => _RecordedInspectionState();
}

class _RecordedInspectionState extends State<RecordedInspection> {
  final TextEditingController _searchCtrl = TextEditingController();

  bool _loading = true;
  List<BrPostModel> _all = <BrPostModel>[];

  @override
  void initState() {
    super.initState();
    _load();
    _searchCtrl.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _searchCtrl.dispose();
    super.dispose();
  }

  Future<void> _load() async {
    setState(() => _loading = true);
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString('info');

    List<BrPostModel> list = <BrPostModel>[];
    try {
      if (raw != null && raw.trim().isNotEmpty) {
        list = BrPostModel.decode(raw);
      }
    } catch (_) {
      // If existing storage format was corrupted/old, keep empty.
      list = <BrPostModel>[];
    }

    // newest first (safe even if date null)
    list.sort((a, b) {
      final da = a.dateofinsp ?? DateTime.fromMillisecondsSinceEpoch(0);
      final db = b.dateofinsp ?? DateTime.fromMillisecondsSinceEpoch(0);
      return db.compareTo(da);
    });

    setState(() {
      _all = list;
      _loading = false;
    });
  }

  List<BrPostModel> get _filtered {
    final q = _searchCtrl.text.trim().toLowerCase();
    if (q.isEmpty) return _all;
    return _all.where((x) => (x.id ?? '').toLowerCase().contains(q)).toList();
  }

  Future<void> _delete(BrPostModel item) async {
    final ok = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Delete saved inspection?'),
        content: Text('This will remove saved inspection for:\n\n${item.id ?? "-"}'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Cancel')),
          FilledButton(onPressed: () => Navigator.pop(context, true), child: const Text('Delete')),
        ],
      ),
    );

    if (ok != true) return;

    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString('info');
    if (raw == null || raw.trim().isEmpty) return;

    final list = BrPostModel.decode(raw);
    list.removeWhere((x) => x.id == item.id);
    await prefs.setString('info', BrPostModel.encode(list));

    if (!mounted) return;
    await _load();
  }

  void _review(BrPostModel item) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => InspectionDetailPage(inspection: item)),
    );
  }

Future<void> _edit(BrPostModel item) async {
  final updated = await Navigator.push<bool>(
    context,
    MaterialPageRoute(
      builder: (_) => EditInspectionPage(model: item),
    ),
  );

  // If user saved changes, reload the list
  if (updated == true) {
    await _load(); // <-- your existing function that reloads SharedPref list
    if (mounted) setState(() {});
  }
}


  Future<void> _submit(BrPostModel item) async {
    // API submit not completed yet — keep a clear UX hook.
    await showDialog<void>(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Submit'),
        content: Text(
          'Submit flow is not connected yet.\n\nSaved inspection:\n${item.id ?? "-"}',
        ),
        actions: [
          FilledButton(onPressed: () => Navigator.pop(context), child: const Text('OK')),
        ],
      ),
    );
  }

  void _goHome() {
    // If your home page class is HomePage instead of BrHomePage, change below.
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const BrHomePage()),
    );
  }

  void _goSearch() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => BridgeidlistPage(id: "")),
    );
  }

  @override
  Widget build(BuildContext context) {
    final items = _filtered;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Inspected Bridges'),
        centerTitle: true,
        actions: [
          IconButton(
            tooltip: 'Refresh',
            onPressed: _load,
            icon: const Icon(Icons.refresh),
          ),
          const SizedBox(width: 6),
        ],
      ),

      // ✅ Modern Bottom Navigation (no Drawer)
      bottomNavigationBar: NavigationBar(
        selectedIndex: 2,
        onDestinationSelected: (i) {
          if (i == 0) return _goHome();
          if (i == 1) return _goSearch();
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.search_outlined),
            selectedIcon: Icon(Icons.search),
            label: 'Search',
          ),
          NavigationDestination(
            icon: Icon(Icons.fact_check_outlined),
            selectedIcon: Icon(Icons.fact_check),
            label: 'Inspected',
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goSearch,
        icon: const Icon(Icons.add),
        label: const Text('New inspection'),
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
          child: Column(
            children: [
              _HeaderCard(
                total: _all.length,
                shown: items.length,
                controller: _searchCtrl,
              ),
              const SizedBox(height: 12),

              Expanded(
                child: _loading
                    ? const Center(child: CircularProgressIndicator())
                    : items.isEmpty
                    ? _EmptyState(onStart: _goSearch)
                    : RefreshIndicator(
                  onRefresh: _load,
                  child: ListView.separated(
                    padding: const EdgeInsets.only(bottom: 110),
                    itemCount: items.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 10),
                    itemBuilder: (context, index) {
                      final item = items[index];
                      return _InspectionCard(
                        item: item,
                        onReview: () => _review(item),
                        onEdit: () => _edit(item),
                        onSubmit: () => _submit(item),
                        onDelete: () => _delete(item),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _HeaderCard extends StatelessWidget {
  final int total;
  final int shown;
  final TextEditingController controller;

  const _HeaderCard({
    required this.total,
    required this.shown,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: Colors.grey.shade300),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(14, 12, 14, 12),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Theme.of(context).colorScheme.primaryContainer,
                  ),
                  child: const Icon(Icons.library_books_outlined),
                ),
                const SizedBox(width: 10),
                const Expanded(
                  child: Text(
                    'Saved inspections',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(999),
                    color: Theme.of(context).colorScheme.secondaryContainer,
                  ),
                  child: Text(
                    '$shown / $total',
                    style: const TextStyle(fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: 'Search Bridge ID...',
                prefixIcon: const Icon(Icons.search),
                isDense: true,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _InspectionCard extends StatelessWidget {
  final BrPostModel item;
  final VoidCallback onReview;
  final VoidCallback onEdit;
  final VoidCallback onSubmit;
  final VoidCallback onDelete;

  const _InspectionCard({
    required this.item,
    required this.onReview,
    required this.onEdit,
    required this.onSubmit,
    required this.onDelete,
  });

  String _fmtDate(DateTime? dt) {
    if (dt == null) return '-';
    return '${dt.year.toString().padLeft(4, '0')}-${dt.month.toString().padLeft(2, '0')}-${dt.day.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    final id = item.id ?? '-';
    final date = _fmtDate(item.dateofinsp);

    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
        side: BorderSide(color: Colors.grey.shade300),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(14, 14, 14, 14),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Theme.of(context).colorScheme.primaryContainer,
                  ),
                  child: const Icon(Icons.qr_code_2_outlined),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        id,
                        style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 14),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text('Date: $date', style: TextStyle(color: Colors.grey.shade700)),
                    ],
                  ),
                ),
                IconButton(
                  tooltip: 'Delete',
                  onPressed: onDelete,
                  icon: const Icon(Icons.delete_outline),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: onReview,
                    icon: const Icon(Icons.visibility_outlined, size: 18),
                    label: const Text('Review'),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: onEdit,
                    icon: const Icon(Icons.edit_outlined, size: 18),
                    label: const Text('Edit'),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: FilledButton.icon(
                    onPressed: onSubmit,
                    icon: const Icon(Icons.send_outlined, size: 18),
                    label: const Text('Submit'),
                    style: FilledButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  final VoidCallback onStart;

  const _EmptyState({required this.onStart});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.inbox_outlined, size: 44, color: Colors.grey.shade600),
            const SizedBox(height: 10),
            const Text(
              'No saved inspections yet',
              style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16),
            ),
            const SizedBox(height: 6),
            Text(
              'Start a new inspection from Search.',
              style: TextStyle(color: Colors.grey.shade700),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 14),
            FilledButton.icon(
              onPressed: onStart,
              icon: const Icon(Icons.search),
              label: const Text('Go to Search'),
            ),
          ],
        ),
      ),
    );
  }
}
