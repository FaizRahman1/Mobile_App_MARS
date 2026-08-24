import 'package:bridgeinsp_new/bridge/bloc/datasend_bloc.dart';
import 'package:bridgeinsp_new/generaloutline.dart';
import 'package:bridgeinsp_new/bridge/brpages/substructure_tab.dart';
import 'package:bridgeinsp_new/bridge/brpages/superstructuresecondary_tab.dart';
// import 'package:bridgeinsp_new/pages/photosketch_tab.dart';
import 'package:bridgeinsp_new/bridge/resources/datasent_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class InspectStructurePage extends StatefulWidget {
  static final theKey = GlobalKey<_InspectStructurePageState>();
  final String? row;
  final DateTime? date;

  InspectStructurePage({required this.row, this.date}) : super(key: theKey);

  @override
  State<InspectStructurePage> createState() => _InspectStructurePageState();
}

class _InspectStructurePageState extends State<InspectStructurePage> {
  late final SuperstructureSecondaryTab structuresecond =
      SuperstructureSecondaryTab();
  late final SubstructureTab substructure = SubstructureTab();

  @override
  void initState() {
    super.initState();
  }

  int _currentStep = 0;

  StepState _stepState(int step) {
    if (_currentStep > step) {
      return StepState.complete;
    } else {
      return StepState.editing;
    }
  }

  List<Step> _steps() => [
        Step(
          title: const Text('DRAINAGE INSPECTION PAGE',
              textAlign: TextAlign.center),
          //content: const SuperstructureSecondaryTab(),
          content: structuresecond,
          state: _stepState(0),
          isActive: _currentStep == 0,
        ),
      
        // Step(
        //   title: const Text('PHOTO/SKETCH', textAlign: TextAlign.center),
        //   content: PhotoSketchTab(),
        //   state: _stepState(3),
        //   isActive: _currentStep == 3,
        // )
      ];

  @override
  Widget build(BuildContext context) {
    final DatasendBloc PostBloc = DatasendBloc(DatasendRepos());
    return Scaffold(
      appBar: AppBar(
        //title: const Text(
        //'MARS-TEMAN\nBridge Periodic Inspection',
        title: Text(
          'drainage ID : ${widget.row}',
          style: const TextStyle(
              fontSize: 20.0,
              color: Colors.black,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w500),
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
        // backgroundColor: const Color.fromARGB(255, 175, 198, 206),
      ),
      drawer: const NavBarInspection(
          //Text(widget.bridmodel.id as String),
          ),
      body: Row(
        children: [
          Expanded(
            child: Stepper(
              type: StepperType.horizontal,
              controlsBuilder:
                  (BuildContext context, ControlsDetails controls) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      ElevatedButton(
                        //onPressed: controls.onStepContinue,
                        onPressed: () {
                          Navigator.push(
                              controls.onStepContinue as BuildContext,
                              MaterialPageRoute(
                                builder: (_) =>
                                    BlocProvider<DatasendBloc>.value(
                                        value: PostBloc,
                                        child: InspectStructurePage(
                                          row: '',
                                        )),
                              ));
                        },
                        child: const Text('SAVE RECORD'),
                      ),
                      if (_currentStep != 0)
                        TextButton(
                          onPressed: controls.onStepCancel,
                          child: const Text(
                            'BACK',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                    ],
                  ),
                );
              },
              onStepTapped: (step) => setState(() => _currentStep = step),
              onStepContinue: () {
                setState(() {
                  if (_currentStep < _steps().length - 1) {
                    _currentStep += 1;
                  } else {
                    _currentStep = 0;
                  }
                });
              },
              onStepCancel: () {
                setState(() {
                  if (_currentStep > 0) {
                    _currentStep -= 1;
                  } else {
                    _currentStep = 0;
                  }
                });
              },
              currentStep: _currentStep,
              steps: _steps(),
            ),
          ),
        ],
      ),
    );
  }
}
