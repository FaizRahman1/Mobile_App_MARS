import 'package:bridgeinsp_new/bloc/datasend_bloc.dart';
import 'package:bridgeinsp_new/generaloutline.dart';
import 'package:bridgeinsp_new/models/brpost_model.dart';
import 'package:bridgeinsp_new/pages/bridgeidlist_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Add this import

import '../notification/services/notification_service.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import '../pages/inspection_detail_page.dart';

import '../resources/datasent_repository.dart';

// Add SharedPref class if not available elsewhere
class SharedPref {
  Future<String?> read(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  Future<void> save(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }
}

class RecordedInspection extends StatelessWidget {
  const RecordedInspection({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
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
      print("Attempting to load from 'info' key...");
      String? jsonString = await sharedPref.read("info"); // Read the string

      if (jsonString == null) { // Check if it's null (key doesn't exist)
        print("No data found under 'info' key.");
        // Show a different message or just return if list is empty
        // setState is usually not called in initState, but for demonstration:
        // setState(() {
        //   savelist = []; // Ensure list is empty
        // });
        if (mounted) { // Check if widget is mounted before showing snackbar
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text("No inspections saved yet.",
                  style: TextStyle(fontSize: 16.0)), // Changed message
              duration: const Duration(seconds: 5), // Shorter duration
            ),
          );
        }
        return; // Exit the try block if no data
      }

      print("Found data, attempting to decode...");
      // Decode the string into a List<brpostmodel>
      List<brpostmodel> user = brpostmodel.decode(jsonString);
      print("Decoded ${user.length} inspection(s).");
      if (mounted) { // Check if widget is mounted before showing snackbar
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Loaded!"), duration: Duration(milliseconds: 500)));
      }
      setState(() {
        savelist = user;
      });
    } catch (exception, stackTrace) { // Capture stack trace for debugging
      print("Error loading or decoding  $exception");
      print("Stack trace: $stackTrace"); // Print the stack trace
      // Handle potential JSON parsing errors or other decoding issues
      if (mounted) { // Check if widget is still mounted before showing snackbar
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Error loading  $exception", // Show specific error
                style: TextStyle(fontSize: 16.0)),
            duration: const Duration(seconds: 10),
            action: SnackBarAction(
              label: 'Close',
              onPressed: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
              },
            ),
          ),
        );
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavBar(),
      appBar: AppBar(
        title: const Text(
          "List of Inspected IDs",
          style: TextStyle(color: Colors.deepPurple),
        ),
      ),
      body: BlocConsumer<DatasendBloc, DatasendState>(
        listener: (context, state) {},
        builder: (context, state) {
          // The widget logic here might be confusing if the list is populated directly via setState
          // Consider simplifying this part to just display the savelist
          // For now, let's just use the savelist directly, ignoring the bloc state for display
          // Or ensure the bloc state is updated correctly when savelist changes
          // For simplicity, using savelist directly here:
          if (savelist.isEmpty) {
            // Show a message if the list is empty after loading
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.info_outline, size: 64, color: Colors.grey),
                  SizedBox(height: 16),
                  Text(
                    'No Inspections Found',
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Complete an inspection and save it.',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
            );
          } else {
            return _builduserlist(context, savelist);
          }
        },
      ),
    );
  }

  // Define action for swipe left
  void _sendToPrincipal(brpostmodel item) {
    print("Sending to principal: ${item.id}"); // Debug print
    // Replace with your actual logic to send data
    // Example using Bloc:
    // BlocProvider.of<DatasendBloc>(context).add(SendData(item));
    // Example showing a simple dialog:
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Send to Principal"),
          content: Text("Are you sure you want to send inspection for ID: ${item.id} to the principal?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close dialog
                // Perform the send action here
                try {
                  BlocProvider.of<DatasendBloc>(context).add(SendData(item));
                  // Optionally show a success message
                  if (mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Sent ${item.id} to principal!"))
                    );
                  }
                } catch (e) {
                  print("Error sending  $e");
                  // Optionally show an error message
                  if (mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Failed to send ${item.id}."))
                    );
                  }
                }
              },
              child: Text("Yes"),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text("No"),
            ),
          ],
        );
      },
    );
  }

  // Define action for tap (View/Edit)
void _viewOrEditInspection(brpostmodel item) {
  print("View/Edit inspection: ${item.id}"); // Debug print
  // Navigate to the new detail page
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => InspectionDetailPage(inspection: item),
    ),
  );
}


  Widget _builduserlist(BuildContext context, List<brpostmodel> model) =>
      Center(
        child: ListView.builder(
            itemCount: model.length,
            itemBuilder: (context, index) {
              brpostmodel currentItem = model[index]; // Get the item for this index
              return Dismissible(
                key: Key(currentItem.id ?? index.toString()), // Use a unique key, fallback to index if id is null
                direction: DismissDirection.startToEnd, // Allow swiping right (start to end) -> Send to Principal ONLY
                confirmDismiss: (DismissDirection direction) async {
                  if (direction == DismissDirection.startToEnd) {
                    // Confirm before sending to principal
                    return await showDialog<bool>(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("Send to Principal?"),
                          content: Text("Do you want to send the inspection for ${currentItem.id} to the principal?"),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(false), // Cancel
                              child: Text("Cancel"),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop(true); // Confirm
                                _sendToPrincipal(currentItem); // Call the action function
                              },
                              child: Text("Send"),
                            ),
                          ],
                        );
                      },
                    ) ?? false; // Default to false if dialog is dismissed
                  }
                  // If swiped left (endToStart), do nothing (return false)
                  // The tap action handles viewing/editing
                  return false;
                },
                // Background shown when swiping RIGHT
                background: Container(
                  color: Colors.red, // Background color for right swipe (start to end)
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 20.0),
                  child: Icon(Icons.send, color: Colors.white), // Icon for right swipe
                ),
                // Background shown when swiping LEFT (must be defined if background is)
                secondaryBackground: Container(
                  color: Colors.grey.shade300, // Light grey background for left swipe (no action)
                  alignment: Alignment.centerRight,
                  child: Icon(Icons.block, color: Colors.grey), // Optional icon indicating no action
                ),
                // The main list item
                child: Card(
                  //color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                  // .withOpacity(1.0),
                  child: ListTile(
                    // Add onTap action for viewing/editing
                    onTap: () => _viewOrEditInspection(currentItem), // Call the tap action function
                    title: Text('${currentItem.id ?? "Unknown ID"}'), // Handle potential null id
                    subtitle: Text('${currentItem.dateofinsp?.toString() ?? "Unknown Date"}'), // Handle potential null date
                    leading: const Icon(Icons.edit_road),
                    // You can add a trailing icon to indicate it's tappable if desired
                    trailing: const Icon(Icons.chevron_right), // Optional: indicates it's tappable
                  ),
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
