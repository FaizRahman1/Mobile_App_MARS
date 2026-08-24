import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class StructureSecondaryForm extends FormBloc<String, String> {
  // General slope data
  final diskfilmno = TextFieldBloc();
  final photono = TextFieldBloc();
  final interfacelocation = TextFieldBloc();

  final accessibility = SelectFieldBloc<String, dynamic>(
    items: [
      '-',
      'Accessible',
      'Partially Accessible',
      'Not Accessible',
    ],
    validators: [FieldBlocValidators.required],
  );

  final accessibilitywhy = TextFieldBloc();

  // Routine works checked
  final vegetationControlForm = SelectFieldBloc<String, dynamic>(
    items: ['No', 'Yes'],
    validators: [FieldBlocValidators.required],
  );

  final vegetationControlFormdesc = TextFieldBloc();

  final drainCleaningForm = SelectFieldBloc<String, dynamic>(
    items: ['No', 'Yes'],
    validators: [FieldBlocValidators.required],
  );

  final drainCleaningFormdesc = TextFieldBloc();

  final gullyrepairform = SelectFieldBloc<String, dynamic>(
    items: ['No', 'Yes'],
    validators: [FieldBlocValidators.required],
  );

  final gullyrepairformdesc = TextFieldBloc();

  final concreterestorationform = SelectFieldBloc<String, dynamic>(
    items: ['No', 'Yes'],
    validators: [FieldBlocValidators.required],
  );

  final concreterestorationformdesc = TextFieldBloc();

  final precastconcretereplacementform =
      SelectFieldBloc<String, dynamic>(
    items: ['No', 'Yes'],
    validators: [FieldBlocValidators.required],
  );

  final precastconcretereplacementformdesc = TextFieldBloc();

  final earthdrainresectioningform =
      SelectFieldBloc<String, dynamic>(
    items: ['No', 'Yes'],
    validators: [FieldBlocValidators.required],
  );

  final earthdrainresectioningformdesc = TextFieldBloc();

  final otherroutinework = TextFieldBloc();

  final statusrm = SelectFieldBloc<String, dynamic>(
    items: [
      '-',
      'Good',
      'Average',
      'Poor',
      'Very Poor',
    ],
    validators: [FieldBlocValidators.required],
  );

  StructureSecondaryForm() {
    addFieldBlocs(
      fieldBlocs: [
        diskfilmno,
        photono,
        interfacelocation,
        accessibility,
        accessibilitywhy,
        vegetationControlForm,
        vegetationControlFormdesc,
        drainCleaningForm,
        drainCleaningFormdesc,
        gullyrepairform,
        gullyrepairformdesc,
        concreterestorationform,
        concreterestorationformdesc,
        precastconcretereplacementform,
        precastconcretereplacementformdesc,
        earthdrainresectioningform,
        earthdrainresectioningformdesc,
        otherroutinework,
        statusrm,
      ],
    );

    accessibility.updateInitialValue('-');

    vegetationControlForm.updateInitialValue('No');
    drainCleaningForm.updateInitialValue('No');
    gullyrepairform.updateInitialValue('No');
    concreterestorationform.updateInitialValue('No');
    precastconcretereplacementform.updateInitialValue('No');
    earthdrainresectioningform.updateInitialValue('No');

    statusrm.updateInitialValue('-');
  }

  @override
  Future<void> onSubmitting() async {
    try {
      emitSuccess(
        successResponse: 'Slope inspection form saved successfully.',
      );
    } catch (error) {
      emitFailure(
        failureResponse: 'Failed to save slope inspection form.',
      );
    }
  }
}

class SuperstructureSecondaryTab extends StatelessWidget {
  final StructureSecondaryForm formBloc;

  const SuperstructureSecondaryTab({
    super.key,
    required this.formBloc,
  });

  @override
  Widget build(BuildContext context) {
    return FormBlocListener<StructureSecondaryForm, String, String>(
      formBloc: formBloc,
      onSuccess: (context, state) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              state.successResponse ??
                  'Slope inspection form saved successfully.',
            ),
          ),
        );
      },
      onFailure: (context, state) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              state.failureResponse ??
                  'Failed to save slope inspection form.',
            ),
          ),
        );
      },
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /*
            |--------------------------------------------------------------------------
            | GENERAL SLOPE DATA
            |--------------------------------------------------------------------------
            */

            _sectionTitle('General Slope Data'),

            _textField(
              formBloc.diskfilmno,
              'Disk / Film No.',
              maxLines: 1,
            ),

            _textField(
              formBloc.photono,
              'Photo No.',
              maxLines: 1,
            ),

            _textField(
              formBloc.interfacelocation,
              'Soil / Rock Interface Location',
              maxLines: 1,
            ),

            _dropdown(
              fieldBloc: formBloc.accessibility,
              label: 'Accessibility',
            ),

            const SizedBox(height: 12),

            _textField(
              formBloc.accessibilitywhy,
              'Why?',
            ),

            const SizedBox(height: 20),

            /*
            |--------------------------------------------------------------------------
            | ROUTINE WORKS CHECKED
            |--------------------------------------------------------------------------
            */

            _sectionTitle('Routine Works Checked'),

            _actionRequiredField(
              title:
                  'Cutting and eradication of undesirable growths and vegetation',
              actionBloc: formBloc.vegetationControlForm,
              descriptionBloc: formBloc.vegetationControlFormdesc,
            ),

            _actionRequiredField(
              title:
                  'Desilting and clearing of debris in drain, weep holes & sumps',
              actionBloc: formBloc.drainCleaningForm,
              descriptionBloc: formBloc.drainCleaningFormdesc,
            ),

            _actionRequiredField(
              title:
                  'Filling of gullies and ground reinstatement to sides of drains',
              actionBloc: formBloc.gullyrepairform,
              descriptionBloc: formBloc.gullyrepairformdesc,
            ),

            _actionRequiredField(
              title:
                  'Minor concrete restoration (cement jointing and seal) to drains and sumps and reinstatement of collapsed drain section',
              actionBloc: formBloc.concreterestorationform,
              descriptionBloc: formBloc.concreterestorationformdesc,
            ),

            _actionRequiredField(
              title:
                  'Replacement of damaged P.C. section caused by accidents',
              actionBloc:
                  formBloc.precastconcretereplacementform,
              descriptionBloc:
                  formBloc.precastconcretereplacementformdesc,
            ),

            _actionRequiredField(
              title: 'Re-sectioning of earth drains',
              actionBloc: formBloc.earthdrainresectioningform,
              descriptionBloc:
                  formBloc.earthdrainresectioningformdesc,
            ),

            _textField(
              formBloc.otherroutinework,
              'Other Routine Works Required (Give Details)',
            ),

            _dropdown(
              fieldBloc: formBloc.statusrm,
              label: 'Status of Routine Maintenance',
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 4,
        bottom: 12,
      ),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  Widget _actionRequiredField({
    required String title,
    required SelectFieldBloc<String, dynamic> actionBloc,
    required TextFieldBloc descriptionBloc,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: 10),

          _dropdown(
            fieldBloc: actionBloc,
            label: 'Action Required',
          ),

          const SizedBox(height: 12),

          _textField(
            descriptionBloc,
            'Description of Action Required',
          ),
        ],
      ),
    );
  }

  Widget _dropdown({
    required SelectFieldBloc<String, dynamic> fieldBloc,
    required String label,
  }) {
    return DropdownFieldBlocBuilder<String>(
      selectFieldBloc: fieldBloc,
      itemBuilder: (context, value) {
        return FieldItem(
          child: Text(value),
        );
      },
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 14,
        ),
      ),
    );
  }

  Widget _textField(
    TextFieldBloc bloc,
    String label, {
    int maxLines = 2,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextFieldBlocBuilder(
        textFieldBloc: bloc,
        maxLines: maxLines,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 14,
          ),
        ),
      ),
    );
  }
}