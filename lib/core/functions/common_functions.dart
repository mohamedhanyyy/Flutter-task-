import 'package:flutter/cupertino.dart';

class CommonFunctions {
 static void navigate({
    required String routeName,
    required BuildContext context,
  }) {
    Navigator.of(context).pushNamed(routeName);
  }

static  void navigateReplacement({
    required String routeName,
    required BuildContext context,
  }) {
    Navigator.of(context).pushReplacementNamed(routeName);
  }
}
