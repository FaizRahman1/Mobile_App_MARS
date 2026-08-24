import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class SummaryForm extends FormBloc<String, String> {
  final inspSummary = TextFieldBloc();
  final utilitiesCond = TextFieldBloc();

  final trafficFlow = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['Low', 'Moderate', 'Heavy'],
    initialValue: 'Low',
  );

  final showSecretField = BooleanFieldBloc();

  final secretField = TextFieldBloc(
    validators: [FieldBlocValidators.required],
  );

  SummaryForm() {
    addFieldBlocs(
      fieldBlocs: [
        inspSummary,
        utilitiesCond,
        trafficFlow,
      ],
    );
  }

  @override
  void onSubmitting() async {
    print(inspSummary.value.toString());
    print(utilitiesCond.value.toString());
    print(trafficFlow.value.toString());

    //   try {
    //     await Future<void>.delayed(const Duration(milliseconds: 500));

    //     emitSuccess();
    //   } catch (e) {
    //     emitFailure();
    //   }
    // }
  }
}

class InspectionSummaryTab extends StatelessWidget {
  InspectionSummaryTab({super.key});

  SummaryForm? formBloc;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 2000,
      child: BlocProvider(
        create: (context) => SummaryForm(),
        child: Builder(
          builder: (context) {
            final formBloc = BlocProvider.of<SummaryForm>(context);

            return Theme(
              data: Theme.of(context).copyWith(
                inputDecorationTheme: InputDecorationTheme(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              child: Scaffold(
                body: FormBlocListener<SummaryForm, String, String>(
                  child: SingleChildScrollView(
                    physics: const ClampingScrollPhysics(),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          // Inspection Summary (Optional)
                          const Text(
                            'Inspection Summary',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          TextFieldBlocBuilder(
                            textFieldBloc: formBloc.inspSummary,
                            keyboardType: TextInputType.multiline,
                            maxLines: 3,
                            decoration: const InputDecoration(
                              labelText: 'Inspection Summary (Optional)',
                              prefixIcon: Icon(Icons.summarize_rounded),
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            'Utilities Condition',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          TextFieldBlocBuilder(
                            textFieldBloc: formBloc.utilitiesCond,
                            keyboardType: TextInputType.multiline,
                            maxLines: 3,
                            decoration: const InputDecoration(
                              labelText: 'Utilities Condition',
                              prefixIcon: Icon(Icons.summarize_rounded),
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            'Traffic Flow Condition',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.trafficFlow,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Traffic Flow Condition',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          const SizedBox(height: 20.0),

                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.center,
                          //   children: [
                          //     ElevatedButton(
                          //       onPressed: formBloc.submit,
                          //       // function to save record
                          //       child: const Text('SAVE RECORD'),
                          //     ),
                          //   ],
                          // ),
                        ],
                      ),
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

  void formsumm() {
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


// SUMMARY OF INSPECTION
// Inspection Summary
// Utilites COndition 
// Traffic Flow Condition 