import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class DrainageFormBloc extends FormBloc<String, String> {
  final Weather_cond = SelectFieldBloc<String, dynamic>(
    validators: [FieldBlocValidators.required],
    items: const ['Fine', 'Heavy Rain', 'Intermittent Rain'],
    initialValue: 'Fine',
  );

  final cond_siltation_inlet = SelectFieldBloc<String, dynamic>(
    validators: [FieldBlocValidators.required],
    items: const ['Ok', '>0.1D'],
    initialValue: 'Ok',
  );

  final cond_siltation_outlet = SelectFieldBloc<String, dynamic>(
    validators: [FieldBlocValidators.required],
    items: const ['Ok', '>0.1D'],
    initialValue: 'Ok',
  );

  final cond_vege_inlet = SelectFieldBloc<String, dynamic>(
    validators: [FieldBlocValidators.required],
    items: const ['Ok', '>20%'],
    initialValue: 'Ok',
  );

  final cond_vege_outlet = SelectFieldBloc<String, dynamic>(
    validators: [FieldBlocValidators.required],
    items: const ['Ok', '>20%'],
    initialValue: 'Ok',
  );

  final cond_headwall_inlet = SelectFieldBloc<String, dynamic>(
    validators: [FieldBlocValidators.required],
    items: const ['Ok', 'Damaged'],
    initialValue: 'Ok',
  );

  final headwall_explanation_inlet = TextFieldBloc();

  final cond_headwall_outlet = SelectFieldBloc<String, dynamic>(
    validators: [FieldBlocValidators.required],
    items: const ['Ok', 'Damaged'],
    initialValue: 'Ok',
  );

  final headwall_explanation_outlet = TextFieldBloc();

  final cond_wingwall_inlet = SelectFieldBloc<String, dynamic>(
    validators: [FieldBlocValidators.required],
    items: const ['Ok', 'Damaged'],
    initialValue: 'Ok',
  );

  final wingwall_explanation_inlet = TextFieldBloc();

  final cond_wingwall_outlet = SelectFieldBloc<String, dynamic>(
    validators: [FieldBlocValidators.required],
    items: const ['Ok', 'Damaged'],
    initialValue: 'Ok',
  );

  final wingwall_explanation_outlet = TextFieldBloc();

  final cond_sump_inlet = SelectFieldBloc<String, dynamic>(
    validators: [FieldBlocValidators.required],
    items: const ['Ok', 'Damaged'],
    initialValue: 'Ok',
  );

  final sump_explanation_inlet = TextFieldBloc();

  final cond_sump_outlet = SelectFieldBloc<String, dynamic>(
    validators: [FieldBlocValidators.required],
    items: const ['Ok', 'Damaged'],
    initialValue: 'Ok',
  );

  final sump_explanation_outlet = TextFieldBloc();

  final cond_apron_inlet = SelectFieldBloc<String, dynamic>(
    validators: [FieldBlocValidators.required],
    items: const ['Ok', 'Damaged'],
    initialValue: 'Ok',
  );

  final apron_explanation_inlet = TextFieldBloc();

  final cond_apron_outlet = SelectFieldBloc<String, dynamic>(
    validators: [FieldBlocValidators.required],
    items: const ['Ok', 'Damaged'],
    initialValue: 'Ok',
  );

  final apron_explanation_outlet = TextFieldBloc();

  final cond_incdrain_inlet = SelectFieldBloc<String, dynamic>(
    validators: [FieldBlocValidators.required],
    items: const ['Ok', 'Damaged'],
    initialValue: 'Ok',
  );

  final incdrain_explanation_inlet = TextFieldBloc();

  final cond_incdrain_outlet = SelectFieldBloc<String, dynamic>(
    validators: [FieldBlocValidators.required],
    items: const ['Ok', 'Damaged'],
    initialValue: 'Ok',
  );

  final incdrain_explanation_outlet = TextFieldBloc();

  final routinedefect1 = TextFieldBloc();
  final otherdefect1 = TextFieldBloc();
  final routinedefect2 = TextFieldBloc();
  final otherdefect2 = TextFieldBloc();
  final routinedefect3 = TextFieldBloc();
  final otherdefect3 = TextFieldBloc();
  final routinedefect4 = TextFieldBloc();
  final otherdefect4 = TextFieldBloc();
  final routinedefect5 = TextFieldBloc();
  final otherdefect5 = TextFieldBloc();

  DrainageFormBloc() {
    addFieldBlocs(
      fieldBlocs: [
        Weather_cond,
        cond_siltation_inlet,
        cond_siltation_outlet,
        cond_vege_inlet,
        cond_vege_outlet,
        cond_headwall_inlet,
        headwall_explanation_inlet,
        cond_headwall_outlet,
        headwall_explanation_outlet,
        cond_wingwall_inlet,
        wingwall_explanation_inlet,
        cond_wingwall_outlet,
        wingwall_explanation_outlet,
        cond_sump_inlet,
        sump_explanation_inlet,
        cond_sump_outlet,
        sump_explanation_outlet,
        cond_apron_inlet,
        apron_explanation_inlet,
        cond_apron_outlet,
        apron_explanation_outlet,
        cond_incdrain_inlet,
        incdrain_explanation_inlet,
        cond_incdrain_outlet,
        incdrain_explanation_outlet,
        routinedefect1,
        otherdefect1,
        routinedefect2,
        otherdefect2,
        routinedefect3,
        otherdefect3,
        routinedefect4,
        otherdefect4,
        routinedefect5,
        otherdefect5,
      ],
    );
  }

  @override
  Future<void> close() {
    Weather_cond.close();
    cond_siltation_inlet.close();
    cond_siltation_outlet.close();
    cond_vege_inlet.close();
    cond_vege_outlet.close();
    cond_headwall_inlet.close();
    headwall_explanation_inlet.close();
    cond_headwall_outlet.close();
    headwall_explanation_outlet.close();
    cond_wingwall_inlet.close();
    wingwall_explanation_inlet.close();
    cond_wingwall_outlet.close();
    wingwall_explanation_outlet.close();
    cond_sump_inlet.close();
    sump_explanation_inlet.close();
    cond_sump_outlet.close();
    sump_explanation_outlet.close();
    cond_apron_inlet.close();
    apron_explanation_inlet.close();
    cond_apron_outlet.close();
    apron_explanation_outlet.close();
    cond_incdrain_inlet.close();
    incdrain_explanation_inlet.close();
    cond_incdrain_outlet.close();
    incdrain_explanation_outlet.close();
    routinedefect1.close();
    otherdefect1.close();
    routinedefect2.close();
    otherdefect2.close();
    routinedefect3.close();
    otherdefect3.close();
    routinedefect4.close();
    otherdefect4.close();
    routinedefect5.close();
    otherdefect5.close();
    return super.close();
  }

  @override
  void onSubmitting() async {
    print(Weather_cond.value.toString());

    print(cond_siltation_inlet.value.toString());
    print(cond_siltation_outlet.value.toString());

    print(cond_vege_inlet.value.toString());
    print(cond_vege_outlet.value.toString());

    print(cond_headwall_inlet.value.toString());
    print(headwall_explanation_inlet.value.toString());
    print(cond_headwall_outlet.value.toString());
    print(headwall_explanation_outlet.value.toString());

    print(cond_wingwall_inlet.value.toString());
    print(wingwall_explanation_inlet.value.toString());
    print(cond_wingwall_outlet.value.toString());
    print(wingwall_explanation_outlet.value.toString());

    print(cond_sump_inlet.value.toString());
    print(sump_explanation_inlet.value.toString());
    print(cond_sump_outlet.value.toString());
    print(sump_explanation_outlet.value.toString());

    print(cond_apron_inlet.value.toString());
    print(apron_explanation_inlet.value.toString());
    print(cond_apron_outlet.value.toString());
    print(apron_explanation_outlet.value.toString());

    print(cond_incdrain_inlet.value.toString());
    print(incdrain_explanation_inlet.value.toString());
    print(cond_incdrain_outlet.value.toString());
    print(incdrain_explanation_outlet.value.toString());

    print(routinedefect1.value.toString());
    print(otherdefect1.value.toString());
    print(routinedefect2.value.toString());
    print(otherdefect2.value.toString());
    print(routinedefect3.value.toString());
    print(otherdefect3.value.toString());
    print(routinedefect4.value.toString());
    print(otherdefect4.value.toString());
    print(routinedefect5.value.toString());
    print(otherdefect5.value.toString());

    emitSuccess();
  }
}

class DrainageFormTab extends StatefulWidget {
  DrainageFormTab({super.key});

  final DrainageFormBloc formBloc = DrainageFormBloc();

  @override
  State<DrainageFormTab> createState() => _DrainageFormTabState();
}

class _DrainageFormTabState extends State<DrainageFormTab>
    with AutomaticKeepAliveClientMixin<DrainageFormTab> {
  @override
  bool get wantKeepAlive => true;

  @override
  void dispose() {
    widget.formBloc.close();
    super.dispose();
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4.0, top: 6.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _subTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _dropdownField({
    required SelectFieldBloc<String, dynamic> bloc,
    String? labelText,
  }) {
    return DropdownFieldBlocBuilder<String>(
      selectFieldBloc: bloc,
      itemBuilder: (context, value) => FieldItem(child: Text(value)),
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: const SizedBox(),
      ),
    );
  }

  Widget _textField({
    required TextFieldBloc bloc,
    required String labelText,
    int maxLines = 3,
  }) {
    return TextFieldBlocBuilder(
      textFieldBloc: bloc,
      keyboardType: TextInputType.multiline,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: const Icon(Icons.note_alt_rounded),
      ),
    );
  }

  Widget _simpleInletOutletSection({
    required String sectionTitle,
    required SelectFieldBloc<String, dynamic> inletBloc,
    required SelectFieldBloc<String, dynamic> outletBloc,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionTitle(sectionTitle),
        const Text('Inlet'),
        _dropdownField(
          bloc: inletBloc,
          labelText: 'Defects',
        ),
        const SizedBox(height: 5.0),
        const Text('Outlet'),
        _dropdownField(
          bloc: outletBloc,
          labelText: 'Defects',
        ),
        const SizedBox(height: 15.0),
      ],
    );
  }

  Widget _explanationInletOutletSection({
    required String sectionTitle,
    required SelectFieldBloc<String, dynamic> inletBloc,
    required TextFieldBloc inletExplanationBloc,
    required SelectFieldBloc<String, dynamic> outletBloc,
    required TextFieldBloc outletExplanationBloc,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionTitle(sectionTitle),
        const Text('Inlet'),
        _dropdownField(
          bloc: inletBloc,
          labelText: 'Defects',
        ),
        _textField(
          bloc: inletExplanationBloc,
          labelText: 'Explanation',
        ),
        const SizedBox(height: 5.0),
        const Text('Outlet'),
        _dropdownField(
          bloc: outletBloc,
          labelText: 'Defects',
        ),
        _textField(
          bloc: outletExplanationBloc,
          labelText: 'Explanation',
        ),
        const SizedBox(height: 15.0),
      ],
    );
  }

  Widget _defectPair({
    required String title,
    required TextFieldBloc routineBloc,
    required TextFieldBloc otherBloc,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _subTitle(title),
        _textField(
          bloc: routineBloc,
          labelText: 'Routine Defect',
        ),
        _textField(
          bloc: otherBloc,
          labelText: 'Other Defect',
        ),
        const SizedBox(height: 10.0),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return SizedBox(
      height: 2200,
      child: BlocProvider<DrainageFormBloc>.value(
        value: widget.formBloc,
        child: Builder(
          builder: (context) {
            final formBloc = BlocProvider.of<DrainageFormBloc>(context);

            return Theme(
              data: Theme.of(context).copyWith(
                inputDecorationTheme: InputDecorationTheme(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              child: Scaffold(
                body: FormBlocListener<DrainageFormBloc, String, String>(
                  onSubmitting: (context, state) {
                    LoadingDialog.show(context);
                  },
                  onSuccess: (context, state) {
                    LoadingDialog.hide(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Drainage form submitted'),
                      ),
                    );
                  },
                  onFailure: (context, state) {
                    LoadingDialog.hide(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(state.failureResponse ?? 'Failed'),
                      ),
                    );
                  },
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          _sectionTitle('Weather Condition'),
                          _dropdownField(
                            bloc: formBloc.Weather_cond,
                            labelText: 'Weather',
                          ),
                          const SizedBox(height: 15.0),

                          _simpleInletOutletSection(
                            sectionTitle: 'Siltation',
                            inletBloc: formBloc.cond_siltation_inlet,
                            outletBloc: formBloc.cond_siltation_outlet,
                          ),

                          _simpleInletOutletSection(
                            sectionTitle: 'Vegetation',
                            inletBloc: formBloc.cond_vege_inlet,
                            outletBloc: formBloc.cond_vege_outlet,
                          ),

                          _explanationInletOutletSection(
                            sectionTitle: 'Headwall',
                            inletBloc: formBloc.cond_headwall_inlet,
                            inletExplanationBloc:
                                formBloc.headwall_explanation_inlet,
                            outletBloc: formBloc.cond_headwall_outlet,
                            outletExplanationBloc:
                                formBloc.headwall_explanation_outlet,
                          ),

                          _explanationInletOutletSection(
                            sectionTitle: 'Wingwall',
                            inletBloc: formBloc.cond_wingwall_inlet,
                            inletExplanationBloc:
                                formBloc.wingwall_explanation_inlet,
                            outletBloc: formBloc.cond_wingwall_outlet,
                            outletExplanationBloc:
                                formBloc.wingwall_explanation_outlet,
                          ),

                          _explanationInletOutletSection(
                            sectionTitle: 'Sump',
                            inletBloc: formBloc.cond_sump_inlet,
                            inletExplanationBloc:
                                formBloc.sump_explanation_inlet,
                            outletBloc: formBloc.cond_sump_outlet,
                            outletExplanationBloc:
                                formBloc.sump_explanation_outlet,
                          ),

                          _explanationInletOutletSection(
                            sectionTitle: 'Apron',
                            inletBloc: formBloc.cond_apron_inlet,
                            inletExplanationBloc:
                                formBloc.apron_explanation_inlet,
                            outletBloc: formBloc.cond_apron_outlet,
                            outletExplanationBloc:
                                formBloc.apron_explanation_outlet,
                          ),

                          _explanationInletOutletSection(
                            sectionTitle: 'Incoming Drain',
                            inletBloc: formBloc.cond_incdrain_inlet,
                            inletExplanationBloc:
                                formBloc.incdrain_explanation_inlet,
                            outletBloc: formBloc.cond_incdrain_outlet,
                            outletExplanationBloc:
                                formBloc.incdrain_explanation_outlet,
                          ),

                          _sectionTitle('Summary of Inspection'),

                          _defectPair(
                            title: 'Defect 1',
                            routineBloc: formBloc.routinedefect1,
                            otherBloc: formBloc.otherdefect1,
                          ),
                          _defectPair(
                            title: 'Defect 2',
                            routineBloc: formBloc.routinedefect2,
                            otherBloc: formBloc.otherdefect2,
                          ),
                          _defectPair(
                            title: 'Defect 3',
                            routineBloc: formBloc.routinedefect3,
                            otherBloc: formBloc.otherdefect3,
                          ),
                          _defectPair(
                            title: 'Defect 4',
                            routineBloc: formBloc.routinedefect4,
                            otherBloc: formBloc.otherdefect4,
                          ),
                          _defectPair(
                            title: 'Defect 5',
                            routineBloc: formBloc.routinedefect5,
                            otherBloc: formBloc.otherdefect5,
                          ),

                          const SizedBox(height: 20),
                          SubmitForm(formBloc: formBloc),
                          const SizedBox(height: 20),
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

class SubmitForm extends StatelessWidget {
  const SubmitForm({super.key, required this.formBloc});

  final DrainageFormBloc formBloc;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: formBloc.submit,
      child: const Text('SUBMIT'),
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
                MaterialPageRoute(builder: (_) => const SizedBox()),
              ),
              icon: const Icon(Icons.replay),
              label: const Text('AGAIN'),
            ),
          ],
        ),
      ),
    );
  }
}