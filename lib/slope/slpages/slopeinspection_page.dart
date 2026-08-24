import 'dart:convert';

import 'package:bridgeinsp_new/generaloutline.dart';
import 'package:bridgeinsp_new/slope/slmodels/slopeidlist_model.dart';
import 'package:bridgeinsp_new/slope/slmodels/slopeinspection_model.dart';
import 'package:bridgeinsp_new/slope/slpages/inspectstructure_page.dart';
import 'package:bridgeinsp_new/slope/slpages/inventory.dart';
import 'package:bridgeinsp_new/slope/slpages/reviewinspection_page.dart';
import 'package:bridgeinsp_new/slope/testing/t_ddpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../bloc/slopepi_bloc.dart';

class SlopepiPage extends StatefulWidget {
  static final theKey = GlobalKey<_SlopepiPage>();
  final Rows
      slidmodel; // initialised parameter passing from prev page; slopeidlist

  SlopepiPage({Key? key, required this.slidmodel, DateTime? date, String? row})
      : super(key: theKey);

  @override
  _SlopepiPage createState() => _SlopepiPage();
}

class _SlopepiPage extends State<SlopepiPage> {
  late final SlopepiBloc _newsBloc;

  @override
  void initState() {
    String? url = widget.slidmodel.id;
    DateTime? dt = widget.slidmodel.dateofinsp; //cannot be access outside
    _newsBloc = SlopepiBloc(utl: url, date: dt);
    _newsBloc.add(GetSlopegepiList());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 20),
          Expanded(
            child: _builddetaildetail(context),
          ),
        ],
      ),
    );
  }

  Widget _builddetaildetail(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      child: BlocProvider(
        create: (_) => _newsBloc,
        child: BlocListener<SlopepiBloc, SlopepiState>(
          listener: (context, state) {
            if (state is SlopepiError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message!),
                ),
              );
            }

            if (state is SlopepiLoaded) {}
          },
          child: BlocBuilder<SlopepiBloc, SlopepiState>(
            builder: (context, state) {
              if (state is SlopepiInitial) {
                return _buildLoading();
              } else if (state is SlopepiLoading) {
                return _buildLoading();
              } else if (state is SlopepiLoaded) {
                return WidgetDetail(
                    context: context,
                    widget: widget,
                    slopepimodel: state.slopeInspectionModel);
              } else if (state is SlopepiError) {
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
    required this.slopepimodel,
    //required this.bridgeinvmodel
  });

  final SlopeinspectionModel slopepimodel;
  final SlopepiPage widget;
  final BuildContext context;

  // THE SCREEN!
  @override
  Widget build(BuildContext context) {
    SharedPref sharedPref = SharedPref();
    List<Rows>? userlist = [];
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.slidmodel.id as String),
      ),
      drawer: const NavBar(),
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
                'Slope ID : ${widget.slidmodel.id}',
                style: const TextStyle(
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                'Date of Last Inspection : ${widget.slidmodel.dateofinsp}',
                style:
                    const TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              
              const SizedBox(height: 30),
              const Divider(),
              const SizedBox(height: 10),

              MenuWidget(
                icon: const Icon(Icons.settings),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Slopeinventory(
                                row: slopepimodel.id,
                              )));
                },
                title: 'General Data',
                model: slopepimodel,
              ),

              MenuWidget(
                icon: const Icon(Icons.settings),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => InspectStructurePage(
                                row: slopepimodel.id,
                              )));
                },
                title: 'New Inspection - Inspect Structure',
                model: slopepimodel,
              ),

              MenuWidget(
                icon: const Icon(Icons.settings),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ReviewInspectionPage(
                                 row: slopepimodel.id ?? "Unknown ID",
                              )));
                },
                title: 'New Inspection - Review of Inspection',
                model: slopepimodel,
              ),

              //TESTING TAB ---
              MenuWidget(
                icon: const Icon(Icons.settings),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TestingTab(
                                row: slopepimodel.id,
                              )));
                },
                title: 'Testing Tab',
                model: slopepimodel,
              ),
              // ---

              // <function save data to local> SUBMIT

              SizedBox(
                width: 100,
                child: ElevatedButton(
                    onPressed: () async {
                      Rows usertemp = widget.slidmodel;
                      try {
                        List<Rows> user =
                            Rows.decode(await sharedPref.read("list"));
                        user.add(usertemp);
                        String encodedData = Rows.encode(user);
                        sharedPref.save("list", encodedData);
                      } catch (Excepetion) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("New List will be created"),
                                duration: Duration(milliseconds: 500)));
                        userlist.add(usertemp);
                        String encodedData = Rows.encode(userlist);
                        sharedPref.save("list", encodedData);
                      }

                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Saved!"),
                          duration: Duration(milliseconds: 500)));
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
                          color: Colors.white, fontWeight: FontWeight.bold),
                    )),
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
  final SlopeinspectionModel model;
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
        ),
        child: icon,
      ),
      trailing: endIcon
          ? Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                // color: Colors.grey.withOpacity(0.1),
              ),
              child: const Icon(Icons.arrow_forward,
                  size: 18.0, color: Colors.grey))
          : null,
    );
  }
}

Widget _buildLoading() => const Center(child: CircularProgressIndicator());
