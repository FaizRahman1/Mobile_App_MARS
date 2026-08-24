/*
import 'package:bridgeinsp/generaloutline.dart';
import 'package:bridgeinsp/pages/generaldata_page.dart';
import 'package:bridgeinsp/pages/inspectstructure_page.dart';
import 'package:bridgeinsp/pages/reviewinspection_page.dart';
import 'package:bridgeinsp/testingpage.dart';
import 'package:flutter/material.dart';

// Display list of Inspection Module
// 1 - General Data
// 2 - Inspect Structure
// 3 - Inspection Summary & Review of Inspection

// this page will extends it module to respective page

class BridgeInspectionPage extends StatefulWidget {
  const BridgeInspectionPage({super.key, required String title});

  @override
  State<BridgeInspectionPage> createState() => _BridgeInspectionPageState();
}

class _BridgeInspectionPageState extends State<BridgeInspectionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'MARS-TEMAN \n Bridge Periodic Inspection',
          style: TextStyle(fontSize: 20.0),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      drawer: const NavBar(),
      body: SingleChildScrollView(
        //fit content with scrollable
        child: Column(
          children: [
            //BRIDGE ID
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
              child: Wrap(
                spacing: 10,
                children: [
                  Text('Bridge ID : xxx READ FROM SELECTION &&& DB '),
                  //Text("Bridge ID: ${model.rows?[index].bridgeid}"),
                ],
              ),
            ),

            //INSPECTION MODULE

            GestureDetector(
              //GENERAL DATA
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return const GeneralDataPage(
                          //title: title,
                          //imagePath: imagePath,
                          );
                    },
                  ),
                );
              },
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 5.0,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      spreadRadius: 2,
                      blurRadius: 2,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
                child: const Column(
                  children: [
                    //Image.asset(imagePath),
                    ListTile(
                      title: Text('GENERAL DATA'),
                      trailing: Icon(Icons.arrow_forward_ios_rounded),
                    )
                  ],
                ),
              ),
            ),

            GestureDetector(
              //INSPECT STRUCTURE

              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return const InspectStructurePage(
                          //title: 'HELPPPP',
                          //imagePath: imagePath,
                          );
                    },
                  ),
                );
              },
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 5.0,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      spreadRadius: 2,
                      blurRadius: 2,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
                child: const Column(
                  children: [
                    //Image.asset(imagePath),
                    ListTile(
                      title: Text('INSPECT STRUCTURE'),
                      trailing: Icon(Icons.arrow_forward_ios_rounded),
                    )
                  ],
                ),
              ),
            ),

            GestureDetector(
              //INSPECTION SUMMARY + REVIEW OF INSPECTION

              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return const ReviewInspectionPage(
                          //title: 'holaaaa',
                          //imagePath: imagePath,
                          );
                    },
                  ),
                );
              },
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 5.0,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      spreadRadius: 2,
                      blurRadius: 2,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
                child: const Column(
                  children: [
                    //Image.asset(imagePath),
                    ListTile(
                      title: Text('REVIEW OF INSPECTION'),
                      trailing: Icon(Icons.arrow_forward_ios_rounded),
                    )
                  ],
                ),
              ),
            ),

            GestureDetector(
              //TESTING PAGE

              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return const TestingPageTab(
                          //title: 'holaaaa',
                          //imagePath: imagePath,
                          );
                    },
                  ),
                );
              },
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 5.0,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      spreadRadius: 2,
                      blurRadius: 2,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
                child: const Column(
                  children: [
                    //Image.asset(imagePath),
                    ListTile(
                      title: Text('TESTING PAGE'),
                      trailing: Icon(Icons.arrow_forward_ios_rounded),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

*/