// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:mvvm_app/resources/colors.dart';

class RoundButton extends StatelessWidget {
  final FocusNode Focusnode;
  final String title;
  final bool loading;
  final VoidCallback onPress;

  const RoundButton(
      {super.key,
      required this.title,
      required this.Focusnode,
      this.loading = false,
      required this.onPress});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 1;
    final Widget = MediaQuery.sizeOf(context).width * 1;
    return InkWell(
      focusColor: Colors.transparent,
      autofocus: false,
      focusNode: Focusnode,
      onTap: onPress,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          height: height * .05,
          width: Widget * .6,
          decoration: BoxDecoration(
              color: AppColors.ButtonColor,
              borderRadius: BorderRadius.circular(10)),
          child: Center(
              child: loading
                  ? const CircularProgressIndicator(
                      color: Colors.white,
                    )
                  : Text(
                      title,
                      style: const TextStyle(
                          fontSize: 20, color: AppColors.WhiteColor),
                    )),
        ),
      ),
    );
  }
}
