import 'package:bridgeinsp_new/bridge/bloc/t_dd_bloc.dart';
import 'package:bridgeinsp_new/bridge/brmodels/t_dd_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TDdGetPage extends StatefulWidget {
  const TDdGetPage({super.key});

  @override
  _TDdGetPageState createState() => _TDdGetPageState();
}

class _TDdGetPageState extends State<TDdGetPage> {
  final TDdBloc _newsBloc = TDdBloc();

  @override
  void initState() {
    _newsBloc.add(GetTDeckDrainageList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Deck Drainage List')),
      body: _buildListCovid(),
    );
  }

  Widget _buildListCovid() {
    return Container(
      margin: EdgeInsets.all(8.0),
      child: BlocProvider(
        create: (_) => _newsBloc,
        child: BlocListener<TDdBloc, TDdState>(
          listener: (context, state) {
            if (state is TDdError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message!),
                ),
              );
            }
          },
          child: BlocBuilder<TDdBloc, TDdState>(
            builder: (context, state) {
              if (state is TDdInitial) {
                return _buildLoading();
              } else if (state is TDdLoading) {
                return _buildLoading();
              } else if (state is TDdLoaded) {
                return _buildCard(context, state.tdeckdrainageModel);
              } else if (state is TDdError) {
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

  Widget _buildCard(BuildContext context, TDeckDrainageModel model) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.all(8.0),
          child: Card(
            child: Container(
              margin: EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Text("ID: ${model.id}"),
                  Text("Date of Inspection: ${model.dateofinspection}"),
                  Text(
                      "Date of Last Inspection: ${model.dateoflastinspection}"),
                  Text("Deck Drainage Condition: ${model.deckOtherCondition}"),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildLoading() => Center(child: CircularProgressIndicator());
}
