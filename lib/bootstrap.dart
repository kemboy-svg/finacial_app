import 'dart:async';
import 'dart:developer';
import 'package:flutter/widgets.dart';

import 'package:data_api/data_api.dart';
import 'package:auth_repo/auth_repo.dart';
import 'package:invst_repo/invst_repo.dart';

import 'app.dart';

void bootstrap({required DataApi dataApi}) {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  final authRepo = AuthRepo(dataApi: dataApi);
  final invRepo = InvstRepo(dataApi: dataApi);

  runZonedGuarded(
    () => runApp(App(authRepo: authRepo,invRepo: invRepo,)),
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}