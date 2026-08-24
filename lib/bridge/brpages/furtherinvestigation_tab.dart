
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class ListFieldFormBloc extends FormBloc<String, String> {
  final fi_defect1 = TextFieldBloc();
  final fi_action1 = TextFieldBloc();
  final fi_defect2 = TextFieldBloc();
  final fi_action2 = TextFieldBloc();
  final fi_defect3 = TextFieldBloc();
  final fi_action3 = TextFieldBloc();

  final boolean1 = BooleanFieldBloc();
  final boolean2 = BooleanFieldBloc();

  ListFieldFormBloc() {
    addFieldBlocs(fieldBlocs: [
      fi_defect1,
      fi_action1,
      fi_defect2,
      fi_action2,
      fi_defect3,
      fi_action3,
    ]);
  }

  @override
  void onSubmitting() async {
    print(fi_defect1.value.toString());
    print(fi_action1.value.toString());
    print(fi_defect2.value.toString());
    print(fi_action2.value.toString());
    print(fi_defect3.value.toString());
    print(fi_action3.value.toString());
  }
}

class FurtherInvestigationTab extends StatelessWidget {
  FurtherInvestigationTab({super.key});

  ListFieldFormBloc? formBloc;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 2000,
      child: BlocProvider(
        create: (context) => ListFieldFormBloc(),
        child: Builder(
          builder: (context) {
            formBloc = BlocProvider.of<ListFieldFormBloc>(context);

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
                  /*
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
                  */
                  child: SingleChildScrollView(
                    physics: const ClampingScrollPhysics(),
                    child: Column(
                      children: <Widget>[
                        const Text(
                          'Further Investigation',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        TextFieldBlocBuilder(
                          textFieldBloc: formBloc!.fi_defect1,
                          decoration: const InputDecoration(
                            labelText: 'Defect List',
                          ),
                        ),
                        TextFieldBlocBuilder(
                          textFieldBloc: formBloc!.fi_action1,
                          decoration: const InputDecoration(
                            labelText: 'Recommended Action',
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        TextFieldBlocBuilder(
                          textFieldBloc: formBloc!.fi_defect2,
                          decoration: const InputDecoration(
                            labelText: 'Defect List',
                          ),
                        ),
                        TextFieldBlocBuilder(
                          textFieldBloc: formBloc!.fi_action2,
                          decoration: const InputDecoration(
                            labelText: 'Recommended Action',
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        TextFieldBlocBuilder(
                          textFieldBloc: formBloc!.fi_defect3,
                          decoration: const InputDecoration(
                            labelText: 'Defect List',
                          ),
                        ),
                        TextFieldBlocBuilder(
                          textFieldBloc: formBloc!.fi_action3,
                          decoration: const InputDecoration(
                            labelText: 'Recommended Action',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void formfi() {
    formBloc!.submit;
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
