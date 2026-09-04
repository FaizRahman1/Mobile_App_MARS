import 'dart:convert';

import 'package:bridgeinsp_new/drainage/Drmodels/Drainageidlist_model.dart';
import 'package:bridgeinsp_new/drainage/Drmodels/Drainageinspection_model.dart';
import 'package:bridgeinsp_new/drainage/Drpages/inspectstructure_page.dart';
import 'package:bridgeinsp_new/drainage/Drpages/inventory.dart';
import 'package:bridgeinsp_new/drainage/Drpages/reviewinspection_page.dart';
import 'package:bridgeinsp_new/drainage/testing/t_ddpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../bloc/drainagepi_bloc.dart';

class DrainagepiPage extends StatefulWidget {
  static final theKey = GlobalKey<_DrainagepiPage>();
  final Rows
  dridmodel; // initialised parameter passing from prev page; bridgeidlist

  DrainagepiPage({
    Key? key,
    required this.dridmodel,
    DateTime? date,
    String? row,
  }) : super(key: theKey);

  @override
  _DrainagepiPage createState() => _DrainagepiPage();
}

class _DrainagepiPage extends State<DrainagepiPage> {
  late final DrainagepiBloc _newsBloc;

  @override
  void initState() {
    String? url = widget.dridmodel.id;
    DateTime? dt = widget.dridmodel.dateofinsp; //cannot be access outside
    _newsBloc = DrainagepiBloc(utl: url, date: dt);
    _newsBloc.add(GetDrainagepiList());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 20),
          Expanded(child: _builddetaildetail(context)),
        ],
      ),
    );
  }

  Widget _builddetaildetail(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      child: BlocProvider(
        create: (_) => _newsBloc,
        child: BlocListener<DrainagepiBloc, DrainagepiState>(
          listener: (context, state) {
            if (state is DrainagepiError) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.message!)));
            }

            if (state is DrainagepiLoaded) {}
          },
          child: BlocBuilder<DrainagepiBloc, DrainagepiState>(
            builder: (context, state) {
              if (state is DrainagepiInitial) {
                return _buildLoading();
              } else if (state is DrainagepiLoading) {
                return _buildLoading();
              } else if (state is DrainagepiLoaded) {
                return WidgetDetail(
                  context: context,
                  widget: widget,
                  bridgepimodel: state.drainageinspectionModel,
                );
                //bridgeinvmodel: state.bridgeinventoryModel);
              } else if (state is DrainagepiError) {
                return Container();
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }
}

class WidgetDetail extends StatelessWidget {
  const WidgetDetail({
    super.key,
    required this.widget,
    required this.context,
    required this.bridgepimodel,
    //required this.bridgeinvmodel
  });

  //final BridgeinventoryModel bridgeinvmodel;
  final DrainageinspectionModel bridgepimodel;
  final DrainagepiPage widget;
  final BuildContext context;

  // THE SCREEN!
  @override
  Widget build(BuildContext context) {
    SharedPref sharedPref = SharedPref();
    List<Rows>? userlist = [];
    return Scaffold(
      appBar: AppBar(title: Text(widget.dridmodel.id as String)),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              SizedBox(
                width: 120,
                height: 120,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset('images/PLUS.png'),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Drainage ID : ${widget.dridmodel.id}',
                style: const TextStyle(
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                'Date of Last Inspection : ${widget.dridmodel.dateofinsp}',
                style: const TextStyle(
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),

              //
              /*
              SizedBox(
                  width: 200,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const InspectStructurePage()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(
                        50,
                        100,
                        200,
                        164,
                      )),
                      child: const Text(
                        'New Inspection',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ))),
              */
              const SizedBox(height: 30),
              const Divider(),
              const SizedBox(height: 10),

              /*MenuWidget(
                icon: const Icon(Icons.settings),
                onTap: () {
                  ModalDetail(context, br);
                },
                title: 'Inventory',
                //model: model,
              ),
              */
              MenuWidget(
                icon: const Icon(Icons.settings),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          Bridgeinventory(row: bridgepimodel.id),
                    ),
                  );
                },
                title: 'General Data',
                model: bridgepimodel,
              ),

              MenuWidget(
                icon: const Icon(Icons.settings),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          InspectStructurePage(row: bridgepimodel.id),
                    ),
                  );
                },
                title: 'New Inspection - Inspect Structure',
                model: bridgepimodel,
              ),

              MenuWidget(
                icon: const Icon(Icons.settings),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ReviewInspectionPage(
                        row: bridgepimodel.id ?? "Unknown ID",
                      ),
                    ),
                  );
                },
                title: 'New Inspection - Review of Inspection',
                model: bridgepimodel,
              ),

              //TESTING TAB ---
              MenuWidget(
                icon: const Icon(Icons.settings),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TestingTab(row: bridgepimodel.id),
                    ),
                  );
                },
                title: 'Testing Tab',
                model: bridgepimodel,
              ),

              // ---

              // <function save data to local> SUBMIT
              SizedBox(
                width: 100,
                child: ElevatedButton(
                  onPressed: () async {
                    Rows usertemp = widget.dridmodel;
                    try {
                      List<Rows> user = Rows.decode(
                        await sharedPref.read("list"),
                      );
                      user.add(usertemp);
                      String encodedData = Rows.encode(user);
                      sharedPref.save("list", encodedData);
                    } catch (Excepetion) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("New List will be created"),
                          duration: Duration(milliseconds: 500),
                        ),
                      );
                      userlist.add(usertemp);
                      String encodedData = Rows.encode(userlist);
                      sharedPref.save("list", encodedData);
                    }

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Saved!"),
                        duration: Duration(milliseconds: 500),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    //     backgroundColor: const Color.fromARGB(
                    //   50,
                    //   100,
                    //   200,
                    //   164,
                    // )
                  ),
                  child: const Text(
                    'Submit',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              // </function save data to local>
            ],
          ),
        ),
      ),
    );
  }
}

class SharedPref {
  Future read(String key) async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getString(key) != null) {
      return json.decode(prefs.getString(key)!);
    }
  }

  Future<void> save(String key, value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, json.encode(value));
  }

  Future<void> remove(String key) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }
}

class MenuWidget extends StatelessWidget {
  const MenuWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
    this.endIcon = true,
    // this.textColor,
    required this.model,
    //required this.brinventorymodel,
  });

  final String title;
  final Icon icon;
  final VoidCallback onTap;
  final bool endIcon;
  // final Color? textColor;
  final DrainageinspectionModel model;
  //final BridgeinventoryModel brinventorymodel;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        onTap();
      },
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          // color: Colors.redAccent.withOpacity(0.1),
        ),
        child: icon,
      ),
      // title: Text(title,
      //     style:
      //         Theme.of(context).textTheme.bodyLarge?.apply(color: textColor)),
      trailing: endIcon
          ? Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                // color: Colors.grey.withOpacity(0.1),
              ),
              child: const Icon(
                Icons.arrow_forward,
                size: 18.0,
                color: Colors.grey,
              ),
            )
          : null,
    );
  }
}

/*
Future<dynamic> ModalDetail(
    BuildContext context, BridgeinventoryModel bridgeinventoryModel) {
  //new name bridgeInventoryModel
  return showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        clipBehavior: Clip.hardEdge,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        child: const Column(
          children: [
            ListTile(
              title: Text(
                'Inventory ',
                textAlign: TextAlign.center,
              ),
              titleTextStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  fontSize: 20),
            ),
            Text(
              'ID : ${bridgeinventoryModel.rows}', //${model.id}
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Date of Inspection : any date ', //${model.dateofinspection}
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
                'Date of  Last Inspection : any date ', //${model.dateoflastinspection}
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                )),
            SizedBox(
              height: 10,
            ),
            Text('Inspected By : anything', // ${model.inspectedby}
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                )),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      );
    },
  );
}
*/

Widget _buildLoading() => const Center(child: CircularProgressIndicator());
