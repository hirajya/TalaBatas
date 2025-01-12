import '/backend/gemini/gemini.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'chatbot_widget.dart' show ChatbotWidget;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ChatbotModel extends FlutterFlowModel<ChatbotWidget> {
  ///  Local state fields for this page.

  String? response;

  ///  State fields for stateful widgets in this page.

  // State field(s) for Chat widget.
  FocusNode? chatFocusNode;
  TextEditingController? chatTextController;
  String? Function(BuildContext, String?)? chatTextControllerValidator;
  // Stores action output result for [Gemini - Generate Text] action in Button widget.
  String? textAIResponse;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    chatFocusNode?.dispose();
    chatTextController?.dispose();
  }
}
