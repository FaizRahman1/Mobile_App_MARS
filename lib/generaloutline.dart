//import 'package:bridgeinsp/pages/bridgeidlist_page.dart';
import 'package:bridgeinsp_new/pages/bridgeidlist_page.dart';
import 'package:bridgeinsp_new/pages/login_page.dart';
import 'package:bridgeinsp_new/pages/recordedinspection_page.dart';
import 'package:bridgeinsp_new/pages/selectedid_page.dart';
import 'package:flutter/material.dart';

class HeadBar extends StatefulWidget {
  const HeadBar({super.key});

  @override
  State<HeadBar> createState() => _HeadBarState();
}

class _HeadBarState extends State<HeadBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'MARS-TEMAN\nBridge General Inspection',
          style: TextStyle(fontSize: 20.0, color: Colors.white),
          textAlign: TextAlign.justify,
        ),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
    );
  }
}

// SIDE BAR -- navigation
class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blueGrey,
              ),
              child: ListTile(
                title: Text('MARS Inspection',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    )),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) {
                      return BridgeidlistPage(id: '');
                      //title: 'List of Selected Bridge ID');
                      //return BridgeidlistPage(); //temporarily act as HomePage
                      //const HomePage(
                      //title: 'Home Page',
                      //);
                    },
                  ),
                );
              },
              leading: const Icon(Icons.home),
              title: const Text(
                'Bridge ID List',
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) {
                      return const SelectedIdPage(
                          title: 'List of Selected Bridge ID');
                      //return BridgeidlistPage(); //temporarily act as HomePage
                      //const HomePage(
                      //title: 'Home Page',
                      //);
                    },
                  ),
                );
              },
              leading: const Icon(Icons.receipt_outlined),
              title: const Text(
                'List of Selected Bridge ID',
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) {
                      //return const InspectedPage();
                      return const RecordedInspection();
                      //title: 'List of Inspected Bridge ID');
                      //return BridgeidlistPage(); //temporarily act as HomePage
                      //const HomePage(
                      //title: 'Home Page',
                      //);
                    },
                  ),
                );
              },
              leading: const Icon(Icons.receipt),
              title: const Text(
                'List Inspected Bridge ID',
              ),
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(Icons.settings),
              title: const Text(
                'Settings',
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) {
                      return const LoginPage(
                        title: 'Login',
                      );
                    },
                  ),
                );
              },
              leading: const Icon(Icons.logout),
              title: const Text(
                'Logout',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// SIDE BAR -- navigation
class NavBarInspection extends StatelessWidget {
  const NavBarInspection({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blueGrey,
              ),
              child: ListTile(
                title: Text('MARS Inspection',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    )),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) {
                      return const SelectedIdPage(title: 'Selected Bridge');
                      //return BridgeidlistPage(model: ,);
                      //const HomePage(
                      //title: 'Home Page',
                      //);
                    },
                  ),
                );
              },
              leading: const Icon(Icons.home),
              title: const Text(
                'List Bridge ID to Inspect',
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) {
                    return const Scaffold();
                    //BridgeInspectionPage(
                    //title: '',
                    //models: model.rows![index],)
                    //);
                  }),
                );
              },
              leading: const Icon(Icons.list),
              title: const Text(
                'Bridge Inspection',
              ),
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(Icons.settings),
              title: const Text(
                'Settings',
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) {
                      return const LoginPage(
                        title: 'Login',
                      );
                    },
                  ),
                );
              },
              leading: const Icon(Icons.logout),
              title: const Text(
                'Logout',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
