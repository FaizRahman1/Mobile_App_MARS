import 'package:bridgeinsp_new/bridge/bloc/bridgeinventory_bloc.dart';
import 'package:bridgeinsp_new/bridge/brmodels/bridgeinventory_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

//import 'dart:async';

class Bridgeinventory extends StatefulWidget {
  final String? row;

  const Bridgeinventory({super.key, required this.row});

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
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Scaffold(
        body: Column(
          children: [
            const SizedBox(height: 20),
            Expanded(child: _buildBridgeinventorylist(context)),
          ],
        ),
      ),
    );
  }

  Widget _buildBridgeinventorylist(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      child: BlocProvider.value(
        value: _newsBloc,
        child: BlocListener<BridgeinventoryBloc, BridgeinventoryState>(
          listener: (context, state) {
            if (state is BridgeinventoryError) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.message!)));
            }
            if (state is BridgeinventoryLoaded) {
              datarow
                ..clear()
                ..addAll(
                  state.bridgeinventoryModel.rows ?? const <Inventories>[],
                );
              disrow = List<Inventories>.from(datarow);
            }
          },
          child: BlocBuilder<BridgeinventoryBloc, BridgeinventoryState>(
            builder: (context, state) {
              if (state is BridgeinventoryInitial) {
                return _buildLoading();
              } else if (state is BridgeinventoryLoading) {
                return _buildLoading();
              } else if (state is BridgeinventoryLoaded) {
                return disrow.isEmpty
                    ? const Center(
                        child: Text(
                          'No General Data found for this bridge ID.',
                        ),
                      )
                    : DisplayBridgeinventory(disrow);
              } else if (state is BridgeinventoryError) {
                return Center(
                  child: Text(state.message ?? 'Unable to load bridge data.'),
                );
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
    _newsBloc.close();
    super.dispose();
  }
}

Widget _buildLoading() => const Center(child: CircularProgressIndicator());
