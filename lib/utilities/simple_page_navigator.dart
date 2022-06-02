import 'package:flutter/material.dart';

///Simple generic navigation function
navigateTo(BuildContext context, Widget page) {
  return Navigator.push(
    context,
    MaterialPageRoute(builder: (context) {
      return page;
    }),
  );
}

navigateReplaceTo(BuildContext context, Widget page) {
  return Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) {
      return page;
    }),
  );
}
