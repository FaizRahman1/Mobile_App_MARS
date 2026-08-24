import 'package:bridgeinsp_new/drainage/drpages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:bridgeinsp_new/bridge/brpages/home_page.dart';
import 'package:bridgeinsp_new/slope/slpages/home_page.dart';

class ModuleSelectionPage extends StatelessWidget {
  const ModuleSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Module"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome",
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                "Please choose a module to continue.",
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 18),

              Expanded(
                child: ListView(
                  children: [
                    // ✅ BRIDGE -> BrHomePage
                    _ModuleCard(
                      title: "Bridge",
                      subtitle: "Bridge inspection & reporting",
                      icon: Icons.engineering,
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (_) => const BrHomePage()),
                        );
                      },
                    ),
                    const SizedBox(height: 12),

                    // 🚧 DRAINAGE (placeholder)
                    _ModuleCard(
                      title: "Drainage",
                      subtitle: "Drainage inspection & records",
                      icon: Icons.water_outlined,
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (_) => const DrHomePage())
                        );
                        _notLinkedYet(context, "Drainage");
                      },
                    ),
                    const SizedBox(height: 12),

                    // 🚧 SLOPE (placeholder)
                    _ModuleCard(
                      title: "Slope",
                      subtitle: "Slope inspection & monitoring",
                      icon: Icons.terrain_outlined,
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (_) => const SLHomePage()),
                        );
                        _notLinkedYet(context, "Slope");
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _notLinkedYet(BuildContext context, String module) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("$module module page not linked yet. Update the onTap() route."),
      ),
    );
  }
}

class _ModuleCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback onTap;

  const _ModuleCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: onTap,
      child: Ink(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.black12),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              blurRadius: 10,
              offset: Offset(0, 4),
              color: Color(0x14000000),
            )
          ],
        ),
        child: Row(
          children: [
            Container(
              height: 46,
              width: 46,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: const Color(0xFFF4F6F8),
              ),
              child: Icon(icon, size: 26),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: const TextStyle(fontSize: 13, color: Colors.black54),
                  ),
                ],
              ),
            ),
            const Icon(Icons.chevron_right),
          ],
        ),
      ),
    );
  }
}