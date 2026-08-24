import 'package:bridgeinsp_new/generaloutline.dart';
import 'package:bridgeinsp_new/bridge/testing/t_ddtab.dart';
import 'package:bridgeinsp_new/bridge/testing/t_getddtab.dart';
import 'package:flutter/material.dart';

class TestingTab extends StatefulWidget {
  static final theKey = GlobalKey<_TestingTabState>();
  final String? row;

  TestingTab({required this.row}) : super(key: theKey);

  @override
  State<TestingTab> createState() => _TestingTabState();
}

class _TestingTabState extends State<TestingTab> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          titleSpacing: 40.0,
          //title: const Text(
          //'MARS-TEMAN\nBridge Periodic Inspection',
          title: Text(
            'Bridge ID : ${widget.row}',
            style: const TextStyle(
                fontSize: 20.0,
                color: Colors.black,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          centerTitle: true,
          backgroundColor: Colors.blueGrey,
        ),
        drawer: const NavBar(),
        /*
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            // Add your onPressed code here!
          },
          label: const Text('Submit'),
          icon: const Icon(Icons.file_copy),
          backgroundColor: Colors.pink,
        ),
        */
        body: Column(
          children: [
            const TabBar(
              tabs: [
                Tab(
                  text: ('Testing\nSupersecond'),
                ),
                Tab(
                  icon: Icon(
                    Icons.settings,
                    color: Colors.deepPurple,
                  ),
                ),
                Tab(
                  icon: Icon(
                    Icons.people,
                    color: Colors.deepPurple,
                  ),
                ),
                Tab(
                  icon: Icon(
                    Icons.piano,
                    color: Colors.deepPurple,
                  ),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  // [TAB1]
                  const TDeckDrainageTab(),

                  // [TAB2]
                  TDdGetPage(),

                  // [TAB3]
                  Container(
                    color: Colors.yellow,
                    child: const Center(
                      child: Text('Plain Tab3'),
                    ),
                  ),

                  //  [TAB4]
                  Container(
                    color: Colors.amber,
                    child: const Center(
                      child: Text('Plain Tab4'),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
