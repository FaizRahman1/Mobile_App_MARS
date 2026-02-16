import 'package:flutter/material.dart';

import 'package:bridgeinsp_new/pages/bridgeidlist_page.dart';
import 'package:bridgeinsp_new/pages/selectedid_page.dart';
import 'package:bridgeinsp_new/pages/recordedinspection_page.dart';

class MainNavigationPage extends StatefulWidget {
  const MainNavigationPage({
    super.key,
    this.initialIndex = 0,
    required this.bridgeListId,
  });

  final int initialIndex;
  final String bridgeListId;

  static _MainNavigationPageState? of(BuildContext context) {
    return context.findAncestorStateOfType<_MainNavigationPageState>();
  }

  @override
  State<MainNavigationPage> createState() => _MainNavigationPageState();
}

class _MainNavigationPageState extends State<MainNavigationPage> {
  late int _index;

  @override
  void initState() {
    super.initState();
    _index = widget.initialIndex;
  }

  void setTab(int index) => setState(() => _index = index);

  @override
  Widget build(BuildContext context) {
    final pages = <Widget>[
      _HomeTab(
        onGoSearch: () => setTab(1),
        onGoSelected: () => setTab(3),
        onGoInspected: () => setTab(2),
      ),
      BridgeidlistPage(id: widget.bridgeListId),
      const RecordedInspection(),
      const SelectedIdPage(title: 'List of Selected Inspection'),
    ];

    return Scaffold(
      body: IndexedStack(index: _index, children: pages),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _index,
        onDestinationSelected: setTab,
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
          NavigationDestination(
            icon: Icon(Icons.playlist_add_check_circle_outlined),
            selectedIcon: Icon(Icons.playlist_add_check_circle),
            label: 'Selected',
          ),
        ],
      ),
    );
  }
}

class _HomeTab extends StatelessWidget {
  const _HomeTab({
    required this.onGoSearch,
    required this.onGoSelected,
    required this.onGoInspected,
  });

  final VoidCallback onGoSearch;
  final VoidCallback onGoSelected;
  final VoidCallback onGoInspected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bridge General Inspection'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              // keep your existing logout flow here if needed
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Implement logout here')),
              );
            },
          )
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Welcome', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
                  const SizedBox(height: 6),
                  Text('Session: -', style: TextStyle(color: Colors.grey.shade700)),
                  const SizedBox(height: 14),
                  FilledButton.icon(
                    onPressed: onGoSearch,
                    icon: const Icon(Icons.search),
                    label: const Text('Search Bridge ID'),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Text('Quick Actions', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
          const SizedBox(height: 12),
          GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              _QuickCard(
                title: 'Search Bridge ID',
                subtitle: 'Find & start inspection',
                icon: Icons.search,
                onTap: onGoSearch,
              ),
              _QuickCard(
                title: 'Selected IDs',
                subtitle: 'Offline inspection list',
                icon: Icons.playlist_add_check_circle,
                onTap: onGoSelected,
              ),
              _QuickCard(
                title: 'Inspected IDs',
                subtitle: 'Saved inspections',
                icon: Icons.fact_check,
                onTap: onGoInspected,
              ),
              _QuickCard(
                title: 'Logout',
                subtitle: 'End current session',
                icon: Icons.logout,
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Implement logout here')),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _QuickCard extends StatelessWidget {
  const _QuickCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon, size: 28),
              const Spacer(),
              Text(title, style: const TextStyle(fontWeight: FontWeight.w700)),
              const SizedBox(height: 4),
              Text(subtitle, style: TextStyle(color: Colors.grey.shade700, fontSize: 12)),
            ],
          ),
        ),
      ),
    );
  }
}
