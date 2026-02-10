import 'dart:convert';

import 'package:bridgeinsp_new/generaloutline.dart';
import 'package:bridgeinsp_new/models/bridgeidlist_model.dart';
import 'package:bridgeinsp_new/pages/inspection_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SelectedIdPage extends StatefulWidget {
  const SelectedIdPage({super.key, required this.title});
  final String title;

  @override
  _SelectedIdPageState createState() => _SelectedIdPageState();
}

class _SelectedIdPageState extends State<SelectedIdPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavBar(),
      appBar: AppBar(
        title: Text(
          widget.title,
          style: const TextStyle(color: Colors.deepPurple),
        ),
      ),
      body: const Save(),
    );
  }
}

class Save extends StatefulWidget {
  const Save({super.key});

  @override
  SaveView createState() => SaveView();
}

class SaveView extends State<Save> {
  SharedPref sharedPref = SharedPref();
  List<Rows> savelist = [];

  @override
  void initState() {
    loadSharedPrefs();
    super.initState();
  }

  Future<void> loadSharedPrefs() async {
    try {
      List<Rows> user = Rows.decode(await sharedPref.read("list"));
      setState(() {
        savelist = user;
      });
      // Optional: Only show "Loaded!" if list not empty
      if (savelist.isNotEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Loaded!"),
            duration: Duration(milliseconds: 500),
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text("You have not selected any Bridge ID yet!",
              style: TextStyle(fontSize: 16.0)),
          duration: const Duration(seconds: 5),
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

  Future<void> _removeItem(int index) async {
    if (index >= savelist.length || index < 0) return;

    final itemToRemove = savelist[index];

    // Remove from UI first
    setState(() {
      savelist.removeAt(index);
    });

    // Save to SharedPreferences
    try {
      String encodedData = Rows.encode(savelist);
      await sharedPref.save("list", encodedData);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Bridge ID removed'),
          duration: Duration(milliseconds: 700),
        ),
      );
    } catch (e) {
      // Revert UI if save fails
      setState(() {
        savelist.insert(index, itemToRemove);
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to delete. Please try again.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return savelist.isEmpty
        ? Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.list, size: 60, color: Colors.grey),
            SizedBox(height: 16),
            Text(
              'No selected Bridge IDs',
              style: TextStyle(fontSize: 18, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8),
            Text(
              'Go back to the Bridge ID list and select some to inspect.',
              style: TextStyle(fontSize: 14, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    )
        : _builduserlist(context, savelist);
  }

  ListView _builduserlist(BuildContext context, List<Rows> selectedIdModel) {
    return ListView.builder(
      itemCount: selectedIdModel.length,
      itemBuilder: (context, index) {
        final item = selectedIdModel[index];
        // 👇 Use a unique key based on ID to help Flutter track widgets
        return Dismissible(
          key: ObjectKey(item.id!), // ← Use ObjectKey for dynamic data
          direction: DismissDirection.endToStart,
          background: Container(
            color: Colors.red,
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.only(right: 20),
            child: const Icon(Icons.delete, color: Colors.white),
          ),
          onDismissed: (direction) async {
            await _removeItem(index);
          },
          confirmDismiss: (direction) async {
            return await showDialog<bool>(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text('Delete Bridge ID?'),
                content: Text('Are you sure you want to remove "${item.id}"?'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(true),
                    child: const Text('Delete', style: TextStyle(color: Colors.red)),
                  ),
                ],
              ),
            ) ?? false;
          },
          child: Card(
            child: ListTile(
              title: Text('${item.id}'),
              subtitle: Text('${item.dateofinsp}'),
              leading: const Icon(Icons.search_rounded),
              trailing: const Text("Tap to Inspect"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => InspectionPage(
                      row: item.id,
                      date: item.dateofinsp,
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
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