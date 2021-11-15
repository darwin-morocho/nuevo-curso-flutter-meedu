import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class ProgressDialog {
  static Future<void> show(BuildContext context) {
    return showCupertinoModalPopup(
      context: context,
      builder: (_) => WillPopScope(
        child: const Material(
          color: Colors.black12,
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
        onWillPop: () async => false,
      ),
    );
  }
}
