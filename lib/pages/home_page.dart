// ignore_for_file: use_build_context_synchronously

import 'package:bridgeinsp_new/authentication/auth.dart';
import 'package:bridgeinsp_new/generaloutline.dart';
import 'package:bridgeinsp_new/pages/bridgeidlist_page.dart';
import 'package:bridgeinsp_new/pages/recordedinspection_page.dart';
import 'package:bridgeinsp_new/pages/selectedid_page.dart';
import 'package:bridgeinsp_new/resources/datasent_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../bloc/datasend_bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class BrHomePage extends StatefulWidget {
  const BrHomePage({super.key});

  @override
  State<BrHomePage> createState() => _BrHomePageState();
}

class _BrHomePageState extends State<BrHomePage> {
  String? userToken;

  @override
  void initState() {
    super.initState();
    // Fetch the user's token when the BrHomePage is initialized
    getUserToken().then((token) {
      setState(() {
        userToken = token;
      });
    });
  }

  Future<String?> getUserToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('user_token'); // Replace with your session data key
  }

  @override
  Widget build(BuildContext context) {
    final DatasendBloc PostBloc = DatasendBloc(DatasendRepos());
    return MaterialApp(
      // theme: ThemeData(
      //     colorSchemeSeed: const Color(0xff6750a4), useMaterial3: true),
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        drawer: const NavBar(),
        appBar: AppBar(title: const Text('BRIDGE GENERAL INSPECTION')),
        body: SingleChildScrollView(
          child: Container(
            //color: Colors.deepPurple,
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: <Widget>[
                ConstrainedBox(
                    constraints: const BoxConstraints(
                        minWidth: double.infinity, minHeight: 70),
                    child: FilledButton(
                      onPressed: () async {
                        final connectivityResult =
                            await Connectivity().checkConnectivity();
                        if (connectivityResult == ConnectivityResult.none) {
                          showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (_) => NetworkErrorDialog(
                              onPressed: () async {
                                final connectivityResult =
                                    await Connectivity().checkConnectivity();
                                if (connectivityResult ==
                                    ConnectivityResult.none) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const SelectedIdPage(
                                            title:
                                                'List of Selected Bridge IDs for Inspection')),
                                  );
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text(
                                              'Connected to Internet, Please Try Again')));
                                  Navigator.pop(context);
                                }
                              },
                            ),
                          );
                        } else {
                           Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BridgeidlistPage(id: '')), // <-- NEW: Provide the id
                          );
                        }
                      },
                      child: const Text('Search Bridge ID',
                          style: TextStyle(fontSize: 15.0)),
                    )),
                const SizedBox(
                  height: 30,
                ),
                ConstrainedBox(
                    constraints: const BoxConstraints(
                        minWidth: double.infinity, minHeight: 70),
                    child: FilledButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SelectedIdPage(
                                  title: 'List of Selected Bridge IDs')),
                        );
                      },
                      child: const Text('List of Selected Bridge IDs',
                          style: TextStyle(fontSize: 15.0)),
                    )),
                const SizedBox(
                  height: 30,
                ),
                ConstrainedBox(
                    constraints: const BoxConstraints(
                        minWidth: double.infinity, minHeight: 70),
                    child: FilledButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => BlocProvider<DatasendBloc>.value(
                                value: PostBloc,
                                child: const RecordedInspection(),
                              ),
                            ));
                      },
                      child: const Text('List of Inspected Bridge IDs',
                          style: TextStyle(fontSize: 15.0)),
                    )),
                const SizedBox(
                  height: 30,
                ),
                ConstrainedBox(
                    constraints: const BoxConstraints(
                        minWidth: double.infinity, minHeight: 70),
                    child: FilledButton(
                      onPressed: () async {
                        // Show a confirmation dialog before logging out
                        final bool confirmLogout =
                            await _showLogoutConfirmationDialog(context);

                        if (confirmLogout) {
                          // Implement logout functionality and clear session data
                          await clearSessionData();
                          Navigator.of(context).pushReplacementNamed('/');
                        }
                      },
                      child: const Text('Log Out',
                          style: TextStyle(fontSize: 15.0)),
                    )),
              ],
            ),
          ),
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
            title: Text('Confirm Logout'),
            content: Text('Are you sure you want to log out?'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(false); // Cancel logout
                },
                child: Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(true); // Confirm logout
                },
                child: Text('Log Out'),
              ),
            ],
          );
        },
      ) ??
      false; // Return false if the dialog is dismissed without a choice
}

/// An example of the elevated card type.
///
/// The default settings for [Card] will provide an elevated
/// card matching the spec:
///
/// https://m3.material.io/components/cards/specs#a012d40d-7a5c-4b07-8740-491dec79d58b
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
          FilledButton(
            onPressed: onPressed,
            child: const Text("OK"),
          ),
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

  void backButton(context) {
    Navigator.pop(context);
  }
}


/// An example of the filled card type.
///
/// To make a [Card] match the filled type, the default elevation and color
/// need to be changed to the values from the spec:
///
/// https://m3.material.io/components/cards/specs#0f55bf62-edf2-4619-b00d-b9ed462f2c5a


/// An example of the outlined card type.
///
/// To make a [Card] match the outlined type, the default elevation and shape
/// need to be changed to the values from the spec:
///
/// https://m3.material.io/components/cards/specs#0f55bf62-edf2-4619-b00d-b9ed462f2c5a

