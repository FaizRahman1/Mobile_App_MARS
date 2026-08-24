import 'package:bridgeinsp_new/generaloutline.dart';
import 'package:flutter/material.dart';

class SummaryOfInspectionPage extends StatelessWidget {
  const SummaryOfInspectionPage({super.key});

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
    );
  }
}


// Summary of Inspection is an excel file 
// where all the inspection finding is being summarised.