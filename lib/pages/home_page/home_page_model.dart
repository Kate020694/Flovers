import '/components/product_component/product_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:flutter/material.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for productComponent component.
  late ProductComponentModel productComponentModel1;

  @override
  void initState(BuildContext context) {
    productComponentModel1 =
        createModel(context, () => ProductComponentModel());
  }

  @override
  void dispose() {
    productComponentModel1.dispose();
  }
}
