import 'package:bridgeinsp_new/slope/bloc/slopeinventory_bloc.dart';
import 'package:bridgeinsp_new/slope/slmodels/slopeinventory_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

//import 'dart:async';

class Slopeinventory extends StatefulWidget {
  final String? row;

  const Slopeinventory({super.key, required this.row});

  @override
  State<Slopeinventory> createState() => _SlopeinventoryState();
}

class _SlopeinventoryState extends State<Slopeinventory> {
  late final SlopeinventoryBloc _newsBloc;
  List<Inventories> disrow = <Inventories>[];
  List<Inventories> datarow = <Inventories>[];

  @override
  void initState() {
    _newsBloc = SlopeinventoryBloc(utl: widget.row);
    _newsBloc.add(GetSlopeinventory());

    super.initState();
  }

  Widget DisplaySlopeinventory(List<Inventories> modelinv) {
    return ListView.builder(
      itemCount: modelinv.length,
      itemBuilder: (context, index) {
        return Card(
          child: Column(
            children: [
              Text(
                "\nSlope ID : ${modelinv[index].slopeid ?? 'No data recorded'}",
                textAlign: TextAlign.left,
                style: const TextStyle(fontSize: 15.0, letterSpacing: 0.5),
              ),
              //Text("id: ${mod.    elinv[index].id ?? 'No data recorded'}"),
              Text(
                "Bridge Name :  ${modelinv[index].bridgename ?? 'No data recorded'}",
                textAlign: TextAlign.left,
                style: const TextStyle(fontSize: 15.0, letterSpacing: 0.5),
              ),
              Text(
                "Section : ${modelinv[index].section ?? 'No data recorded'}",
                textAlign: TextAlign.left,
                style: const TextStyle(fontSize: 15.0, letterSpacing: 0.5),
              ),
              // Text(
              //   "No of Spans : ${modelinv[index].nospan ?? 'No data recorded'}",
              //   textAlign: TextAlign.left,
              //   style: const TextStyle(fontSize: 15.0, letterSpacing: 0.5),
              // ),
              // Text(
              //   "Year Open : ${modelinv[index].yearopen ?? 'No data recorded'}\n",
              //   textAlign: TextAlign.left,
              //   style: const TextStyle(fontSize: 15.0, letterSpacing: 0.5),
              // ),
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
            Expanded(child: _buildSlopeinventorylist(context)),
          ],
        ),
      ),
    );
  }

  Widget _buildSlopeinventorylist(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      child: BlocProvider.value(
        value: _newsBloc,
        child: BlocListener<SlopeinventoryBloc, SlopeinventoryState>(
          listener: (context, state) {
            if (state is SlopeinventoryError) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.message!)));
            }
            if (state is SlopeinventoryLoaded) {
              datarow
                ..clear()
                ..addAll(
                  state.slopeinventoryModel.rows ?? const <Inventories>[],
                );
              disrow = List<Inventories>.from(datarow);
            }
          },
          child: BlocBuilder<SlopeinventoryBloc, SlopeinventoryState>(
            builder: (context, state) {
              if (state is SlopeinventoryInitial) {
                return _buildLoading();
              } else if (state is SlopeinventoryLoading) {
                return _buildLoading();
              } else if (state is SlopeinventoryLoaded) {
                return disrow.isEmpty
                    ? const Center(
                        child: Text('No General Data found for this slope ID.'),
                      )
                    : DisplaySlopeinventory(disrow);
              } else if (state is SlopeinventoryError) {
                return Center(
                  child: Text(state.message ?? 'Unable to load slope data.'),
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
