
import 'package:flutter/material.dart';

import '../model/MvvmDemoModel.dart';

class MvvmDemoViewmodel extends ChangeNotifier {
  MvvmDemoModel _model = MvvmDemoModel();

  void get(String id) async {
    var result = await _model.get(id);
    print(result.statusMessage.toString());
    // Navigator.of(navigatorKey.currentContext).pushNamed("dio");
  }
}
