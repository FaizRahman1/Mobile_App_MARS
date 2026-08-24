import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class TDeckDrainageTab extends StatefulWidget {
  const TDeckDrainageTab({super.key});

  @override
  State<TDeckDrainageTab> createState() => _TSupersecondTabState();
}

class _TSupersecondTabState extends State<TDeckDrainageTab> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 2000,
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
                    //physics: const ClampingScrollPhysics(),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          //  -------------------- <DECK DRAINAGE> Structure, Services, Others -------------------- //
                          const Text(
                            'Deck Drainage',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          const Text('Drainage Structure (Pipe)'),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.conditionDrStructure,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Condition of Severity',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.severityLevelDrStructure,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Severity Level',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc:
                                formBloc.extendedSvLevelDrStructure,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Extended Severity Level',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          TextFieldBlocBuilder(
                            textFieldBloc: formBloc.remarksDrStructure,
                            keyboardType: TextInputType.multiline,
                            maxLines: 3,
                            decoration: const InputDecoration(
                              labelText: 'Remarks',
                              prefixIcon: Icon(Icons.note_alt_rounded),
                            ),
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          const Text('Drainage Serviceability (Pipe)'),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.conditionDrServiceability,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Condition of Severity',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc:
                                formBloc.severityLevelDrServiceability,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Severity Level',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc:
                                formBloc.extendedSvLevelDrServiceability,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Extended Severity Level',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          TextFieldBlocBuilder(
                            textFieldBloc: formBloc.remarksDrServiceability,
                            keyboardType: TextInputType.multiline,
                            maxLines: 3,
                            decoration: const InputDecoration(
                              labelText: 'Remarks',
                              prefixIcon: Icon(Icons.note_alt_rounded),
                            ),
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          const Text('Deck Drainage (Others)'),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.deckDrainageOthers,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Is there any other condition? ',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          TextFieldBlocBuilder(
                            textFieldBloc: formBloc.conditionDeckDrainageOthers,
                            keyboardType: TextInputType.multiline,
                            maxLines: 3,
                            decoration: const InputDecoration(
                              labelText: 'Please state the condition (if any)',
                              prefixIcon: Icon(Icons.note_alt_rounded),
                            ),
                          ),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc:
                                formBloc.severityLevelDeckDrainageOthers,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Severity Level',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc:
                                formBloc.extendedSvLevelDeckDrainageOthers,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Extended Severity Level',
                              prefixIcon: SizedBox(),
                            ),
                          ),
                          TextFieldBlocBuilder(
                            textFieldBloc: formBloc.remarksDeckDrainageOthers,
                            keyboardType: TextInputType.multiline,
                            maxLines: 3,
                            decoration: const InputDecoration(
                              labelText: 'Remarks',
                              prefixIcon: Icon(Icons.note_alt_rounded),
                            ),
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          DropdownFieldBlocBuilder(
                            selectFieldBloc: formBloc.elementRatingDeckDrainage,
                            itemBuilder: (context, dynamic value) =>
                                FieldItem(child: Text(value)),
                            decoration: const InputDecoration(
                              labelText: 'Element Rating',
                              prefixIcon: SizedBox(height: 10.0),
                            ),
                          ),
                          //  </DECK DRAINAGE>
                          const SizedBox(
                            height: 15.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                //buttoncontroller -- postAPI
                                onPressed: formBloc.submit,
                                child: const Text('SAVE RECORD'),
                              ),
                            ],
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

class ConditionalFieldsFormBloc extends FormBloc<String, String> {
  // DECK DRAINAGE -- STRUCTURE
  late SelectFieldBloc conditionDrStructure = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['None', 'Minor', 'Moderate', 'Severe'],
    initialValue: 'None',
  );
  final severityLevelDrStructure = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['0', '1', '2', '3'],
    initialValue: '0',
  );
  final extendedSvLevelDrStructure = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['0', '1', '2', '3'],
    initialValue: '0',
  );
  final remarksDrStructure = TextFieldBloc();

  //  DECK DRAINAGE - SERVICEABILITY
  final conditionDrServiceability = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['Clear', 'Partially Blocked', 'Blocked'],
    initialValue: 'Clear',
  );
  final severityLevelDrServiceability = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['0', '1', '2', '3'],
    initialValue: '0',
  );
  final extendedSvLevelDrServiceability = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['0', '1', '2', '3'],
    initialValue: '0',
  );
  final remarksDrServiceability = TextFieldBloc();

  // DECK DRAINAGE - OTHERS , ELEMENT RATING
  final deckDrainageOthers = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['No', 'Yes'],
    initialValue: 'No',
  );
  final conditionDeckDrainageOthers = TextFieldBloc();

  final severityLevelDeckDrainageOthers = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['0', '1', '2', '3'],
    initialValue: '0',
  );
  final extendedSvLevelDeckDrainageOthers = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['0', '1', '2', '3'],
    initialValue: '0',
  );
  final remarksDeckDrainageOthers = TextFieldBloc();

  final elementRatingDeckDrainage = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['0', '1', '2', '3'],
    initialValue: '0',
  );
// </DECK DRAINANGE>

  final showSecretField = BooleanFieldBloc();

  final secretField = TextFieldBloc(
    validators: [FieldBlocValidators.required],
  );

  //
  ConditionalFieldsFormBloc() {
    addFieldBlocs(
      //akan tambah container reflects to its parameter
      fieldBlocs: [
        conditionDrStructure,
        conditionDrServiceability,
        deckDrainageOthers,
        elementRatingDeckDrainage,
      ],
    );

    // --------------- Deck Drainage --------------- //
    conditionDrStructure.onValueChanges(
      onData: (previous, current) async* {
        removeFieldBlocs(
          fieldBlocs: [
            severityLevelDrStructure,
            extendedSvLevelDrStructure,
            remarksDrStructure,
          ],
        );

        if (current.value != 'None') {
          addFieldBlocs(fieldBlocs: [
            severityLevelDrStructure,
            extendedSvLevelDrStructure,
            remarksDrStructure,
          ]);
        }
      },
    );

    conditionDrServiceability.onValueChanges(
      onData: (previous, current) async* {
        removeFieldBlocs(
          fieldBlocs: [
            severityLevelDrServiceability,
            extendedSvLevelDrServiceability,
            remarksDrServiceability,
          ],
        );

        if (current.value != 'Clear') {
          addFieldBlocs(fieldBlocs: [
            severityLevelDrServiceability,
            extendedSvLevelDrServiceability,
            remarksDrServiceability,
          ]);
        }
      },
    );

    deckDrainageOthers.onValueChanges(
      onData: (previous, current) async* {
        removeFieldBlocs(
          fieldBlocs: [
            conditionDeckDrainageOthers,
            severityLevelDeckDrainageOthers,
            extendedSvLevelDeckDrainageOthers,
            remarksDeckDrainageOthers,
          ],
        );

        if (current.value != 'No') {
          addFieldBlocs(fieldBlocs: [
            conditionDeckDrainageOthers,
            severityLevelDeckDrainageOthers,
            extendedSvLevelDeckDrainageOthers,
            remarksDeckDrainageOthers,
          ]);
        }
      },
    );
  }

  @override
  Future<void> close() {
    elementRatingDeckDrainage.close();
    conditionDrStructure.close();

    return super.close();
  }

  @override
  void onSubmitting() async {
    debugPrint(conditionDrStructure.value);
    debugPrint(severityLevelDrStructure.value);
    debugPrint(extendedSvLevelDrStructure.value);
    debugPrint(remarksDrStructure.value);

    debugPrint(conditionDrServiceability.value);
    debugPrint(severityLevelDrServiceability.value);
    debugPrint(extendedSvLevelDrServiceability.value);
    debugPrint(remarksDrServiceability.value);

    debugPrint(deckDrainageOthers.value);
    debugPrint(conditionDeckDrainageOthers.value);
    debugPrint(severityLevelDeckDrainageOthers.value);
    debugPrint(extendedSvLevelDeckDrainageOthers.value);
    debugPrint(remarksDeckDrainageOthers.value);

    debugPrint(elementRatingDeckDrainage.value);
    //  deck drainage

    //debugPrint('Bridge ID : ${widget.row}');
    //  road furniture

    try {
      await Future<void>.delayed(const Duration(milliseconds: 500));
      emitSuccess();
    } catch (e) {
      emitFailure();
    }
  }
}

//  SUPERSTRUCTURE SECONDARY
//  - Deck Drainage
//  - Parapet or Railing
//  - Joints
//  - Abutment Approach
//  - Road Furniture
