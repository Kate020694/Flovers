import '/flutter_flow/flutter_flow_util.dart';
import 'add_new_product_widget.dart' show AddNewProductWidget;
import 'package:flutter/material.dart';

class AddNewProductModel extends FlutterFlowModel<AddNewProductWidget> {
  ///  Local state fields for this page.

  List<String> imgList = [];
  void addToImgList(String item) => imgList.add(item);
  void removeFromImgList(String item) => imgList.remove(item);
  void removeAtIndexFromImgList(int index) => imgList.removeAt(index);
  void insertAtIndexInImgList(int index, String item) =>
      imgList.insert(index, item);
  void updateImgListAtIndex(int index, Function(String) updateFn) =>
      imgList[index] = updateFn(imgList[index]);

  ///  State fields for stateful widgets in this page.

  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode4;
  TextEditingController? textController4;
  String? Function(BuildContext, String?)? textController4Validator;
  // State field(s) for Switch widget.
  bool? switchValue;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    textFieldFocusNode3?.dispose();
    textController3?.dispose();

    textFieldFocusNode4?.dispose();
    textController4?.dispose();
  }
}
