// ignore_for_file: use_build_context_synchronously

import 'package:bridgeinsp_new/bridge/authentication/auth.dart';
import 'package:bridgeinsp_new/generaloutline.dart';
import 'package:bridgeinsp_new/shared/module_bottom_navigation.dart';
import 'package:bridgeinsp_new/bridge/brpages/bridgeidlist_page.dart';
import 'package:bridgeinsp_new/bridge/brpages/recordedinspection_page.dart';
import 'package:bridgeinsp_new/bridge/brpages/selectedid_page.dart';
import 'package:bridgeinsp_new/bridge/resources/datasent_repository.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:bridgeinsp_new/bridge/brpages/module_selection_page.dart';

import '../bloc/datasend_bloc.dart';

class BrHomePage extends StatefulWidget {
  const BrHomePage({super.key});

  @override
  State<BrHomePage> createState() => _BrHomePageState();
}

class _BrHomePageState extends State<BrHomePage> {
  String? userToken;
  int _selectedIndex = 0;

  late final DatasendBloc _postBloc = DatasendBloc(DatasendRepos());

  @override
  void initState() {
    super.initState();
    getUserToken().then((token) {
      if (!mounted) return;
      setState(() {
        userToken = token;
      });
    });
  }

  Future<String?> getUserToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('user_token');
  }

  Future<void> _openSearchBridgeId() async {
    final connectivityResult = await Connectivity().checkConnectivity();

    if (connectivityResult == ConnectivityResult.none) {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (_) => NetworkErrorDialog(
          onPressed: () async {
            final again = await Connectivity().checkConnectivity();

            if (again == ConnectivityResult.none) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SelectedIdPage(
                    title: 'List of Selected Bridge IDs for Inspection',
                  ),
                ),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Connected to Internet, Please Try Again'),
                ),
              );
              Navigator.pop(context);
            }
          },
        ),
      );
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const BridgeidlistPage(id: '')),
    );
  }

  void _openSelectedIds() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            const SelectedIdPage(title: 'List of Selected Bridge IDs'),
      ),
    );
  }

  void _openInspectedIds() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => BlocProvider<DatasendBloc>.value(
          value: _postBloc,
          child: const RecordedInspection(),
        ),
      ),
    );
  }

  void _openModuleSelection() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const ModuleSelectionPage()),
    );
  }

  Future<void> _logout() async {
    final bool confirmLogout = await _showLogoutConfirmationDialog(context);
    if (!confirmLogout) return;

    await clearSessionData();

    if (!mounted) return;
    Navigator.of(context).pushReplacementNamed('/');
  }

  void _onNavTap(int idx) {
    if (idx == 3) {
      _openModuleSelection();
      return;
    }

    setState(() => _selectedIndex = idx);

    if (idx == 1) {
      _openSearchBridgeId();
    } else if (idx == 2) {
      _openInspectedIds();
    }
  }

  @override
  void dispose() {
    _postBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Bridge General Inspection'),
        actions: [
          IconButton(
            tooltip: 'Logout',
            onPressed: _logout,
            icon: const Icon(Icons.logout_rounded),
          ),
          const SizedBox(width: 4),
        ],
      ),
      bottomNavigationBar: ModuleBottomNavigation(
        selectedIndex: _selectedIndex,
        onDestinationSelected: _onNavTap,
        showModules: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 14, 16, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _HeaderCard(token: userToken, onSearch: _openSearchBridgeId),

              const SizedBox(height: 18),

              Text(
                'Quick Actions',
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800),
              ),

              const SizedBox(height: 12),

              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  _QuickActionChip(
                    label: 'Search',
                    icon: Icons.search_rounded,
                    onTap: _openSearchBridgeId,
                  ),
                  _QuickActionChip(
                    label: 'Selected',
                    icon: Icons.bookmark_added_rounded,
                    onTap: _openSelectedIds,
                  ),
                  _QuickActionChip(
                    label: 'Inspected',
                    icon: Icons.fact_check_rounded,
                    onTap: _openInspectedIds,
                  ),
                  _QuickActionChip(
                    label: 'Modules',
                    icon: Icons.dashboard_customize_rounded,
                    onTap: _openModuleSelection,
                  ),
                  _QuickActionChip(
                    label: 'Logout',
                    icon: Icons.logout_rounded,
                    onTap: _logout,
                    isDestructive: true,
                  ),
                ],
              ),

              const SizedBox(height: 18),

              Text(
                'Tip: Use the bottom navigation to quickly access Search, Inspected list, and Modules.',
                style: Theme.of(
                  context,
                ).textTheme.bodySmall?.copyWith(color: Colors.grey.shade700),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _HeaderCard extends StatelessWidget {
  final String? token;
  final VoidCallback onSearch;

  const _HeaderCard({required this.token, required this.onSearch});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        gradient: LinearGradient(
          colors: [
            colorScheme.primary.withOpacity(0.15),
            colorScheme.secondary.withOpacity(0.12),
          ],
        ),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: colorScheme.primary.withOpacity(0.12),
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Icon(Icons.map_outlined, size: 26),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Bridge Inspection',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  token == null || token!.isEmpty
                      ? 'Session: -'
                      : 'Session: ${_maskToken(token!)}',
                  style: Theme.of(
                    context,
                  ).textTheme.bodySmall?.copyWith(color: Colors.grey.shade700),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _maskToken(String token) {
    if (token.length <= 10) return token;
    return '${token.substring(0, 4)}...${token.substring(token.length - 4)}';
  }
}

class _QuickActionChip extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onTap;
  final bool isDestructive;

  const _QuickActionChip({
    required this.label,
    required this.icon,
    required this.onTap,
    this.isDestructive = false,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return InkWell(
      borderRadius: BorderRadius.circular(18),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: isDestructive ? Colors.red.withOpacity(0.08) : Colors.white,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: isDestructive ? Colors.red.shade200 : Colors.grey.shade300,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.03),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 18,
              color: isDestructive ? Colors.red : colorScheme.primary,
            ),
            const SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: isDestructive ? Colors.red : Colors.grey.shade900,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<bool> _showLogoutConfirmationDialog(BuildContext context) async {
  return await showDialog<bool>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Confirm Logout'),
            content: const Text('Are you sure you want to log out?'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                child: const Text('Log Out'),
              ),
            ],
          );
        },
      ) ??
      false;
}

class NetworkErrorDialog extends StatelessWidget {
  const NetworkErrorDialog({super.key, this.onPressed});

  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(width: 200, child: Image.asset('images/PLUS.png')),
          const SizedBox(height: 32),
          const Text(
            "Whoops!",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          const Text(
            "No internet connection found.",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          const Text(
            "Use Inspection Detail that Saved in this device instead",
            style: TextStyle(fontSize: 12),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          FilledButton(onPressed: onPressed, child: const Text("OK")),
          FilledButton(
            child: const Text(" Cancel"),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
