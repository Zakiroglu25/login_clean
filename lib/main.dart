import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'lzyct_app.dart';

void main() {
  () async {
    WidgetsFlutterBinding.ensureInitialized();

    /// Register Service locator
    // await serviceLocator();
    // await FirebaseServices.init();

    return SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ],
    ).then((_) => runApp(LzyctApp()));
  };
}
