import '/flutter_flow/flutter_flow_util.dart';
import 'sleep_data_widget.dart' show SleepDataWidget;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SleepDataModel extends FlutterFlowModel<SleepDataWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  DateTime? datePicked1;
  DateTime? datePicked2;
  DateTime? datePicked3;
  // State field(s) for RatingBar widget.
  double? ratingBarValue;
  // State field(s) for Slider widget.
  double? sliderValue;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
