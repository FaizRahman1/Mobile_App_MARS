import 'package:bridgeinsp_new/bloc/datasend_bloc.dart';
import 'package:bridgeinsp_new/generaloutline.dart';
import 'package:bridgeinsp_new/models/brpost_model.dart';
import 'package:bridgeinsp_new/pages/bridgeidlist_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

import '../resources/datasent_repository.dart';

class SaveformApp extends StatelessWidget {
  const SaveformApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/",
      onGenerateRoute: RouteGenerator().generateRoute,
    );
  }
}

class RouteGenerator {
  final DatasendBloc _DatasendBloc = DatasendBloc(DatasendRepos());

  Route<dynamic> generateRoute(RouteSettings settings) {
    //final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => BlocProvider<DatasendBloc>.value(
            value: _DatasendBloc,
            child: const Datasend(),
          ),
        );

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}

class Datasend extends StatefulWidget {
  const Datasend({super.key});

  @override
  State<Datasend> createState() => _DatasendState();
}

class _DatasendState extends State<Datasend> {
  SharedPref sharedPref = SharedPref();

  List<brpostmodel> savelist = [];

  @override
  void initState() {
    loadSharedPrefs();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> loadSharedPrefs() async {
    try {
      print("Found!");
      List<brpostmodel> user =
          brpostmodel.decode(await sharedPref.read("info"));
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Loaded!"), duration: Duration(milliseconds: 500)));
      setState(() {
        savelist = user;
      });
    } catch (Excepetion, f) {
      print("No!");
      print(Excepetion.toString());
      print(f);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Nothing Found"),
          duration: Duration(milliseconds: 500)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavBar(),
      appBar: AppBar(
        title: Text("List of Inspection Saved"),
      ),
      body: BlocConsumer<DatasendBloc, DatasendState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is DatasendLoaded) {
            return _builduserlist(context, savelist);
          } else if (state is DatasendLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is DatasendError) {
            return const ErrorScreenBuilder();
          } else {
            return _builduserlist(context, savelist);
          }
        },
      ),
    );
  }

  Widget _builduserlist(BuildContext context, List<brpostmodel> model) =>
      Center(
        child: ListView.builder(
            itemCount: model.length,
            itemBuilder: (context, index) {
              return Card(
                // color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                //     .withOpacity(1.0),
                child: ListTile(
                  title: Text('${model[index].id}'),
                  subtitle: Text('${model[index].dateofinsp}'),
                  leading: const Icon(Icons.edit_road),
                  trailing: const Icon(Icons.traffic_outlined),
                  onTap: () async {
                    try {
                      BlocProvider.of<DatasendBloc>(context)
                          .add(SendData(model[index]));
                      // showDialog(context: context, builder: (BuildContext context){
                      // return CupertinoAlertDialog(
                      //       title: const Text("Confirm"),
                      //       actions: [
                      //         CupertinoDialogAction(onPressed: () => Navigator.of(context).pop(true), child: const Text("Cancel")),

                      //         CupertinoDialogAction(onPressed:(){ Navigator.of(context).pop(true);

                      //           showDialog(context: context, builder: (BuildContext context){
                      //           return const AlertDialog(
                      //             title: Text("Success"),
                      //             content: Text("Form has been sent for approval"),
                      //           );
                      //           });
                      //         }, child: const Text("Submit")),
                      //       ],
                      //       content: const Text("Submit to Principal for Approval? "),
                      //     );
                      // });
                    } catch (e) {
                      print(e);
                    }
                  },
                ),
              );
            }),
      );

  // Widget buildInitialLayout() => Center(
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: [
  //           InputField(
  //             focusNode: nameFocus,
  //             textController: nameController,
  //             label: "Name",
  //             icons: const Icon(
  //               Icons.person,
  //               color: Colors.blue,
  //             ),
  //           ),
  //           SizedBox(height: kSpacing),
  //           InputField(
  //             focusNode: jobFocus,
  //             textController: jobController,
  //             label: "Designation",
  //             icons: const Icon(Icons.work, color: Colors.blue),
  //           ),
  //           SizedBox(height: kSpacing),
  //           SearchButtonBuilder(
  //             focusNode: searchBtnFocus,
  //             name: nameController,
  //             job: jobController,
  //           ),
  //         ],
  //       ),
  //     );
}

class ErrorScreenBuilder extends StatelessWidget {
  const ErrorScreenBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Error!",
            style: TextStyle(color: Colors.red, fontSize: 50.00),
          ),
          SizedBox(height: 15.00),
          Text(
            "Please refresh the page.",
            style: TextStyle(color: Colors.grey),
          )
        ],
      ),
    );
  }
}
