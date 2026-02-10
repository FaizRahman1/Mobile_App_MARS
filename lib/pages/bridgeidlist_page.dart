// File: lib/pages/bridgeidlist_page.dart

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:bridgeinsp_new/generaloutline.dart';
import 'package:bridgeinsp_new/models/bridgeidlist_model.dart';
import 'package:bridgeinsp_new/pages/selectedid_page.dart';
import 'package:flutter/cupertino.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../bloc/bridgeidlist_bloc.dart';
import 'dart:async';

class BridgeidlistPage extends StatefulWidget {
  final String id;

  const BridgeidlistPage({Key? key, required this.id}) : super(key: key);

  @override
  State<BridgeidlistPage> createState() => _BridgeidlistPageState();
}

class _BridgeidlistPageState extends State<BridgeidlistPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final BridgeidlistBloc _newsBloc = BridgeidlistBloc();
  // Remove datarow and disrow from state, manage them within the UI logic or bloc if needed later
  // For now, they are derived from the bloc state

  Timer? _debounce;

  String btnSelect = 'Select';

  @override
  void initState() {
    // --- REVERTED: Dispatch old event ---
    _newsBloc.add(GetBridgeidList(id: widget.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text('List of Bridge Id'),
      ),
      drawer: const NavBar(),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Expanded(
            child: _buildListlist(context),
          ),
        ],
      ),
    );
  }

  // --- NEW: Extracted content widget ---
  Widget _buildListlist(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      child: BlocProvider.value(
        value: _newsBloc,
        child: BlocListener<BridgeidlistBloc, BridgeidlistState>(
          listener: (context, state) {
            if (state is BridgeidlistError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message!),
                ),
              );
            }
          },
          child: BlocBuilder<BridgeidlistBloc, BridgeidlistState>(
            // Removed buildWhen for simplicity in revert
            builder: (context, state) {
              if (state is BridgeidlistInitial || state is BridgeidlistLoading) {
                return _buildLoading();
              } else if (state is BridgeidlistLoaded) {
                // --- REVERTED: Access data using old state structure ---
                final allRows = state.bridgeidlistModel.rows ?? [];
                return _BridgeListContent(
                  allRows,
                  widget.id,
                  _scaffoldKey,
                );
              } else if (state is BridgeidlistError) {
                return Center(child: Text('Error: ${state.message}'));
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _newsBloc.close(); // Close the bloc when the widget is disposed
    _debounce?.cancel();
    super.dispose();
  }
}

// --- NEW: Stateful widget to manage the list and its filtering ---
class _BridgeListContent extends StatefulWidget {
  final List<Rows> originalData;
  final String pageId; // Pass the id down
  final GlobalKey<ScaffoldState> scaffoldKey;

  const _BridgeListContent(this.originalData, this.pageId, this.scaffoldKey);

  @override
  State<_BridgeListContent> createState() => _BridgeListContentState();
}

class _BridgeListContentState extends State<_BridgeListContent> {
  late List<Rows> _displayedRows; // Manage the filtered list here
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    _displayedRows = List.from(widget.originalData); // Initialize with original data
  }

  @override
  void didUpdateWidget(covariant _BridgeListContent oldWidget) {
    super.didUpdateWidget(oldWidget);
    // If the original data changes (e.g., refresh), update the displayed list
    if (oldWidget.originalData != widget.originalData) {
      _displayedRows = List.from(widget.originalData);
    }
  }

  void _updateModel(String value) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();

    if (value.isEmpty) {
      setState(() {
        _displayedRows = List.from(widget.originalData);
      });
      return;
    }

    _debounce = Timer(const Duration(milliseconds: 500), () {
      final filtered = widget.originalData
          .where((element) =>
              element.id!.toLowerCase().contains(value.toLowerCase()))
          .toList();
      setState(() {
        _displayedRows = filtered;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          onChanged: (value) {
            _updateModel(value);
          },
          decoration: InputDecoration(
            filled: true,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none),
            hintText: "... search bridge id",
            hintStyle: const TextStyle(fontStyle: FontStyle.italic),
            prefixIcon: const Icon(Icons.search),
            prefixIconColor: Colors.blue,
          ),
        ),
        const SizedBox(height: 10),
        // ➕ Total count indicator
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: 'Showing ',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              TextSpan(
                text: '${_displayedRows.length}',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              TextSpan(
                text: ' of ',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              TextSpan(
                text: '${widget.originalData.length}',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              TextSpan(
                text: ' bridge IDs',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 15),
        Expanded(
          child: ListView.builder(
            itemCount: _displayedRows.length,
            itemBuilder: (context, index) {
              // --- NEW: Return the extracted list item widget ---
              return _BridgeIdListItem(
                row: _displayedRows[index],
                pageId: widget.pageId,
                scaffoldKey: widget.scaffoldKey,
                // Removed updateBtnSelect as it's not needed here
              );
              // --- END OF NEW WIDGET ---
            },
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }
}

// --- NEW: Extracted list item widget ---
class _BridgeIdListItem extends StatelessWidget {
  final Rows row;
  final String pageId;
  final GlobalKey<ScaffoldState> scaffoldKey;
  // Removed updateBtnSelect parameter

  const _BridgeIdListItem({
    Key? key,
    required this.row,
    required this.pageId,
    required this.scaffoldKey,
    // removed updateBtnSelect
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(row.id ?? '',), // Text content derived from 'row' prop
        subtitle: Text(row.dateofinsp?.toString() ?? ''), // Text content derived from 'row' prop
        leading: const Icon(Icons.edit_road), // Const widget
        trailing: const Text("Select this Bridge ID?"), // Const widget
        onTap: () => _handleTap(context),
      ),
    );
  }

  // --- NEW: Handle tap logic separately ---
  Future<void> _handleTap(BuildContext context) async {
    final confirmed = await showDialog<bool>(
          context: context,
          builder: (BuildContext context) {
            return CupertinoAlertDialog(
              title: const Text("Select this Bridge ID?"),
              actions: [
                CupertinoDialogAction(
                    onPressed: () => Navigator.of(context).pop(false), // Pop with false
                    child: const Text("Cancel")),
                CupertinoDialogAction(
                    onPressed: () {
                      Navigator.of(context).pop(true); // Pop with true
                    },
                    child: const Text("Confirm")),
              ],
            );
          },
        ) ?? false; // Default to false if dialog is dismissed

    if (confirmed) {
      await _saveToSharedPrefs(row, context);
    }
  }

  // --- NEW: Move SharedPrefs logic here ---
  Future<void> _saveToSharedPrefs(Rows selectedRow, BuildContext context) async {
    final SharedPref sharedPref = SharedPref(); // Create instance here
    List<Rows>? userlist = [];

    try {
      String? listData = await sharedPref.read("list");
      if (listData != null) {
        List<Rows> user = Rows.decode(listData);
        user.add(selectedRow);
        String encodedData = Rows.encode(user);
        await sharedPref.save("list", encodedData);
      } else {
        // List doesn't exist, create new one
        userlist.add(selectedRow);
        String encodedData = Rows.encode(userlist);
        await sharedPref.save("list", encodedData);
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                content: Text("New List Will be Created"),
                duration: Duration(milliseconds: 500)));
      }
    } catch (e) {
      // Handle potential errors during decode/save more gracefully if needed
      userlist.add(selectedRow);
      String encodedData = Rows.encode(userlist);
      await sharedPref.save("list", encodedData);
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text("Data Saved (fallback)"),
              duration: Duration(milliseconds: 500)));
    }

    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text("Save!"),
            duration: Duration(milliseconds: 500)));

    // Show success dialog
    await showDialog(
        context: scaffoldKey.currentContext!,
        builder: (context) => CupertinoAlertDialog(
          title: const Text("Success"),
          actions: [
            CupertinoDialogAction(
                onPressed: () {
                  // Removed button state update call
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BridgeidlistPage(id: pageId), // Pass id again
                    ),
                  );
                },
                child: const Text(
                    "Back To Search Bridge ID")),
            CupertinoDialogAction(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                      const SelectedIdPage(
                          title: 'List of Selected Inspection '),
                    ),
                  );
                },
                child: const Text(
                    "Go to Selected Bridge ID Page")),
          ],
          content: const Text(
              "Bridge ID have successfully selected"),
        ));
  }
}
// --- END OF NEW WIDGET ---

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

Widget _buildLoading() => const Center(child: CircularProgressIndicator());