import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


Widget defaultAnotherButton({
  double? width ,
  Color backgroundColor = Colors.blue,
  bool isUpperCase = true,
  double radius = 15,
  required Function() onPressed,
  required String text,
}) =>
    Container(
      width: width,
      height: 50.0,
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          radius,
        ),
        color: backgroundColor,
      ),
    );


void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
  context,
  MaterialPageRoute(
    builder: (BuildContext context) => widget,
  ),
      (route) => false,
);

void navigateTo(context, widget) => Navigator.push(
  context,
  MaterialPageRoute(
    builder: (BuildContext context) => widget,
  ),
);



// void showToast({
//   required String text,
//   required ToastStates state,
// }) {
//   Fluttertoast.showToast(
//       msg: text,
//       toastLength: Toast.LENGTH_LONG,
//       gravity: ToastGravity.BOTTOM,
//       timeInSecForIosWeb: 3,
//       backgroundColor: chooseColor(state),
//       textColor: Colors.white,
//       fontSize: 16.0);
// }
//
// enum ToastStates { SUCCESS, ERROR, WARNING }
//
// Color chooseColor(ToastStates state) {
//   Color color;
//   switch (state) {
//     case ToastStates.SUCCESS:
//       return color = Colors.green;
//       break;
//     case ToastStates.ERROR:
//       return color = Colors.red;
//       break;
//     case ToastStates.WARNING:
//       return color = Colors.amber;
//       break;
//   }
//   return color;
// }