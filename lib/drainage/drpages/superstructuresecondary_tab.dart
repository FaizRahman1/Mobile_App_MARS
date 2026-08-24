import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class StructureSecondaryForm extends FormBloc<String, String> {
  final cond_weather_condition = SelectFieldBloc<String, dynamic>(
    items: ['Fine', 'Heavy Rain', 'Intermittent Rain'],
    validators: [FieldBlocValidators.required],
  );

  final cond_siltation_inlet = SelectFieldBloc<String, dynamic>(
    items: ['OK', '>0.1D'],
    validators: [FieldBlocValidators.required],
  );

  final cond_siltation_outlet = SelectFieldBloc<String, dynamic>(
    items: ['OK', '>0.1D'],
    validators: [FieldBlocValidators.required],
  );

  final cond_vegetation_inlet = SelectFieldBloc<String, dynamic>(
    items: ['OK', '>20%'],
    validators: [FieldBlocValidators.required],
  );

  final cond_vegetation_outlet = SelectFieldBloc<String, dynamic>(
    items: ['OK', '>20%'],
    validators: [FieldBlocValidators.required],
  );

  final cond_headwall_inlet = SelectFieldBloc<String, dynamic>(
    items: ['OK', 'Damaged'],
    validators: [FieldBlocValidators.required],
  );

  final cond_headwall_outlet = SelectFieldBloc<String, dynamic>(
    items: ['OK', 'Damaged'],
    validators: [FieldBlocValidators.required],
  );

  final cond_wingwall_inlet = SelectFieldBloc<String, dynamic>(
    items: ['OK', 'Damaged'],
    validators: [FieldBlocValidators.required],
  );

  final cond_wingwall_outlet = SelectFieldBloc<String, dynamic>(
    items: ['OK', 'Damaged'],
    validators: [FieldBlocValidators.required],
  );

  final cond_sump_inlet = SelectFieldBloc<String, dynamic>(
    items: ['OK', 'Damaged'],
    validators: [FieldBlocValidators.required],
  );

  final cond_sump_outlet = SelectFieldBloc<String, dynamic>(
    items: ['OK', 'Damaged'],
    validators: [FieldBlocValidators.required],
  );

  final cond_apron_inlet = SelectFieldBloc<String, dynamic>(
    items: ['OK', 'Damaged'],
    validators: [FieldBlocValidators.required],
  );

  final cond_apron_outlet = SelectFieldBloc<String, dynamic>(
    items: ['OK', 'Damaged'],
    validators: [FieldBlocValidators.required],
  );

  final cond_incomingdrain_inlet = SelectFieldBloc<String, dynamic>(
    items: ['OK', 'Damaged'],
    validators: [FieldBlocValidators.required],
  );

  final cond_incomingdrain_outlet = SelectFieldBloc<String, dynamic>(
    items: ['OK', 'Damaged'],
    validators: [FieldBlocValidators.required],
  );

  final exp_headwall_inlet = TextFieldBloc();
  final exp_headwall_outlet = TextFieldBloc();
  final exp_wingwall_inlet = TextFieldBloc();
  final exp_wingwall_outlet = TextFieldBloc();
  final exp_sump_inlet = TextFieldBloc();
  final exp_sump_outlet = TextFieldBloc();
  final exp_apron_inlet = TextFieldBloc();
  final exp_apron_outlet = TextFieldBloc();
  final exp_incomingdrain_inlet = TextFieldBloc();
  final exp_incomingdrain_outlet = TextFieldBloc();

  final routine_defect1 = TextFieldBloc();
  final routine_defect2 = TextFieldBloc();
  final routine_defect3 = TextFieldBloc();
  final routine_defect4 = TextFieldBloc();
  final routine_defect5 = TextFieldBloc();

  final other_defect1 = TextFieldBloc();
  final other_defect2 = TextFieldBloc();
  final other_defect3 = TextFieldBloc();
  final other_defect4 = TextFieldBloc();
  final other_defect5 = TextFieldBloc();

  StructureSecondaryForm() {
    addFieldBlocs(
      fieldBlocs: [
        cond_weather_condition,
        cond_siltation_inlet,
        cond_siltation_outlet,
        cond_vegetation_inlet,
        cond_vegetation_outlet,
        cond_headwall_inlet,
        cond_headwall_outlet,
        cond_wingwall_inlet,
        cond_wingwall_outlet,
        cond_sump_inlet,
        cond_sump_outlet,
        cond_apron_inlet,
        cond_apron_outlet,
        cond_incomingdrain_inlet,
        cond_incomingdrain_outlet,
        exp_headwall_inlet,
        exp_headwall_outlet,
        exp_wingwall_inlet,
        exp_wingwall_outlet,
        exp_sump_inlet,
        exp_sump_outlet,
        exp_apron_inlet,
        exp_apron_outlet,
        exp_incomingdrain_inlet,
        exp_incomingdrain_outlet,
        routine_defect1,
        routine_defect2,
        routine_defect3,
        routine_defect4,
        routine_defect5,
        other_defect1,
        other_defect2,
        other_defect3,
        other_defect4,
        other_defect5,
      ],
    );
  }

  @override
  void onSubmitting() async {
    emitSuccess();
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
      onSuccess: (context, state) {},
      onFailure: (context, state) {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _sectionTitle('Weather Condition'),
          _dropdown(
            fieldBloc: formBloc.cond_weather_condition,
            label: 'Weather Condition',
          ),

          const SizedBox(height: 20),

          _conditionPairSection(
            context: context,
            title: 'Siltation / Debris',
            note: 'Siltation and Debris in or near Culvert\n\n'
                'D = Diameter of Pipe Culvert / Height of Box Culvert',
            inletBloc: formBloc.cond_siltation_inlet,
            outletBloc: formBloc.cond_siltation_outlet,
          ),

          _conditionPairSection(
            context: context,
            title: 'Vegetation near Culvert',
            note: 'CVegetation growth within water section\n\n'
                  'Coverage in % of waterway',
            inletBloc: formBloc.cond_vegetation_inlet,
            outletBloc: formBloc.cond_vegetation_outlet,
          ),

          _conditionPairWithExplanationSection(
            title: 'Headwall',
            inletBloc: formBloc.cond_headwall_inlet,
            outletBloc: formBloc.cond_headwall_outlet,
            inletExplanationBloc: formBloc.exp_headwall_inlet,
            outletExplanationBloc: formBloc.exp_headwall_outlet,
          ),

          _conditionPairWithExplanationSection(
            title: 'Wingwall',
            inletBloc: formBloc.cond_wingwall_inlet,
            outletBloc: formBloc.cond_wingwall_outlet,
            inletExplanationBloc: formBloc.exp_wingwall_inlet,
            outletExplanationBloc: formBloc.exp_wingwall_outlet,
          ),

          _conditionPairWithExplanationSection(
            title: 'Sump',
            inletBloc: formBloc.cond_sump_inlet,
            outletBloc: formBloc.cond_sump_outlet,
            inletExplanationBloc: formBloc.exp_sump_inlet,
            outletExplanationBloc: formBloc.exp_sump_outlet,
          ),

          _conditionPairWithExplanationSection(
            title: 'Apron',
            inletBloc: formBloc.cond_apron_inlet,
            outletBloc: formBloc.cond_apron_outlet,
            inletExplanationBloc: formBloc.exp_apron_inlet,
            outletExplanationBloc: formBloc.exp_apron_outlet,
          ),

          _conditionPairWithExplanationSection(
            title: 'Incoming Drain',
            inletBloc: formBloc.cond_incomingdrain_inlet,
            outletBloc: formBloc.cond_incomingdrain_outlet,
            inletExplanationBloc: formBloc.exp_incomingdrain_inlet,
            outletExplanationBloc: formBloc.exp_incomingdrain_outlet,
          ),

          const SizedBox(height: 20),
          _sectionTitle('Routine Defects'),
          _textField(formBloc.routine_defect1, 'Routine Defect 1'),
          _textField(formBloc.routine_defect2, 'Routine Defect 2'),
          _textField(formBloc.routine_defect3, 'Routine Defect 3'),
          _textField(formBloc.routine_defect4, 'Routine Defect 4'),
          _textField(formBloc.routine_defect5, 'Routine Defect 5'),

          const SizedBox(height: 20),
          _sectionTitle('Other Defects'),
          _textField(formBloc.other_defect1, 'Other Defect 1'),
          _textField(formBloc.other_defect2, 'Other Defect 2'),
          _textField(formBloc.other_defect3, 'Other Defect 3'),
          _textField(formBloc.other_defect4, 'Other Defect 4'),
          _textField(formBloc.other_defect5, 'Other Defect 5'),
        ],
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  Widget _dropdown({
    required SelectFieldBloc<String, dynamic> fieldBloc,
    required String label,
  }) {
    return DropdownFieldBlocBuilder<String>(
      selectFieldBloc: fieldBloc,
      itemBuilder: (context, value) => FieldItem(child: Text(value)),
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

  Widget _textField(TextFieldBloc bloc, String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextFieldBlocBuilder(
        textFieldBloc: bloc,
        maxLines: 2,
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

  Widget _disabledTextField(TextFieldBloc bloc, String label) {
    bloc.clear();

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Opacity(
        opacity: 0.45,
        child: IgnorePointer(
          ignoring: true,
          child: TextFieldBlocBuilder(
            textFieldBloc: bloc,
            maxLines: 2,
            decoration: InputDecoration(
              labelText: label,
              hintText: 'Enabled only when status is Damaged',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 14,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _conditionPairSection({
    required BuildContext context,
    required String title,
    String? note,
    required SelectFieldBloc<String, dynamic> inletBloc,
    required SelectFieldBloc<String, dynamic> outletBloc,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _sectionTitle(title),
          if (note != null) ...[
            Text(
              note,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Colors.grey,
                fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(height: 8),
          ],

          _dropdown(fieldBloc: inletBloc, label: '$title - Inlet'),
          const SizedBox(height: 12),
          _dropdown(fieldBloc: outletBloc, label: '$title - Outlet'),
        ],
      ),
    );
  }

  Widget _conditionPairWithExplanationSection({
    required String title,
    required SelectFieldBloc<String, dynamic> inletBloc,
    required SelectFieldBloc<String, dynamic> outletBloc,
    required TextFieldBloc inletExplanationBloc,
    required TextFieldBloc outletExplanationBloc,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _sectionTitle(title),

          _dropdown(
            fieldBloc: inletBloc,
            label: '$title Status - Inlet',
          ),
          const SizedBox(height: 12),

          BlocBuilder<SelectFieldBloc<String, dynamic>,
              SelectFieldBlocState<String, dynamic>>(
            bloc: inletBloc,
            builder: (context, state) {
              final isDamaged = state.value == 'Damaged';

              return isDamaged
                  ? _textField(
                inletExplanationBloc,
                '$title Remark - Inlet',
              )
                  : _disabledTextField(
                inletExplanationBloc,
                '$title Remark - Inlet',
              );
            },
          ),

          const SizedBox(height: 4),

          _dropdown(
            fieldBloc: outletBloc,
            label: '$title Status - Outlet',
          ),
          const SizedBox(height: 12),

          BlocBuilder<SelectFieldBloc<String, dynamic>,
              SelectFieldBlocState<String, dynamic>>(
            bloc: outletBloc,
            builder: (context, state) {
              final isDamaged = state.value == 'Damaged';

              return isDamaged
                  ? _textField(
                outletExplanationBloc,
                '$title Remark - Outlet',
              )
                  : _disabledTextField(
                outletExplanationBloc,
                '$title Remark - Outlet',
              );
            },
          ),
        ],
      ),
    );
  }
}