import 'package:byte_bank_alura_app/helpers/constants.dart';
import 'package:flutter/material.dart';

class ElevatedBarButton extends StatelessWidget {
  const ElevatedBarButton(this.buttonLabel, this.onPressed, {Key? key})
      : super(key: key);
  final String buttonLabel;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: regularSize),
      child: SizedBox(
        width: double.maxFinite,
        child: ElevatedButton(child: Text(buttonLabel), onPressed: onPressed),
      ),
    );
  }
}
