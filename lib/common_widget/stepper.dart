import 'package:flutter/material.dart';

class StepperWidget extends StatefulWidget {
  @override
  _StepperWidgetState createState() => _StepperWidgetState();
}

class _StepperWidgetState extends State<StepperWidget> {

  // no work well
  int currentStep = 0;

  bool complete = false;
  bool isActive = true;

  @override
  Widget build(BuildContext context) {
    List<Step> steps = [
      Step(
        title: Text("Create New account"),
        isActive: isActive,
        state: complete ? StepState.complete : StepState.editing,
        content: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(hintText: "email"),
            ),
            TextFormField(
              decoration: InputDecoration(hintText: "password"),
            ),
          ],
        ),
      ),
      Step(
        title: Text("Additional Information"),
        isActive: isActive,
        state: complete ? StepState.complete : StepState.editing,
        content: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(hintText: "address"),
            ),
            TextFormField(
              decoration: InputDecoration(hintText: "Telephone"),
            ),
          ],
        ),
      ),
      Step(
        title: Text("Bank Account"),
        isActive: isActive,
        state: complete ? StepState.complete : StepState.editing,
        content: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(hintText: "bank"),
            ),
          ],
        ),
      ),
    ];

    goTo(int step) {
      setState(() => currentStep = step);
    }

    next() {
      currentStep + 1 != steps.length
          ? goTo(currentStep + 1)
          : setState(() => complete = true);
    }

    cancel() {
      if (currentStep > 0) {
        goTo(currentStep - 1);
      }
    }

    return Stepper(
      steps: steps,
      currentStep: currentStep,
      onStepContinue: next,
      onStepTapped: (step) => goTo(step),
      onStepCancel: cancel,
    );
  }
}
