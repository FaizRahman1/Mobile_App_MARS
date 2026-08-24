import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class ConditionalFieldsFormBloc extends FormBloc<String, String> {
  final Condition = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['Ok', 'Detected'],
    initialValue: 'Ok',
  );
  final Cond_flood_in = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['Ok', 'Detected'],
    initialValue: 'Ok',
  );
  final Cond_Debris_in = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['Ok', 'Detected'],
    initialValue: 'Ok',
  );
  final Cond_Vegetation_in = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['Ok', 'Detected'],
    initialValue: 'Ok',
  );
  final Cond_End_in = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['None', 'Minor', 'Moderate', 'Severe'],
    initialValue: 'None',
  );

  final Explain_flood_in = TextFieldBloc();
  final Explain = TextFieldBloc();
  final Explain_Debris_in = TextFieldBloc();
  final Explain_Vegatation = TextFieldBloc();

  final showSecretField = BooleanFieldBloc();

  final secretField = TextFieldBloc(
    validators: [FieldBlocValidators.required],
  );

  ConditionalFieldsFormBloc() {
    addFieldBlocs(
      fieldBlocs: [
        Cond_flood_in,
        Condition,
        Cond_Debris_in,
        Cond_Vegetation_in,
        Cond_End_in,
      ],
    );

    Condition.onValueChanges(
      onData: (previous, current) async* {
        removeFieldBlocs(
          fieldBlocs: [
            Explain,
          ],
        );

        if (current.value != 'Ok') {
          addFieldBlocs(fieldBlocs: [
            Explain,
          ]);
        }
      },
    );
    Cond_Debris_in.onValueChanges(
      onData: (previous, current) async* {
        removeFieldBlocs(
          fieldBlocs: [
            Explain_Debris_in,
          ],
        );

        if (current.value != 'Ok') {
          addFieldBlocs(fieldBlocs: [
            Explain_Debris_in,
          ]);
        }
      },
    );
    Cond_flood_in.onValueChanges(
      onData: (previous, current) async* {
        removeFieldBlocs(
          fieldBlocs: [
            Explain_flood_in,
          ],
        );

        if (current.value != 'Ok') {
          addFieldBlocs(fieldBlocs: [
            Explain_flood_in,
          ]);
        }
      },
    );
    Cond_Vegetation_in.onValueChanges(
      onData: (previous, current) async* {
        removeFieldBlocs(
          fieldBlocs: [
            Explain_Vegatation,
          ],
        );

        if (current.value != 'Ok') {
          addFieldBlocs(fieldBlocs: [
            Explain_Vegatation,
          ]);
        }
      },
    );
    Cond_End_in.onValueChanges(
      onData: (previous, current) async* {
        removeFieldBlocs(
          fieldBlocs: [
            Explain_Vegatation,
          ],
        );
        if (current.value != 'None') {
          addFieldBlocs(fieldBlocs: [
            Explain_Vegatation,
          ]);
        }
      },
    );
  }

  @override
  Future<void> close() {
    Explain.close();
    Explain_Debris_in.close();
    Explain_Vegatation.close();
    Explain_flood_in.close();

    return super.close();
  }

  @override
  void onSubmitting() async {
    debugPrint(Condition.value);
    debugPrint(Cond_flood_in.value);
    debugPrint(Cond_Debris_in.value);
    debugPrint(Cond_Vegetation_in.value);
    debugPrint(Cond_End_in.value);

    debugPrint(Explain_flood_in.value);
    debugPrint(Explain.value);
    debugPrint(Explain_Debris_in.value);
    debugPrint(Explain_Vegatation.value);

    try {
      await Future<void>.delayed(const Duration(milliseconds: 500));

      emitSuccess();
    } catch (e) {
      emitFailure();
    }
  }
}

class ConditionalFieldsForm1 extends StatelessWidget {
  const ConditionalFieldsForm1({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 900,
      child: BlocProvider(
        create: (context) => ConditionalFieldsFormBloc(),
        child: Builder(
          builder: (context) {
            final formBloc =
                BlocProvider.of<ConditionalFieldsFormBloc>(context);

            return Theme(
              data: Theme.of(context).copyWith(
                inputDecorationTheme: InputDecorationTheme(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              child: Scaffold(
                body:
                    FormBlocListener<ConditionalFieldsFormBloc, String, String>(
                  child: SingleChildScrollView(
                    physics: const ClampingScrollPhysics(),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const Text(
                            'Inlet of Culvert Condition/Explanation/Details',
                            style: TextStyle(fontSize: 30),
                          ),
                          const Text(
                            'Hydraulic Capacity',
                            style: TextStyle(fontSize: 20),
                          ),
                          const Text('High water marks indicating flood'),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.Cond_flood_in,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Condition',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          TextFieldBlocBuilder(
                            textFieldBloc: formBloc.Explain_flood_in,
                            keyboardType: TextInputType.multiline,
                            maxLines: 3,
                            decoration: const InputDecoration(
                              labelText:
                                  'Ht. of water above/below road surface in mm',
                              prefixIcon:
                                  Icon(Icons.sentiment_very_dissatisfied),
                            ),
                          ),
                          const Text('Presence of Obstruction causing ponding'),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.Condition,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Condition',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          TextFieldBlocBuilder(
                            textFieldBloc: formBloc.Explain,
                            keyboardType: TextInputType.multiline,
                            maxLines: 3,
                            decoration: const InputDecoration(
                              labelText: 'Cause',
                              prefixIcon:
                                  Icon(Icons.sentiment_very_dissatisfied),
                            ),
                          ),
                          const Text(
                            'Siltation and debris in or near Culvert',
                            style: TextStyle(fontSize: 20),
                          ),
                          const Text(
                              'Siltation/Debris D=Diameter of Pipe Culvert/Height of Box Culvert'),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.Cond_Debris_in,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Condition',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          TextFieldBlocBuilder(
                            textFieldBloc: formBloc.Explain_Debris_in,
                            keyboardType: TextInputType.multiline,
                            maxLines: 3,
                            decoration: const InputDecoration(
                              labelText: 'Ht. of Siltation in D',
                              prefixIcon:
                                  Icon(Icons.sentiment_very_dissatisfied),
                            ),
                          ),
                          const Text(
                            'Vegetation near Culvert',
                            style: TextStyle(fontSize: 20),
                          ),
                          const Text(
                              'Vegagtion growth within water section Coverage in % of waterway section'),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.Cond_Vegetation_in,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Condition',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          TextFieldBlocBuilder(
                            textFieldBloc: formBloc.Explain_Vegatation,
                            keyboardType: TextInputType.multiline,
                            maxLines: 3,
                            decoration: const InputDecoration(
                              labelText: 'Percent within Waterway area',
                              prefixIcon:
                                  Icon(Icons.sentiment_very_dissatisfied),
                            ),
                          ),
                          const Text(
                            'Scouring or Undermining',
                            style: TextStyle(fontSize: 20),
                          ),
                          const Text('At ends of culvert or edge of apron'),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.Cond_End_in,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Condition',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          const Text(
                            'Outlet of Culvert Condition/Explanation/Details',
                            style: TextStyle(fontSize: 30),
                          ),
                          const Text(
                            'Hydraulic Capacity',
                            style: TextStyle(fontSize: 20),
                          ),
                          const Text('High water marks indicating flood'),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.Cond_flood_in,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Condition',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          TextFieldBlocBuilder(
                            textFieldBloc: formBloc.Explain_flood_in,
                            keyboardType: TextInputType.multiline,
                            maxLines: 3,
                            decoration: const InputDecoration(
                              labelText:
                                  'Ht. of water above/below road surface in mm',
                              prefixIcon:
                                  Icon(Icons.sentiment_very_dissatisfied),
                            ),
                          ),
                          const Text('Presence of Obstruction causing ponding'),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.Condition,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Condition',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          TextFieldBlocBuilder(
                            textFieldBloc: formBloc.Explain,
                            keyboardType: TextInputType.multiline,
                            maxLines: 3,
                            decoration: const InputDecoration(
                              labelText: 'Cause',
                              prefixIcon:
                                  Icon(Icons.sentiment_very_dissatisfied),
                            ),
                          ),
                          const Text(
                            'Siltation and debris in or near Culvert',
                            style: TextStyle(fontSize: 20),
                          ),
                          const Text(
                              'Siltation/Debris D=Diameter of Pipe Culvert/Height of Box Culvert'),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.Cond_Debris_in,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Condition',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          TextFieldBlocBuilder(
                            textFieldBloc: formBloc.Explain_Debris_in,
                            keyboardType: TextInputType.multiline,
                            maxLines: 3,
                            decoration: const InputDecoration(
                              labelText: 'Ht. of Siltation in D',
                              prefixIcon:
                                  Icon(Icons.sentiment_very_dissatisfied),
                            ),
                          ),
                          const Text(
                            'Vegetation near Culvert',
                            style: TextStyle(fontSize: 20),
                          ),
                          const Text(
                              'Vegagtion growth within water section Coverage in % of waterway section'),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.Cond_Vegetation_in,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Condition',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          TextFieldBlocBuilder(
                            textFieldBloc: formBloc.Explain_Vegatation,
                            keyboardType: TextInputType.multiline,
                            maxLines: 3,
                            decoration: const InputDecoration(
                              labelText: 'Percent within Waterway area',
                              prefixIcon:
                                  Icon(Icons.sentiment_very_dissatisfied),
                            ),
                          ),
                          const Text(
                            'Scouring or Undermining',
                            style: TextStyle(fontSize: 20),
                          ),
                          const Text('At ends of culvert or edge of apron'),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.Cond_End_in,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Condition',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: formBloc.submit,
                            child: const Text('SUBMIT'),
                          ),
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
}
