import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToast({
  required String message,
  required ToastState state,
})=> Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 5,
    backgroundColor: taostColor(state),
    textColor: Colors.white,
    fontSize: 16.0);


enum ToastState {
  success,error,warning
}

Color? taostColor(ToastState state){
  Color color;
  switch(state){
    case ToastState.success:
      color = Colors.green;
      break;
    case ToastState.error:
      color = Colors.red;
      break;
    case ToastState.warning:
      color = Colors.orange;
      break;

  }
  return color;





}