import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mvvm_app/resources/colors.dart';

class Uitils {
  static void fieldFocuschange(
      BuildContext context, FocusNode current, FocusNode nextfocus) {
    current.unfocus();
    FocusScope.of(context).requestFocus(nextfocus);
  }

  static toastMessage(String message) {
    Fluttertoast.showToast(
        msg: message,
        backgroundColor: Colors.black,
        fontSize: 20,
        textColor: Colors.white,
        toastLength: Toast.LENGTH_LONG);
  }

  static void flashBarErrorMessage(String message, BuildContext context) {
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          backgroundColor: AppColors.ErrorMsgColor,
          titleColor: AppColors.ErrorMsgTextColor,
          titleSize: 40.0,
          forwardAnimationCurve: Curves.decelerate,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          flushbarPosition: FlushbarPosition.TOP, // occure from top of the page
          reverseAnimationCurve: Curves.bounceInOut,
          borderRadius: BorderRadius.circular(30),
          borderColor: AppColors.ErrorMsgColor,
          positionOffset: 30,
          icon: const Icon(
            Icons.error,
            color: Colors.white,
            size: 30.0,
          ),
          duration: const Duration(seconds: 3),
          message: message,
        )..show(context));
  }

  static void flashBarSucessMessage(String message, BuildContext context) {
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          backgroundColor: AppColors.SucessMsgColor,
          titleColor: AppColors.ErrorMsgTextColor,
          titleSize: 40.0,
          forwardAnimationCurve: Curves.decelerate,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          flushbarPosition: FlushbarPosition.TOP, // occure from top of the page
          reverseAnimationCurve: Curves.bounceInOut,
          borderRadius: BorderRadius.circular(30),
          borderColor: AppColors.SucessMsgColor,
          positionOffset: 30,
          icon: const Icon(
            Icons.done_all_outlined,
            color: Colors.white,
            size: 30.0,
          ),
          duration: const Duration(seconds: 3),
          message: message,
        )..show(context));
  }

  static snakBarErrorMessage(String message, BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        message,
        style: const TextStyle(fontSize: 30),
      ),
      backgroundColor: Colors.transparent,
    ));
  }
}
