import 'dart:convert';
import 'package:bridgeinsp_new/bridge/brpages/furtherinvestigation_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class TestingPageTab extends StatelessWidget {
  const TestingPageTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ListFieldFormBloc(),
      child: Builder(
        builder: (context) {
          final formBloc = context.read<ListFieldFormBloc>();

          return Theme(
            data: Theme.of(context).copyWith(
              inputDecorationTheme: InputDecorationTheme(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              body: FormBlocListener<ListFieldFormBloc, String, String>(
                onSubmitting: (context, state) {
                  LoadingDialog.show(context);
                },
                onSuccess: (context, state) {
                  LoadingDialog.hide(context);

                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: SingleChildScrollView(
                        child: Text(state.successResponse!)),
                    duration: const Duration(milliseconds: 1500),
                  ));
                },
                onFailure: (context, state) {
                  LoadingDialog.hide(context);

                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.failureResponse!)));
                },
                child: SingleChildScrollView(
                  physics: const ClampingScrollPhysics(),
                  child: Column(
                    children: <Widget>[
                      BlocBuilder<ListFieldBloc<MemberFieldBloc, dynamic>,
                          ListFieldBlocState<MemberFieldBloc, dynamic>>(
                        bloc: formBloc.members,
                        builder: (context, state) {
                          if (state.fieldBlocs.isNotEmpty) {
                            return ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: state.fieldBlocs.length,
                              itemBuilder: (context, i) {
                                return MemberCard(
                                  memberIndex: i,
                                  memberField: state.fieldBlocs[i],
                                  onRemoveMember: () =>
                                      formBloc.removeMember(i),
                                );
                              },
                            );
                          }
                          return Container();
                        },
                      ),
                      const SizedBox(height: 20.0),
                      ElevatedButton(
                        onPressed: formBloc.addMember,
                        child: const Text('DECK DRAINAGE'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class ListFieldFormBloc extends FormBloc<String, String> {
  final members = ListFieldBloc<MemberFieldBloc, dynamic>(name: 'members');

  ListFieldFormBloc() {
    addFieldBlocs(
      fieldBlocs: [
        members,
      ],
    );
  }

  void addMember() {
    members.addFieldBloc(MemberFieldBloc(
      name: 'member',
      firstName: TextFieldBloc(name: 'firstName'),
      lastName: TextFieldBloc(name: 'lastName'),
    ));
  }

  void removeMember(int index) {
    members.removeFieldBlocAt(index);
  }

  @override
  void onSubmitting() async {
    // Without serialization

    emitSuccess(
      canSubmitAgain: true,
      successResponse: const JsonEncoder.withIndent('    ').convert(
        state.toJson(),
      ),
    );
  }
}

class MemberFieldBloc extends GroupFieldBloc {
  final TextFieldBloc firstName;
  final TextFieldBloc lastName;

  MemberFieldBloc({
    required this.firstName,
    required this.lastName,
    super.name,
  }) : super(fieldBlocs: [firstName, lastName]);
}

class Club {
  List<Member>? members;

  Club.fromJson(Map<String, dynamic> json) {
    if (json['members'] != null) {
      members = <Member>[];
      json['members'].forEach((v) {
        members!.add(Member.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    if (members != null) {
      data['members'] = members!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  String toString() => '''Club {
  
  members: $members
}''';
}

class Member {
  String? firstName;
  String? lastName;

  Member({this.firstName, this.lastName});

  Member.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['firstName'] = firstName;
    data['lastName'] = lastName;

    return data;
  }

  @override
  String toString() => '''Member {
  firstName: $firstName,
  lastName: $lastName,
 
}''';
}

class MemberCard extends StatelessWidget {
  final int memberIndex;
  final MemberFieldBloc memberField;

  final VoidCallback onRemoveMember;
  const MemberCard({
    super.key,
    required this.memberIndex,
    required this.memberField,
    required this.onRemoveMember,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blue[100],
      margin: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Deck Drainage #${memberIndex + 1}',
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: onRemoveMember,
                ),
              ],
            ),
            TextFieldBlocBuilder(
              textFieldBloc: memberField.firstName,
              decoration: const InputDecoration(
                labelText: 'Defect List',
              ),
            ),
            TextFieldBlocBuilder(
              textFieldBloc: memberField.lastName,
              decoration: const InputDecoration(
                labelText: 'Recommended Action',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LoadingDialog extends StatelessWidget {
  static void show(BuildContext context, {Key? key}) => showDialog<void>(
        context: context,
        useRootNavigator: false,
        barrierDismissible: false,
        builder: (_) => LoadingDialog(key: key),
      ).then((_) => FocusScope.of(context).requestFocus(FocusNode()));

  static void hide(BuildContext context) => Navigator.pop(context);

  const LoadingDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Center(
        child: Card(
          child: Container(
            width: 80,
            height: 80,
            padding: const EdgeInsets.all(12.0),
            child: const CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Icon(Icons.tag_faces, size: 100),
            const SizedBox(height: 10),
            const Text(
              'Success',
              style: TextStyle(fontSize: 54, color: Colors.black),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: () => Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) => FurtherInvestigationTab())),
              icon: const Icon(Icons.replay),
              label: const Text('AGAIN'),
            ),
          ],
        ),
      ),
    );
  }
}
