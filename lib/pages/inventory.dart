import 'package:bridgeinsp_new/bloc/bridgeinventory_bloc.dart';
import 'package:bridgeinsp_new/models/bridgeinventory_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

//import 'dart:async';

class Bridgeinventory extends StatefulWidget {
  static final theKey = GlobalKey<_BridgeinventoryState>();
  final String? row;

  Bridgeinventory({required this.row}) : super(key: theKey);

  @override
  State<Bridgeinventory> createState() => _BridgeinventoryState();
}

class _BridgeinventoryState extends State<Bridgeinventory> {
  late final BridgeinventoryBloc _newsBloc;
  List<Inventories> disrow = <Inventories>[];
  List<Inventories> datarow = <Inventories>[];

  @override
  void initState() {
    _newsBloc = BridgeinventoryBloc(utl: widget.row);
    _newsBloc.add(GetBridgeinventory());

    super.initState();
  }

  Widget DisplayBridgeinventory(List<Inventories> modelinv) {
    return ListView.builder(
        itemCount: modelinv.length,
        itemBuilder: (context, index) {
          return Card(
            child: Column(
              children: [
                Text(
                  "\nBridge ID : ${modelinv[index].bridgeid ?? 'No data recorded'}",
                  textAlign: TextAlign.left,
                  style: const TextStyle(fontSize: 15.0, letterSpacing: 0.5),
                ),
                //Text("id: ${modelinv[index].id ?? 'No data recorded'}"),
                Text(
                  "Bridge Name :  ${modelinv[index].bridgename ?? 'No data recorded'}",
                  textAlign: TextAlign.left,
                  style: const TextStyle(fontSize: 15.0, letterSpacing: 0.5),
                ),
                Text(
                  "Bridge Type : ${modelinv[index].bridgetype ?? 'No data recorded'}",
                  textAlign: TextAlign.left,
                  style: const TextStyle(fontSize: 15.0, letterSpacing: 0.5),
                ),
                Text(
                  "Section : ${modelinv[index].section ?? 'No data recorded'}",
                  textAlign: TextAlign.left,
                  style: const TextStyle(fontSize: 15.0, letterSpacing: 0.5),
                ),
                Text(
                  "No of Spans : ${modelinv[index].nospan ?? 'No data recorded'}",
                  textAlign: TextAlign.left,
                  style: const TextStyle(fontSize: 15.0, letterSpacing: 0.5),
                ),
                Text(
                  "Year Open : ${modelinv[index].yearopen ?? 'No data recorded'}\n",
                  textAlign: TextAlign.left,
                  style: const TextStyle(fontSize: 15.0, letterSpacing: 0.5),
                ),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Scaffold(
        body: Column(
          children: [
            const SizedBox(height: 20),
            Expanded(
              child: _buildBridgeinventorylist(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBridgeinventorylist(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      child: BlocProvider(
        create: (_) => _newsBloc,
        child: BlocListener<BridgeinventoryBloc, BridgeinventoryState>(
          listener: (context, state) {
            if (state is BridgeinventoryError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message!),
                ),
              );
            }
            if (state is BridgeinventoryLoaded) {
              for (int i = 0;
                  i < state.bridgeinventoryModel.rows!.length;
                  i++) {
                datarow.add(state.bridgeinventoryModel.rows![i]);
              }
              disrow = datarow;
            }

          },
          child: BlocBuilder<BridgeinventoryBloc, BridgeinventoryState>(
            builder: (context, state) {
              if (state is BridgeinventoryInitial) {
                return _buildLoading();
              } else if (state is BridgeinventoryLoading) {
                return _buildLoading();
              } else if (state is BridgeinventoryLoaded) {
                return DisplayBridgeinventory(disrow);
              } else if (state is BridgeinventoryError) {
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

  @override
  void dispose() {
    super.dispose();
  }
}

Widget _buildLoading() => const Center(child: CircularProgressIndicator());
